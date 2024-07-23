brawler_mid = Creature:new {
	objectName = "@mob/creature_names:brawler",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	level = 15,
	chanceHit = 0.5,
	damageMin = 160,
	damageMax = 220,
	baseXp = 62,
	baseHAM = 750,
	baseHAMmax = 1250,
	armor = 0,
	resists = {30,30,30,30,30,30,30,-1,-1},
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
	primaryAttacks = brawlermid,
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(brawler_mid, "brawler_mid")