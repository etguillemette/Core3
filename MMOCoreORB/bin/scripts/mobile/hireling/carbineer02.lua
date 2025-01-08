carbineer02 = Creature:new {
	objectName = "@mob/creature_names:fringer",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = normal,
	level = 20,
	chanceHit = 0.6,
	damageMin = 57,
	damageMax = 171,
	baseXp = 1500,
	baseHAM = 1500,
	baseHAMmax = 2500,
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

	templates = {"object/mobile/dressed_carbine_trainer_01.iff"},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesnt use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "carbine_ee3",
	secondaryWeapon = "none",
	thrownWeapon = "none",
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = marksmanmaster,
	secondaryAttacks = { },
	defaultAttack = "overchargeshot2",
}

CreatureTemplates:addCreatureTemplate(carbineer02,"carbineer02")