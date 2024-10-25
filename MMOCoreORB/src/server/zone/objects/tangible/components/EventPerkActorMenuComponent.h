/*
* EventPerkActorMenuComponent.h
*
* 2024-04-23
* By: Hakry
*
*/

#ifndef EVENTPERKACTORMENUCOMPONENT_H_
#define EVENTPERKACTORMENUCOMPONENT_H_

#include "server/zone/objects/tangible/components/EventPerkMenuComponent.h"

class EventPerkActorMenuComponent : public EventPerkMenuComponent {
public:
	/**
	 * Fills the radial options, needs to be overriden
	 * @pre { this object is locked }
	 * @post { this object is locked, menuResponse is complete}
	 * @param menuResponse ObjectMenuResponse that will be sent to the client
	 */
	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;

	/**
	 * Handles the radial selection sent by the client, must be overriden by inherited objects
	 * @pre { this object is locked, player is locked }
	 * @post { this object is locked, player is locked }
	 * @param player PlayerCreature that selected the option
	 * @param selectedID selected menu id
	 * @returns 0 if successfull
	 */
	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;

};

#endif /* EVENTPERKACTORMENUCOMPONENT_H_ */
