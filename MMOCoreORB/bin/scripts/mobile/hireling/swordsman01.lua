swordsman01 = Creature:new {
	objectName = "@mob/creature_names:roughneck",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = normal,
	level = 10,
	chanceHit = 0.4,
	damageMin = 69,
	damageMax = 207,
	baseXp = 300,
	baseHAM = 1750,
	baseHAMmax = 2750,
	armor = 0,
	resists = {10,10,10,10,10,10,10,-1,-1},
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
	armor = 0,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_2handsword_trainer_01.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "none",
	secondaryWeapon = "th_sword_scythe",
	thrownWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { },
	secondaryAttacks = brawlermid,
	defaultAttack = "melee2hhit1",
}

CreatureTemplates:addCreatureTemplate(swordsman01,"swordsman01")