/*
 * ResourceDeedSuiCallback.h
 *
 *  Created on: Aug 17, 2011
 *      Author: crush
 */

#ifndef RESOURCEDEEDSUICALLBACK_H_
#define RESOURCEDEEDSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"


class ResourceDeedSuiCallback : public SuiCallback {
	String nodeName;
	int purchaseQuantity; //Ethan edit 6-4-24 (RESOURCE VENDOR)

public:
	ResourceDeedSuiCallback(ZoneServer* serv, const String& name, const int quantity) : SuiCallback(serv) { //Ethan edit 6-4-24 (RESOURCE VENDOR) ..(added quantity)
		nodeName = name;
		purchaseQuantity = quantity; //Ethan edit 6-4-24 (RESOURCE VENDOR)
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!sui->isListBox() || cancelPressed)
			return;

		SuiListBox* listBox = cast<SuiListBox*>( sui);

		ManagedReference<SceneObject*> obj = sui->getUsingObject().get();

		if (obj == nullptr)
			return;

		ResourceDeed* deed = cast<ResourceDeed*>( obj.get());

		if (deed == nullptr)
			return;

		ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

		if (inventory == nullptr || !deed->isASubChildOf(inventory)) //No longer in inventory.
			return;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return;

		bool backPressed = false;
		int index = -1;

		try {
			backPressed = Bool::valueOf(args->get(0).toString());
			index = Integer::valueOf(args->get(1).toString());
		} catch (Exception& e) {
			creature->error("Invalid parameters passed to ResourceDeedSuiCallback.");
			return;
		}

		ManagedReference<ResourceManager*> resourceManager = creature->getZoneServer()->getResourceManager();

		if (backPressed) {
			if(nodeName == "Resources" || nodeName == "Resource")
				return;

			listBox->setPromptTitle("@veteran:resource_title");
			listBox->setPromptText("@veteran:choose_class");

			listBox->removeAllMenuItems();

			nodeName = resourceManager->addParentNodeToListBox(listBox, nodeName);

		} else if(cancelPressed)
			return;
		else {

			ManagedReference<ResourceSpawn*> spawn = resourceManager->getResourceSpawn(nodeName);

			//They chose the resource, eat the deed and give them what they want...fuck it.
			if (spawn != nullptr) {
				
				//Ethan edit 6-4-24 (RESOURCE VENDOR) ... I think below is where I would fold everything into another menu, this one for choosing crate size
				/*
				listBox->removeAllMenuItems();
				listBox->setPromptTitle("@obj_attr_n:quantity");
				listBox->setPromptText("@player_structure:select_amount");

				listBox->addMenuItem(100);
				listBox->addMenuItem(500);
				listBox->addMenuItem(1000);
				listBox->addMenuItem(5000);
				listBox->addMenuItem(10000);
				listBox->addMenuItem(50000);
				listBox->addMenuItem(100000);
				//End Ethan edit 6-4-24 (RESOURCE VENDOR)
				*/

				Locker clocker(deed, creature);
				deed->destroyDeed();
				clocker.release();

				//Ethan edit 6-1-24 (RESOURCE VENDOR)

				int cash = creature->getBankCredits();
				spawn = resourceManager->getResourceSpawn(nodeName);

				if(spawn == nullptr){
					return;
				}
				
				int price = spawn->evaluatePrice() * purchaseQuantity;

				if (price > cash) {
					StringIdChatParameter ptnsfw("base_player", "prose_buy_fail"); // You were unable to purchase %TO. Perhaps you do not have enough credits?
					ptnsfw.setTO("crate of "+ nodeName);
					creature->sendSystemMessage(ptnsfw);
					return;
				}
				else {
					StringIdChatParameter ptnsfw("base_player", "You successfully purchase a crate of %TT for %DI credits"); //You successfully purchase a %TT for %DI credits.
					ptnsfw.setTT(nodeName);
					ptnsfw.setDI(price);
					creature->sendSystemMessage(ptnsfw);
					creature->subtractBankCredits(price);
					resourceManager->givePlayerResource(creature, nodeName, purchaseQuantity); ////Ethan edit 6-4-24 (RESOURCE VENDOR) This section was moved here, also changed the quantity from "ResourceManager::RESOURCE_DEED_QUANTITY"
				}

				//Ethan edit 6-1-24 (RESOURCE VENDOR)
				return;
			}

			if(index >= 0 && index < listBox->getMenuSize()) {
				nodeName = listBox->getMenuItemName(index);

				int costIndex = nodeName.indexOf(" (");

				if(costIndex != -1){
					nodeName = nodeName.subString(0,costIndex);
				}

				listBox->removeAllMenuItems();

				spawn = resourceManager->getResourceSpawn(nodeName); //Check again, this means they are looking at stats.
				
				if (spawn != nullptr) {
					//spawn->addStatsToDeedListBox(listBox);
					spawn->evaluatePurchaseListBox(listBox); //Ethan edit 6-1-24 (RESOURCE VENDOR)

				} else {
					//if(spawn->hasSpawns) { //Ethan edit 6-4-24 (RESOURCE VENDOR)
					resourceManager->addNodeToListBox(listBox, nodeName); //Ethan edit 6-4-24 (RESOURCE VENDOR) .. This was moved here
					//} //Ethan edit 6-4-24 (RESOURCE VENDOR)
				}
			}
		}

		ghost->addSuiBox(listBox);
		creature->sendMessage(listBox->generateMessage());
	}
};

#endif /* RESOURCEDEEDSUICALLBACK_H_ */
