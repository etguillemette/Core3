/*
 * ResourcePurchaseImplementation.cpp
 *
 *  Created on: May 31, 2024
 *      Author: Ethan
 */

#include "server/zone/objects/tangible/deed/resource/ResourcePurchase.h"
#include "server/zone/managers/resource/ResourceManager.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/sui/callbacks/ResourcePurchaseSuiCallback.h"

#include "server/zone/packets/object/ObjectMenuResponse.h"

void ResourcePurchaseImplementation::initializeTransientMembers() {
	DeedImplementation::initializeTransientMembers();

	setLoggingName("ResourcePurchase");
}

void ResourcePurchaseImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	DeedImplementation::fillObjectMenuResponse(menuResponse, player);

	menuResponse->addRadialMenuItem(20, 3, "@ui_radial:item_use"); //use
}

int ResourcePurchaseImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	if (selectedID != 20) // not use object
		return 1;

	if (player != nullptr)
		useObject(player);

	return 0;
}

int ResourcePurchaseImplementation::useObject(CreatureObject* creature) {
	if (creature == nullptr)
		return 0;

	if (!isASubChildOf(creature))
		return 0;

	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

	if (ghost == nullptr || ghost->hasSuiBoxWindowType(SuiWindowType::FREE_RESOURCE)) {
		//ghost->closeSuiWindowType(SuiWindowType::FREE_RESOURCE);
		ghost->removeSuiBoxType(SuiWindowType::FREE_RESOURCE);

		return 0;
	}

	ManagedReference<ResourceManager*> resourceManager = server->getZoneServer()->getResourceManager();

	ManagedReference<SuiListBox*> sui = new SuiListBox(creature, SuiWindowType::FREE_RESOURCE);
	sui->setUsingObject(_this.getReferenceUnsafeStaticCast());
	sui->setCallback(new ResourcePurchaseSuiCallback(server->getZoneServer(), "Resource", creature));
	sui->setPromptTitle("@veteran:resource_title"); //Resources
	sui->setPromptText("@veteran:choose_class"); //Choose resource class
	sui->setOtherButton(true, "@back");
	sui->setCancelButton(true, "@cancel");
	sui->setOkButton(true, "@ok");

	resourceManager->addNodeToListBox(sui, "resource");

	ghost->addSuiBox(sui);
	creature->sendMessage(sui->generateMessage());

	return 1;
}

void ResourcePurchaseImplementation::destroyDeed() {
	if (parent.get() != nullptr) {
		destroyObjectFromWorld(true);
	}

	if (isPersistent())
		destroyObjectFromDatabase(true);

	generated = true;
}
