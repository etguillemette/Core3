swordsman04 = Creature:new {
	objectName = "@mob/creature_names:roughneck",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "townsperson",
	faction = "",
	healerType = "normal",
	level = 20,
	chanceHit = 1.15,
	damageMin = 109,
	damageMax = 327,
	baseXp = 3000,
	baseHAM = 2500,
	baseHAMmax = 3500,
	armor = 0,
	resists = {75,75,75,75,75,75,75,-1,-1},
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


	personalityStf = "none",


	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { },
	secondaryAttacks = merge(brawlermaster,swordsmanmid),
	defaultAttack = "melee2hhit2",
}

CreatureTemplates:addCreatureTemplate(swordsman04,"swordsman04")