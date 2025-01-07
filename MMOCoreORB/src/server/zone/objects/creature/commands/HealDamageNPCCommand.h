/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef HEALDAMAGENPCCOMMAND_H
#define HEALDAMAGENPCCOMMAND_H

#include "TendCommand.h"

class TendDamageCommand : public TendCommand {
public:

	HealDamageNPCCommand(const String& name, ZoneProcessServer* server)
			: TendCommand(name, server) {
		effectName = "clienteffect/healing_healdamage.cef";

		mindCost = 50;
		mindWoundCost = 0;

		tendDamage = true;
        tendWound = true;

		healthHealed = 1000;
		actionHealed = 1000;

		//defaultTime = 5.0;
		range = 6.0;
	}

};

#endif //HEALDAMAGENPCCOMMAND_H
