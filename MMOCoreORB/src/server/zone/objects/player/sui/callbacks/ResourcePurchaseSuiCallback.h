/*
 * ResourcePurchaseSuiCallback.h
 *
 *  Created on: Jun 6, 2024
 *      Author: Ethan_G
 */

#ifndef RESOURCEPURCHASESUICALLBACK_H_
#define RESOURCEPURCHASESUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"


class ResourcePurchaseSuiCallback : public SuiCallback {
	String nodeName;
	bool purchaseScreen;

public:
	ResourcePurchaseSuiCallback(ZoneServer* serv, const String& name) : SuiCallback(serv) { //Ethan edit 6-4-24 (RESOURCE VENDOR) ..(added quantity)
		nodeName = name;
		purchaseScreen = false;
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
			
			ManagedReference<ResourceSpawn*> spawn = resourceManager->getResourceSpawn(nodeName);

			String screenStr;
			if(purchaseScreen == true){
				screenStr = "true";
			}
			else{
				screenStr = "false";
			}

			StringIdChatParameter ptnsfwa("Test","Test nodeName = %TO, and index = %DI. PurchaseScreen = %TT");
			ptnsfwa.setTO(nodeName);
			ptnsfwa.setDI(index);
			ptnsfwa.setTT(screenStr);
			creature->sendSystemMessage(ptnsfwa);

			int qtyIndex = nodeName.indexOf("|"); //Ethan edit 6-4-24 (RESOURCE VENDOR) //10
			int price = 0;
				

			//Is there a "|" in the nodeName, therefore we're looking at purchase options?
			if(screenStr == "true"){
				
				StringIdChatParameter ptnsfwp("Test","!!!In purchase screen");
				creature->sendSystemMessage(ptnsfwp);

				if(qtyIndex != -1){
					nodeName = nodeName.subString(0,qtyIndex);
					StringIdChatParameter ptnsfw("Test","qtyIndex == %DI... nodeName = %TO");
					ptnsfw.setTO(nodeName);
					ptnsfw.setDI(qtyIndex);
					creature->sendSystemMessage(ptnsfw);
				}

				int purchaseQuantity = 0;
				if(index >= 0){
					//If purchase options are listed, therefore the purchase quantity is 10^index
					purchaseQuantity = index * std::pow(10,index+1);
					StringIdChatParameter ptnsfw("Test","Index is == %DI... purchaseQuantity = %TT");
					ptnsfw.setDI(index);
					ptnsfw.setTT(purchaseQuantity);
					creature->sendSystemMessage(ptnsfw);
				}
				else{
					StringIdChatParameter ptnsfw("Test","Index null...");
					creature->sendSystemMessage(ptnsfw);
				}
				
				int cash = creature->getBankCredits();
				spawn = resourceManager->getResourceSpawn(nodeName);

				int price = 0;
				if(spawn != nullptr){
					price = spawn->evaluatePrice() * purchaseQuantity;
					StringIdChatParameter ptnsfw("Test","Spawn is valid. Price == %DI...");
					ptnsfw.setDI(price);
					creature->sendSystemMessage(ptnsfw);
				}
				else{
					StringIdChatParameter ptnsfw("Test","Spawn is null");
					creature->sendSystemMessage(ptnsfw);
				}

				if (price > cash && price > 0) {
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

				purchaseScreen = false;
			}

			//"Spawn" exists because we're on the "SHOW STATS" screen, we're not on the quantity list screen, and have hit OK
			if (spawn != nullptr && purchaseScreen == false) {


				StringIdChatParameter ptnsfws("Test","Show stats screen because spawn exists");
				ptnsfws.setTO(nodeName);
				ptnsfws.setDI(index);
				creature->sendSystemMessage(ptnsfws);

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

				purchaseScreen = true;

				//End Ethan edit 6-4-24 (RESOURCE VENDOR)
				//return; Should this return??? I don't think it should
			}

			//Hit OK, but we're not on a spawn, so we're on a resource tree node.. 
			//There are list options, and we hit an option that's at least 0 and no more than the max menu item size
			if(index >= 0 && index < listBox->getMenuSize()) {

				StringIdChatParameter ptnsfwi("Test","index is bigger than 0. Qty index = %TT");
				ptnsfwi.setTT(qtyIndex);
				creature->sendSystemMessage(ptnsfwi);
				
				nodeName = listBox->getMenuItemName(index);
				int costIndex = nodeName.indexOf(" (");

				if(costIndex != -1){
					nodeName = nodeName.subString(0,costIndex);
					StringIdChatParameter ptnsfw("Test","CostIndex != -1... Substring = %TT");
					ptnsfw.setTT(costIndex);
					creature->sendSystemMessage(ptnsfw);
				}

				listBox->removeAllMenuItems();

				spawn = resourceManager->getResourceSpawn(nodeName); //Check again, this means they are looking at stats.
				
				//The spawn name, with the " (" removed exists, so we much be looking at stats
				if (spawn != nullptr) {
					StringIdChatParameter ptnsfw("Test","Looking at stats");
					creature->sendSystemMessage(ptnsfw);
					//spawn->addStatsToDeedListBox(listBox);
					spawn->evaluatePurchaseListBox(listBox); //Ethan edit 6-1-24 (RESOURCE VENDOR)

				} 
				//The spawn name doesn't exist, so we much be cycling through the different branches of the resource map tree
				else {
                    //if(resourceManager->hasSpawns(nodeName)) {
                    StringIdChatParameter ptnsfw("Test","Different branches");
					creature->sendSystemMessage(ptnsfw);
					resourceManager->addNodeToListBox(listBox, nodeName);
					//} 
				}
			}
		}

		ghost->addSuiBox(listBox);
		creature->sendMessage(listBox->generateMessage());
	}
};

#endif /* RESOURCEPURCHASESUICALLBACK_H_ */
