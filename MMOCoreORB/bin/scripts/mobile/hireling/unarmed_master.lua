unarmed_master = Creature:new {
	objectName = "@mob/creature_names:teras_kasi_master",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	level = 35,
	chanceHit = 0.5,
	damageMin = 110,
	damageMax = 900,
	baseXp = 62,
	baseHAM = 1500,
	baseHAMmax = 2000,
	armor = 0,
	resists = {90,90,90,90,90,90,90,-1,-1},
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

	templates = {"commoner"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "melee_weapons",
	secondaryWeapon = "unarmed",
	conversationTemplate = "",
    reactionStf = "@npc_reaction/slang",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = tkamaster,
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(unarmed_master, "unarmed_master")