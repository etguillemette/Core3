teraskasi05 = Creature:new {
	objectName = "@mob/creature_names:brawler",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = "normal",
	level = 25,
	chanceHit = 2.25,
	damageMin = 265,
	damageMax = 795,
	baseXp = 4000,
	baseHAM = 2750,
	baseHAMmax = 3750,
	armor = 0,
	resists = {80,80,80,80,80,80,80,-1,-1},
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

	templates = {"object/mobile/dressed_unarmed_trainer_03.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "none",
	secondaryWeapon = "general_unarmed",
	thrownWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/fancy",


	personalityStf = "none",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { },
	secondaryAttacks = merge(brawlermaster,tkamaster),
	defaultAttack = "unarmedspinattack2",
}

CreatureTemplates:addCreatureTemplate(teraskasi05,"teraskasi05")