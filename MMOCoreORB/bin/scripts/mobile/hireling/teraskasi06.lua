teraskasi06 = Creature:new {
	objectName = "@mob/creature_names:brawler",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = "normal",
	level = 30,
	chanceHit = 2.5,
	damageMin = 388,
	damageMax = 564,
	baseXp = 5000,
	baseHAM = 3000,
	baseHAMmax = 4000,
	armor = 0,
	resists = {85,85,85,85,85,85,85,-1,-1},
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
	secondaryWeapon = "blacksun_razor",
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

CreatureTemplates:addCreatureTemplate(teraskasi06,"teraskasi06")