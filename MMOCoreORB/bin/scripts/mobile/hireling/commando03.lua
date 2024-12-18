commando03 = Creature:new {
	objectName = "@mob/creature_names:commando",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	level = 25,
	chanceHit = 0.5,
	damageMin = 146,
	damageMax = 438,
	baseXp = 2000,
	baseHAM = 1750,
	baseHAMmax = 2750,
	armor = 0,
	resists = {50,50,50,50,50,50,50,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	tamingChance = 0,
	milk = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	armor = 1,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_commando_trainer_human_male_01.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "rifle_flame_thrower",
	secondaryWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = commandonovice,
	secondaryAttacks = { },
}

CreatureTemplates:addCreatureTemplate(commando03,"commando03")