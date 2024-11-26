commando_novice = Creature:new {
	objectName = "@mob/creature_names:commando",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	level = 25,
	chanceHit = 0.5,
	damageMin = 200,
	damageMax = 260,
	baseXp = 62,
	baseHAM = 2000,
	baseHAMmax = 3000,
	armor = 0,
	resists = {60,60,60,60,60,60,60,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_mercenary_commander_zab_m.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "commando_ranged",
	secondaryWeapon = "none",
	conversationTemplate = "",
    reactionStf = "@npc_reaction/slang",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = commandonovice,
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(commando_novice, "commando_novice")
