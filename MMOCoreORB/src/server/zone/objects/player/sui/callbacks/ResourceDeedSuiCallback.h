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
		//BACK BUTTON
		if (backPressed) {
			if(nodeName == "Resources" || nodeName == "Resource")
				return;

			listBox->setPromptTitle("@veteran:resource_title");
			listBox->setPromptText("@veteran:choose_class");

			listBox->removeAllMenuItems();

			nodeName = resourceManager->addParentNodeToListBox(listBox, nodeName);

		} 
		//CANCEL BUTTON
		else if(cancelPressed)
			return;
		
		//OKAY BUTTON;
		else {
			//Ethan edit 6-4-24 (RESOURCE VENDOR)
			int qtyIndex = nodeName.indexOf("|"); //Ethan edit 6-4-24 (RESOURCE VENDOR) //10
			int price = 0;
			
			ManagedReference<ResourceSpawn*> spawn = resourceManager->getResourceSpawn(nodeName);

			

			//"Spawn" exists because we're on the "SHOW STATS" screen, we're not on the quantity list screen, and have hit OK
			if (spawn != nullptr && qtyIndex == -1) {

				if(spawn == nullptr){
					return;
				}

				spawn = resourceManager->getResourceSpawn(nodeName);
				int price = spawn->evaluatePrice();

				//Ethan edit 6-4-24 (RESOURCE VENDOR) ... I think below is where I would fold everything into another menu, this one for choosing crate size
				listBox->removeAllMenuItems();
				listBox->setPromptTitle("Resource Purchase");
				listBox->setPromptText("Select the quantity");

				listBox->addMenuItem(nodeName + "| (10u for " + (price*10) + "c)",0);
				listBox->addMenuItem(nodeName + "| (100u for " + (price*100) + "c)",1);
				listBox->addMenuItem(nodeName + "| (1000u for " + (price*1000) + "c)",2);
				listBox->addMenuItem(nodeName + "| (10000u for " + (price*10000) + "c)",3);
				listBox->addMenuItem(nodeName + "| (100000u for " + (price*100000) + "c)",4);
				//End Ethan edit 6-4-24 (RESOURCE VENDOR)
				//return; Should this return??? I don't think it should


				//Is there a "|" in the nodeName, therefore we're looking at purchase options?
				if(qtyIndex != -1){
					nodeName = nodeName.subString(0,qtyIndex+1);

					//If purchase options are listed, therefore the purchase quantity is 10^index
					int purchaseQuantity = index * std::pow(10,index);
					
					int cash = creature->getBankCredits();
					spawn = resourceManager->getResourceSpawn(nodeName);
					
					price = spawn->evaluatePrice() * purchaseQuantity;

					if (price > cash) {
						StringIdChatParameter ptnsfw("Purchase Failed", "You were unable to purchase %TO, because you do not have at least %DI credits in your bank."); // You were unable to purchase %TO. Perhaps you do not have enough credits?
						ptnsfw.setTO("crate of "+ nodeName);
						ptnsfw.setDI(price);
						creature->sendSystemMessage(ptnsfw);
						return;
					}
					else {
						Locker clocker(deed, creature); //Ethan edit moved this here
						deed->destroyDeed(); //Ethan edit moved this here
						clocker.release(); //Ethan edit moved this here

						StringIdChatParameter ptnsfw("Purchase Successful", "You successfully purchase a crate of %TT for %DI credits"); //You successfully purchase a %TT for %DI credits.
						ptnsfw.setTT(nodeName);
						ptnsfw.setDI(price);
						creature->sendSystemMessage(ptnsfw);
						creature->subtractBankCredits(price);
						resourceManager->givePlayerResource(creature, nodeName, purchaseQuantity); ////Ethan edit 6-4-24 (RESOURCE VENDOR) This section was moved here, also changed the quantity from "ResourceManager::RESOURCE_DEED_QUANTITY"
						return;
					}
				}
				//End Ethan edit 6-4-24 (RESOURCE VENDOR)

			}

			//Hit OK, but we're not on a spawn, so we're on a resource tree node.. 
			//There are list options, and we hit an option that's at least 0 and no more than the max menu item size
			if(index >= 0 && index < listBox->getMenuSize()) {
				nodeName = listBox->getMenuItemName(index);

				int costIndex = nodeName.indexOf(" (");

				if(costIndex != -1){
					nodeName = nodeName.subString(0,costIndex);
				}

				listBox->removeAllMenuItems();

				spawn = resourceManager->getResourceSpawn(nodeName); //Check again, this means they are looking at stats.
				
				//The spawn name, with the " (" removed exists, so we much be looking at stats
				if (spawn != nullptr) {
					//spawn->addStatsToDeedListBox(listBox);
					spawn->evaluatePurchaseListBox(listBox); //Ethan edit 6-1-24 (RESOURCE VENDOR)

				} 
				//The spawn name doesn't exist, so we much be cycling through the different branches of the resource map tree
				else {
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
