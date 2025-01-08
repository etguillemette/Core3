bountyhunter03 = Creature:new {
	objectName = "@mob/creature_names:bounty_hunter",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = "normal",
	level = 15,
	chanceHit = 0.6,
	damageMin = 127,
	damageMax = 381,
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

	templates = {"object/mobile/dressed_bountyhunter_trainer_01.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "rifle_lightning",
	secondaryWeapon = "none",
	thrownWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",


	personalityStf = "none",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = bountyhunternovice,
	secondaryAttacks = { },
	defaultAttack = "firelightningsingle1",
}

CreatureTemplates:addCreatureTemplate(bountyhunter03,"bountyhunter03")