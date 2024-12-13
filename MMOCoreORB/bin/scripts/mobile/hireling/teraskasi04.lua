teraskasi04 = Creature:new {
	objectName = "@mob/creature_names:brawler",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	level = 30,
	chanceHit = 0.5,
	damageMin = 180,
	damageMax = 540,
	baseXp = 3000,
	baseHAM = 2500,
	baseHAMmax = 3500,
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
	armor = 0,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_unarmed_trainer_01.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "vibroknuckler",
	secondaryWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = teraskasi04,
	secondaryAttacks = {},
}

CreatureTemplates:addCreatureTemplate(teraskasi04,"teraskasi04")