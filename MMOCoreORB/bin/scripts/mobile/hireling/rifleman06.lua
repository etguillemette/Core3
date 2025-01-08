rifleman06 = Creature:new {
	objectName = "@mob/creature_names:sharpshooter",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = "normal",
	level = 30,
	chanceHit = 2.2,
	damageMin = 306,
	damageMax = 865,
	baseXp = 5000,
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
	armor = 1,
	diet = HERBIVORE,

	templates = {"object/mobile/dressed_rifleman_trainer_03.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "rifle_t21",
	secondaryWeapon = "none",
	thrownWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",


	personalityStf = "none",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(marksmanmaster,riflemanmaster),
	secondaryAttacks = { },
	defaultAttack = "overchargeshot2",
}

CreatureTemplates:addCreatureTemplate(rifleman06,"rifleman06")