swordsman03 = Creature:new {
	objectName = "@mob/creature_names:roughneck",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = normal,
	level = 25,
	chanceHit = 0.85,
	damageMin = 78,
	damageMax = 234,
	baseXp = 2000,
	baseHAM = 2250,
	baseHAMmax = 3250,
	armor = 0,
	resists = {66,66,66,66,66,66,66,-1,-1},
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

	templates = {"object/mobile/dressed_2handsword_trainer_02.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "none",
	secondaryWeapon = "th_sword_maul",
	thrownWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { },
	secondaryAttacks = merge(brawlermaster,swordsmannovice),
	defaultAttack = "melee2hhit2",
}

CreatureTemplates:addCreatureTemplate(swordsman03,"swordsman03")