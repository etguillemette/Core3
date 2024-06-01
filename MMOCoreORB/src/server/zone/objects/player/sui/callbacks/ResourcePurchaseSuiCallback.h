/*
 * ResourceDeedSuiCallback.h
 *
 *  Created on: May 31, 2024
 *      Author: Ethan_G
 */

#ifndef RESOURCEPURCHASESUICALLBACK_H_
#define RESOURCEPURCHASESUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"


class ResourcePurchaseSuiCallback : public SuiCallback {
	String nodeName;

public:
	ResourcePurchaseSuiCallback(ZoneServer* serv, const String& name, CreatureObject* creature) : SuiCallback(serv) {
		nodeName = name;
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (!sui->isListBox() || cancelPressed)
			return;

		SuiListBox* listBox = cast<SuiListBox*>( sui);

		ManagedReference<SceneObject*> obj = sui->getUsingObject().get();

		if (obj == nullptr)
			return;

		ResourcePurchase* deed = cast<ResourcePurchase*>( obj.get());

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
			creature->error("Invalid parameters passed to ResourcePurchaseSuiCallback.");
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
				

                int amount = spawn->evaluatePrice() * 10000;
				CreatureObject* player = creature;

                //STOLEN FROM THE TIP COMMAND SUI CALLBACK

                // Player must have sufficient funds including surcharge
                int cash = player->getBankCredits();

                if ((amount) > cash) {
                    StringIdChatParameter ptnsfw("base_player", "dispenser:insufficient_funds"); // You do not have %DI credits (surcharge included) to tip the desired amount to %TT.
                    ptnsfw.setDI(amount);
                    player->sendSystemMessage(ptnsfw);
                    return;
                }

                player->subtractBankCredits(amount);
                //END STOLEN FROM THE TIP COMMAND SUI CALLBACK
                
                Locker clocker(deed, creature);
				deed->destroyDeed();
				clocker.release();

				resourceManager->givePlayerResource(creature, nodeName, ResourceManager::RESOURCE_DEED_QUANTITY);

				return;
			}

			if(index >= 0 && index < listBox->getMenuSize()) {
				nodeName = listBox->getMenuItemName(index);

				listBox->removeAllMenuItems();

				spawn = resourceManager->getResourceSpawn(nodeName); //Check again, this means they are looking at stats.
				if (spawn != nullptr) {
					spawn->evaluatePurchaseListBox(listBox);
                    int price = spawn->evaluatePrice(); //Ethan edit 5-31-24 (RESOURCE VENDOR)
                    listBox->setOkButton(true,"Cost = " + price); //Ethan edit 5-31-24 (RESOURCE VENDOR)
				} else {
					resourceManager->addNodeToListBox(listBox, nodeName);
				}
			}
		}

		ghost->addSuiBox(listBox);
		creature->sendMessage(listBox->generateMessage());
	}
};

#endif /* RESOURCEPURCHASESUICALLBACK_H_ */
