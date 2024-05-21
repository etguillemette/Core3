junkDealerGenericConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "JunkDealerGenericConvoHandler",
	screens = {}
}

ask_for_loot = ConvoScreen:new {
	id = "ask_for_loot",
	leftDialog = "@conversation/junk_dealer_generic:s_bef51e38", -- Welcome traveler. I am a buyer of goods that most would deem as junk. If you are interested I will look through what you have to offer and set a price for anything that I wish to buy. I also have come across some other items of interest that I am looking to get rid of.
	stopConversation = "false",
	options = {
		{"Do you by chance have any equipment I could purchase?", "start_vendor"}, --Ethan edit 5-11-24 (JUNK DEALER VENDOR)
		--{"@conversation/junk_dealer_generic:s_54fab04f", "start_sale"}, -- I have some things that you might be interested in.
		--{"@conversation/junk_dealer_generic:s_cd7a3f41", "no_loot"}, -- I am sorry but I don't think I have anything you would want.
		--{"@conversation/junk_dealer_generic:s_3aa18b2d", "inventor"}, -- What sort of items do you have that you are looking to get rid of?
	}
}
junkDealerGenericConvoTemplate:addScreen(ask_for_loot);

start_sale = ConvoScreen:new {
	id = "start_sale",
	leftDialog = "@conversation/junk_dealer_generic:s_84a67771", -- Alright, let me see what you are offering.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(start_sale);

no_loot = ConvoScreen:new {
	id = "no_loot",
	leftDialog = "@conversation/junk_dealer_generic:s_4bd9d15e", -- That is to bad. Remember to come visit me in the future if you happen to come across anything I would be interested in.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(no_loot);

inventor = ConvoScreen:new {
	id = "inventor",
	leftDialog = "@conversation/junk_dealer_generic:s_d9e6b751", -- An inventor recently sold me and my fellow junk dealers a large quantity of these special kits that were supposed to revolutionize crafting. Unfortunately, they are useless without the special components that they are designed to use.
	stopConversation = "false",
	options = {
		{"@conversation/junk_dealer_generic:s_6d53d062", "shipment"}, -- Why don't you just get some of the special components?
	}
}
junkDealerGenericConvoTemplate:addScreen(inventor);

shipment = ConvoScreen:new {
	id = "shipment",
	leftDialog = "@conversation/junk_dealer_generic:s_e29f48dc", -- Apparently this inventor had them all on a shipment that was coming in from the core worlds. As luck would have it the shipment was hijacked en route and all the components were lost to pirates. This caused the inventor to go out of business, leaving all of us stuck with these useless kits.
	stopConversation = "false",
	options = {
		{"@conversation/junk_dealer_generic:s_324b9b0f", "adventerous"}, -- What good would a useless kit do me?
	}
}
junkDealerGenericConvoTemplate:addScreen(shipment);

adventerous = ConvoScreen:new {
	id = "adventerous",
	leftDialog = "@conversation/junk_dealer_generic:s_12fe83a6", -- You seem to be the adventurous sort so I figured that you might be able to find the parts. I mean they had to go somewhere, although my guess is that they are probably all over the galaxy by now.
	stopConversation = "false",
	options = {
		{"@conversation/junk_dealer_generic:s_e1a103e5", "want_them_gone"}, -- Hmmmm, well how much do you want for these kits?
	}
}
junkDealerGenericConvoTemplate:addScreen(adventerous);

want_them_gone = ConvoScreen:new {
	id = "want_them_gone",
	leftDialog = "@conversation/junk_dealer_generic:s_4d65752", -- I just want them gone. They are taking up valuable space in my inventory so I will just give you one of each type if you want.
	stopConversation = "false",
	options = {
		{"@conversation/junk_dealer_generic:s_d347bee3", "kit_types"}, -- Ok sounds good. What sort of kits do you have?
		{"@conversation/junk_dealer_generic:s_b60b73f8", "not_taking_one"}, -- No thanks, I don't think that I need any of those kits.
	}
}
junkDealerGenericConvoTemplate:addScreen(want_them_gone);

not_taking_one = ConvoScreen:new {
	id = "not_taking_one",
	leftDialog = "@conversation/junk_dealer_generic:s_3633b5a5", -- Can't say that I blame you for not taking one. It's sad that I can't even give them away. If I ever see that inventor again I am going to make him really sorry.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(not_taking_one);

kit_types = ConvoScreen:new {
	id = "kit_types",
	leftDialog = "@conversation/junk_dealer_generic:s_3fc7eb45", -- Well let's see here. I have one that makes an orange rug, one that makes a blue rug, one that can make a Nabooian sculpture, one that makes a table, and one that make some sort of model gong. I will only give you one kit at a time so if you want another you are going to have to get rid of the one you currently have first.
	stopConversation = "false",
	options = {
		{"@conversation/junk_dealer_generic:s_ee977dee", "give_orange"}, -- Let me have one of those orange rug kits.
		{"@conversation/junk_dealer_generic:s_8f39769", "give_blue"}, -- I will take one of the blue rug kits.
		{"@conversation/junk_dealer_generic:s_fe657cdd", "give_gong"}, -- I think I would like one of those model gong kits.
		{"@conversation/junk_dealer_generic:s_9ede4b84", "give_table"}, -- Let me have one that makes the table.
		{"@conversation/junk_dealer_generic:s_87c5851b", "give_sculpture"}, -- I think I will try out the one that makes the sculpture.
	}
}
junkDealerGenericConvoTemplate:addScreen(kit_types);

give_orange = ConvoScreen:new {
	id = "give_orange",
	leftDialog = "@conversation/junk_dealer_generic:s_14efaaa2", -- Ok, here you go. I guess in order to make it work you need to add ten special components to the kit. When you examine a kit, it has a list of what you need in order to complete the kit. It also has a read-out of whether it currently has a component or not. Oh, and if you do happen to make anything useful with that kit, I might be interested in buying that from you.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(give_orange);

give_blue = ConvoScreen:new {
	id = "give_blue",
	leftDialog = "@conversation/junk_dealer_generic:s_14efaaa2", -- Ok, here you go. I guess in order to make it work you need to add ten special components to the kit. When you examine a kit, it has a list of what you need in order to complete the kit. It also has a read-out of whether it currently has a component or not. Oh, and if you do happen to make anything useful with that kit, I might be interested in buying that from you.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(give_blue);

give_gong = ConvoScreen:new {
	id = "give_gong",
	leftDialog = "@conversation/junk_dealer_generic:s_14efaaa2", -- Ok, here you go. I guess in order to make it work you need to add ten special components to the kit. When you examine a kit, it has a list of what you need in order to complete the kit. It also has a read-out of whether it currently has a component or not. Oh, and if you do happen to make anything useful with that kit, I might be interested in buying that from you.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(give_gong);

give_table = ConvoScreen:new {
	id = "give_table",
	leftDialog = "@conversation/junk_dealer_generic:s_14efaaa2", -- Ok, here you go. I guess in order to make it work you need to add ten special components to the kit. When you examine a kit, it has a list of what you need in order to complete the kit. It also has a read-out of whether it currently has a component or not. Oh, and if you do happen to make anything useful with that kit, I might be interested in buying that from you.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(give_table);

give_sculpture = ConvoScreen:new {
	id = "give_sculpture",
	leftDialog = "@conversation/junk_dealer_generic:s_14efaaa2", -- Ok, here you go. I guess in order to make it work you need to add ten special components to the kit. When you examine a kit, it has a list of what you need in order to complete the kit. It also has a read-out of whether it currently has a component or not. Oh, and if you do happen to make anything useful with that kit, I might be interested in buying that from you.
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(give_sculpture);

--VENDOR------------------------------------
--------------------------------------------

--Ethan edit 5-10-24 (JUNK DEALER VENDOR)
start_vendor = ConvoScreen:new {
	id = "start_vendor",
	customDialogText = "Of course! I have plenty of odds and ends for the discerning buyer... What exactly were you looking for?",
	stopConversation = "false",
	options = {
		{"I am looking for a weapon.", "vendor_weapon"},
		{"I am looking for some armor.", "vendor_armor"},
		{"I am looking for some medicine.", "vendor_medicine"},
		{"I am looking for a building deed.", "vendor_installation"},
		{"I am looking for a mercenary.", "vendor_hireling"},
		{"I am looking for some food and drink.", "vendor_chef"},
		{"I am looking for some scout equipment.", "vendor_scout"},
		{"I am looking for some resources.", "resource_resources"},
		{"I am looking for some clothing.", "vendor_wearables"},
		{"I am looking for some ship components.", "vendor_ship"},
		{"I am looking for some crafting components.", "vendor_component"},
		{"I am looking for some furniture.", "vendor_furniture"},
		{"I am looking for a vehicle.", "wares_deed_vehicle_deed"},
		--{"I am looking for some entertainer items."},
		--{"I am looking for a vehicle.","vendor_vehicle"},
		--{"I am looking for some parts.","vendor_medicine"},
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(start_vendor);

--SHIP COMPONENT--------------------------
------------------------------------------

vendor_ship = ConvoScreen:new {
	id = "vendor_ship",
	customDialogText = "What kind of ship components were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a ship_crafted_armor.", "wares_ship_crafted_armor"},
		{"I was looking for a ship_crafted_booster.", "wares_ship_crafted_booster"},
		{"I was looking for a ship_crafted_capacitor.", "wares_ship_crafted_capacitor"},
		{"I was looking for a ship_crafted_chassis.", "wares_ship_crafted_chassis"},
		{"I was looking for a ship_crafted_droid_interface.", "wares_ship_crafted_droid_interface"},
		{"I was looking for a ship_crafted_engine.", "wares_ship_crafted_engine"},
		{"I was looking for a ship_crafted_reactor.", "wares_ship_crafted_reactor"},
		{"I was looking for a ship_crafted_repair.", "wares_ship_crafted_repair"},
		{"I was looking for a ship_crafted_reverse_engineering.", "wares_ship_crafted_reverse_engineering"},
		{"I was looking for a ship_crafted_shields.", "wares_ship_crafted_shields"},
		{"I was looking for a ship_crafted_weapon.", "wares_ship_crafted_weapon"},	
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_ship);


wares_ship_crafted_armor = ConvoScreen:new {
	id = "wares_ship_crafted_armor",
	customDialogText = "Here are the wares_ship_crafted_armor I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_armor);

wares_ship_crafted_booster = ConvoScreen:new {
	id = "wares_ship_crafted_booster",
	customDialogText = "Here are the wares_ship_crafted_booster I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_booster);

wares_ship_crafted_capacitor = ConvoScreen:new {
	id = "wares_ship_crafted_capacitor",
	customDialogText = "Here are the wares_ship_crafted_capacitor I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_capacitor);

wares_ship_crafted_chassis = ConvoScreen:new {
	id = "wares_ship_crafted_chassis",
	customDialogText = "Here are the wares_ship_crafted_chassis I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_chassis);

wares_ship_crafted_droid_interface = ConvoScreen:new {
	id = "wares_ship_crafted_droid_interface",
	customDialogText = "Here are the wares_ship_crafted_droid_interface I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_droid_interface);

wares_ship_crafted_engine = ConvoScreen:new {
	id = "wares_ship_crafted_engine",
	customDialogText = "Here are the wares_ship_crafted_engine I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_engine);

wares_ship_crafted_reactor = ConvoScreen:new {
	id = "wares_ship_crafted_reactor",
	customDialogText = "Here are the wares_ship_crafted_reactor I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_reactor);

wares_ship_crafted_repair = ConvoScreen:new {
	id = "wares_ship_crafted_repair",
	customDialogText = "Here are the wares_ship_crafted_repair I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_repair);

wares_ship_crafted_reverse_engineering = ConvoScreen:new {
	id = "wares_ship_crafted_reverse_engineering",
	customDialogText = "Here are the wares_ship_crafted_reverse_engineering I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_reverse_engineering);

wares_ship_crafted_shields = ConvoScreen:new {
	id = "wares_ship_crafted_shields",
	customDialogText = "Here are the wares_ship_crafted_shields I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_shields);

wares_ship_crafted_weapon = ConvoScreen:new {
	id = "wares_ship_crafted_weapon",
	customDialogText = "Here are the wares_ship_crafted_weapon I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ship_crafted_weapon);



--CLOTHING--------------------------------
------------------------------------------

vendor_wearables = ConvoScreen:new {
	id = "vendor_wearables",
	customDialog = "Of course! What kind of clothing were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a wearables_apron.", "wares_wearables_apron"},
		{"I was looking for a wearables_backpack.", "wares_wearables_backpack"},
		{"I was looking for a wearables_belt.", "wares_wearables_belt"},
		{"I was looking for a wearables_bikini.", "wares_wearables_bikini"},
		{"I was looking for a wearables_bodysuit.", "wares_wearables_bodysuit"},
		{"I was looking for a wearables_boots.", "wares_wearables_boots"},
		{"I was looking for a wearables_bustier.", "wares_wearables_bustier"},
		{"I was looking for a wearables_dress.", "wares_wearables_dress"},
		{"I was looking for a wearables_gloves.", "wares_wearables_gloves"},
		{"I was looking for a wearables_goggles.", "wares_wearables_goggles"},
		{"I was looking for a wearables_hat.", "wares_wearables_hat"},
		{"I was looking for a wearables_ithorian.", "wares_wearables_ithorian"},
		{"I was looking for a wearables_jacket.", "wares_wearables_jacket"},
		{"I was looking for a wearables_necklace.", "wares_wearables_necklace"},
		{"I was looking for a wearables_pants.", "wares_wearables_pants"},
		{"I was looking for a wearables_ring.", "wares_wearables_ring"},
		{"I was looking for a wearables_robe.", "wares_wearables_robe"},
		{"I was looking for a wearables_shirt.", "wares_wearables_shirt"},
		{"I was looking for a wearables_shoes.", "wares_wearables_shoes"},
		{"I was looking for a wearables_skirt.", "wares_wearables_skirt"},
		{"I was looking for a wearables_vest.", "wares_wearables_vest"},
		{"I was looking for a wearables_wookiee.", "wares_wearables_wookiee"},
		{"Actually, I don't need anything right now.", "no_loot"}		
	}
}
JunkDealerGenericConvoHandler:addScreen(vendor_wearables);


wares_wearables_apron = ConvoScreen:new {
	id = "wares_wearables_apron",
	customDialogText = "Here are the wares_wearables_apron I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_apron);

wares_wearables_backpack = ConvoScreen:new {
	id = "wares_wearables_backpack",
	customDialogText = "Here are the wares_wearables_backpack I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_backpack);

wares_wearables_belt = ConvoScreen:new {
	id = "wares_wearables_belt",
	customDialogText = "Here are the wares_wearables_belt I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_belt);

wares_wearables_bikini = ConvoScreen:new {
	id = "wares_wearables_bikini",
	customDialogText = "Here are the wares_wearables_bikini I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_bikini);

wares_wearables_bodysuit = ConvoScreen:new {
	id = "wares_wearables_bodysuit",
	customDialogText = "Here are the wares_wearables_bodysuit I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_bodysuit);

wares_wearables_boots = ConvoScreen:new {
	id = "wares_wearables_boots",
	customDialogText = "Here are the wares_wearables_boots I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_boots);

wares_wearables_bustier = ConvoScreen:new {
	id = "wares_wearables_bustier",
	customDialogText = "Here are the wares_wearables_bustier I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_bustier);

wares_wearables_dress = ConvoScreen:new {
	id = "wares_wearables_dress",
	customDialogText = "Here are the wares_wearables_dress I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_dress);

wares_wearables_gloves = ConvoScreen:new {
	id = "wares_wearables_gloves",
	customDialogText = "Here are the wares_wearables_gloves I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_gloves);

wares_wearables_goggles = ConvoScreen:new {
	id = "wares_wearables_goggles",
	customDialogText = "Here are the wares_wearables_goggles I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_goggles);

wares_wearables_hat = ConvoScreen:new {
	id = "wares_wearables_hat",
	customDialogText = "Here are the wares_wearables_hat I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_hat);

wares_wearables_ithorian = ConvoScreen:new {
	id = "wares_wearables_ithorian",
	customDialogText = "Here are the wares_wearables_ithorian I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_ithorian);

wares_wearables_jacket = ConvoScreen:new {
	id = "wares_wearables_jacket",
	customDialogText = "Here are the wares_wearables_jacket I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_jacket);

wares_wearables_necklace = ConvoScreen:new {
	id = "wares_wearables_necklace",
	customDialogText = "Here are the wares_wearables_necklace I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_necklace);

wares_wearables_pants = ConvoScreen:new {
	id = "wares_wearables_pants",
	customDialogText = "Here are the wares_wearables_pants I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_pants);

wares_wearables_ring = ConvoScreen:new {
	id = "wares_wearables_ring",
	customDialogText = "Here are the wares_wearables_ring I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_ring);

wares_wearables_robe = ConvoScreen:new {
	id = "wares_wearables_robe",
	customDialogText = "Here are the wares_wearables_robe I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_robe);

wares_wearables_shirt = ConvoScreen:new {
	id = "wares_wearables_shirt",
	customDialogText = "Here are the wares_wearables_shirt I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_shirt);

wares_wearables_shoes = ConvoScreen:new {
	id = "wares_wearables_shoes",
	customDialogText = "Here are the wares_wearables_shoes I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_shoes);

wares_wearables_skirt = ConvoScreen:new {
	id = "wares_wearables_skirt",
	customDialogText = "Here are the wares_wearables_skirt I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_skirt);

wares_wearables_vest = ConvoScreen:new {
	id = "wares_wearables_vest",
	customDialogText = "Here are the wares_wearables_vest I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_vest);

wares_wearables_wookiee = ConvoScreen:new {
	id = "wares_wearables_wookiee",
	customDialogText = "Here are the wares_wearables_wookiee I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wearables_wookiee);



--WEAPON----------------------------------
------------------------------------------

vendor_weapon = ConvoScreen:new {
	id = "vendor_weapon",
	customDialogText = "What sort of weapon were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a pistol.", "wares_pistol"},
		{"I was looking for a carbine.", "wares_carbine"},
		{"I was looking for a rifle.", "wares_rifle"},
		{"I was looking for a one-handed weapon.", "wares_oh"},
		{"I was looking for a two-handed weapon.", "wares_th"},
		{"I was looking for a polearm.", "wares_pole"},
		{"I was looking for a knuckler.", "wares_ua"},
		{"I was looking for a heavy weapon.", "wares_heavy"},
		{"Actually, I don't need anything right now.","no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_weapon);

wares_pistol = ConvoScreen:new {
	id = "wares_pistol",
	customDialogText = "Here are the pistols I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_pistol);

wares_rifle = ConvoScreen:new {
	id = "wares_rifle",
	customDialogText = "Here are the rifles I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_rifle);

wares_carbine = ConvoScreen:new {
	id = "wares_carbine",
	customDialogText = "Here are the carbines I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_carbine);

wares_heavy = ConvoScreen:new {
	id = "wares_heavy",
	customDialogText = "Here are the heavy weapons I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_heavy);

wares_oh = ConvoScreen:new {
	id = "wares_oh",
	customDialogText = "Here are the one-handed weapons I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_oh);

wares_th = ConvoScreen:new {
	id = "wares_th",
	customDialogText = "Here are the two-handed weapons I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_th);

wares_pole = ConvoScreen:new {
	id = "wares_pole",
	customDialogText = "Here are the polearms I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_pole);

wares_ua = ConvoScreen:new {
	id = "wares_ua",
	customDialogText = "Here are the knucklers I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ua);

--ARMOR----------------------------------------
-----------------------------------------------

vendor_armor = ConvoScreen:new {
	id = "vendor_armor",
	customDialogText = "What sort of armor were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a helmet.", "wares_armor_helm"},
		{"I was looking for a chestpiece.", "wares_armor_chest"},
		{"I was looking for leg armor.", "wares_armor_leg"},
		{"I was looking for arm armor.", "wares_armor_arm"},
		{"I was looking for armor accessories.", "wares_armor_accessory"},
		--{"I was looking for some bone armor.", "wares_bone"},
		--{"I was looking for some chitin armor.", "wares_chitin"},
		--{"I was looking for some mabari armor.", "wares_mabari"},
		--{"I was looking for some tantel armor", "wares_tantel"},
		--{"I was looking for some ubese armor", "wares_ubese"},
		--{"I was looking for some padded armor", "wares_padded"},
		--{"I was looking for some composite armor", "wares_composite"},
		--{"I was looking for some Ithorian guardian armor", "wares_guardian"},
		--{"I was looking for some Ithorian defender armor", "wares_defender"},
		--{"I was looking for some Ithorian sentinel armor", "wares_sentinel"},
		--{"I was looking for some Wookie Ceremonial armor", "wares_ceremonial"},
		--{"I was looking for some Wookie Black Mountain armor.", "wares_mountain"},
		--{"I was looking for some Wookie Hunting armor", "wares_hunting"},
		{"Actually, I don't need anything right now.","no_loot"}		
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_armor);


wares_armor_helm = ConvoScreen:new {
	id = "wares_armor_helm",
	customDialogText = "Here are the helmet armor pieces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_armor_helm);

wares_armor_chest = ConvoScreen:new {
	id = "wares_armor_chest",
	customDialogText = "Here are the chestplate armor pieces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_armor_chest);

wares_armor_leg = ConvoScreen:new {
	id = "wares_armor_leg",
	customDialogText = "Here are the legging armor pieces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_armor_leg);

wares_armor_arm = ConvoScreen:new {
	id = "wares_armor_arm",
	customDialogText = "Here are the arm armor pieces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_armor_arm);

wares_armor_accessory = ConvoScreen:new {
	id = "wares_armor_accessory",
	customDialogText = "Here are the armor accessory pieces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_armor_accessory);


wares_bone = ConvoScreen:new {
	id = "wares_bone",
	customDialogText = "Here are the bone armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_bone);

wares_chitin = ConvoScreen:new {
	id = "wares_chitin",
	customDialogText = "Here are the chitin armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_chitin);

wares_mabari = ConvoScreen:new {
	id = "wares_mabari",
	customDialogText = "Here are the mabari armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_mabari);

wares_tantel = ConvoScreen:new {
	id = "wares_tantel",
	customDialogText = "Here are the tantel armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_tantel);

wares_ubese = ConvoScreen:new {
	id = "wares_ubese",
	customDialogText = "Here are the ubese armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ubese);

wares_padded = ConvoScreen:new {
	id = "wares_padded",
	customDialogText = "Here are the padded armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_padded);

wares_composite = ConvoScreen:new {
	id = "wares_composite",
	customDialogText = "Here are the composite armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_composite);

wares_guardian = ConvoScreen:new {
	id = "wares_guardian",
	customDialogText = "Here are the guardian armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_guardian);

wares_sentinel = ConvoScreen:new {
	id = "wares_sentinel",
	customDialogText = "Here are the sentinel armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_sentinel);

wares_defender = ConvoScreen:new {
	id = "wares_defender",
	customDialogText = "Here are the defender armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_defender);

wares_ceremonial = ConvoScreen:new {
	id = "wares_ceremonial",
	customDialogText = "Here are the ceremonial armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_ceremonial);

wares_mountain = ConvoScreen:new {
	id = "wares_mountain",
	customDialogText = "Here are the mountain armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_mountain);

wares_hunting = ConvoScreen:new {
	id = "wares_hunting",
	customDialogText = "Here are the hunting armors I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_hunting);

--COMPONENTS------------------------------
------------------------------------------

vendor_component = ConvoScreen:new {
	id = "vendor_component",
	customDialogText = "What kind of crafting components were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a component_armor.", "wares_component_armor"},
		{"I was looking for a component_bio.", "wares_component_bio"},
		{"I was looking for a component_chemistry.", "wares_component_chemistry"},
		{"I was looking for a component_clothing.", "wares_component_clothing"},
		{"I was looking for a component_dna.", "wares_component_dna"},
		{"I was looking for a component_droid.", "wares_component_droid"},
		{"I was looking for a component_item.", "wares_component_item"},
		{"I was looking for a component_munition.", "wares_component_munition"},
		{"I was looking for a component.", "wares_component"},
		{"I was looking for a component_structure.", "wares_component_structure"},
		{"I was looking for a component_vehicle.", "wares_component_vehicle"},
		{"I was looking for a component_weapon.", "wares_component_weapon"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_component);

wares_component_armor = ConvoScreen:new {
	id = "wares_component_armor",
	customDialogText = "Here are the wares_component_armor I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_armor);

wares_component_bio = ConvoScreen:new {
	id = "wares_component_bio",
	customDialogText = "Here are the wares_component_bio I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_bio);

wares_component_chemistry = ConvoScreen:new {
	id = "wares_component_chemistry",
	customDialogText = "Here are the wares_component_chemistry I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_chemistry);

wares_component_clothing = ConvoScreen:new {
	id = "wares_component_clothing",
	customDialogText = "Here are the wares_component_clothing I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_clothing);

wares_component_dna = ConvoScreen:new {
	id = "wares_component_dna",
	customDialogText = "Here are the wares_component_dna I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_dna);

wares_component_droid = ConvoScreen:new {
	id = "wares_component_droid",
	customDialogText = "Here are the wares_component_droid I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_droid);

wares_component_item = ConvoScreen:new {
	id = "wares_component_item",
	customDialogText = "Here are the wares_component_item I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_item);

wares_component_munition = ConvoScreen:new {
	id = "wares_component_munition",
	customDialogText = "Here are the wares_component_munition I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_munition);

wares_component = ConvoScreen:new {
	id = "wares_component",
	customDialogText = "Here are the wares_component I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component);

wares_component_structure = ConvoScreen:new {
	id = "wares_component_structure",
	customDialogText = "Here are the wares_component_structure I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_structure);

wares_component_vehicle = ConvoScreen:new {
	id = "wares_component_vehicle",
	customDialogText = "Here are the wares_component_vehicle I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_vehicle);

wares_component_weapon = ConvoScreen:new {
	id = "wares_component_weapon",
	customDialogText = "Here are the wares_component_weapon I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_component_weapon);

--MEDICINE--------------------------------
------------------------------------------

vendor_medicine = ConvoScreen:new {
	id = "vendor_medicine",
	customDialogText = "What sort of medicine were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for some stim packs.", "wares_stim"},
		{"I was looking for some damage medpacks.", "wares_medpack"},
		{"I was looking for some status medpacks.", "wares_status"},
		{"I was looking for some wound medpacks.", "wares_wound"},
		{"I was looking for some enhancements.", "wares_enhancement"},
		{"I was looking for some pet medicine.", "wares_medicine_pet"},
		{"Actually, I don't need anything right now.","no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_medicine);

wares_stim = ConvoScreen:new {
	id = "wares_stim",
	customDialogText = "Here are the stims I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_stim);

wares_medpack = ConvoScreen:new {
	id = "wares_medpack",
	customDialogText = "Here are the medpacks I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_medpack);

wares_status = ConvoScreen:new {
	id = "wares_status",
	customDialogText = "Here are the status medpacks I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_status);

wares_wound = ConvoScreen:new {
	id = "wares_wound",
	customDialogText = "Here are the wound medpacks I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_wound);

wares_enhancement = ConvoScreen:new {
	id = "wares_enhancement",
	customDialogText = "Here are the enhancements I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_enhancement);

wares_medicine_pet = ConvoScreen:new {
	id = "wares_medicine_pet",
	customDialogText = "Here are the wares_medicine_pet I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_medicine_pet);

--INSTALLATIONS------------------------------
---------------------------------------------

vendor_installation = ConvoScreen:new {
	id = "vendor_installation",
	customDialogText = "What sort of an installation were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a harvester.", "wares_harvester"},
		{"I was looking for a factory.", "wares_factory"},
		{"I was looking for a generator.", "wares_generator"},
		{"I was looking for a guild hall.", "wares_guild"},
		{"I was looking for a house.", "wares_house"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_installation);

wares_harvester = ConvoScreen:new {
	id = "wares_harvester",
	customDialogText = "Here are the harvesters I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_harvester);

wares_factory = ConvoScreen:new {
	id = "wares_factory",
	customDialogText = "Here are the harvesters I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_factory);

wares_generator = ConvoScreen:new {
	id = "wares_generator",
	customDialogText = "Here are the harvesters I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_generator);

wares_house = ConvoScreen:new {
	id = "wares_house",
	customDialogText = "Here are the harvesters I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_house);

wares_guild = ConvoScreen:new {
	id = "wares_guild",
	customDialogText = "Here are the harvesters I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_guild);

--CHEF---------------------------------------
---------------------------------------------

vendor_chef = ConvoScreen:new {
	id = "vendor_chef",
	customDialogText = "I have some food, drink and desserts available. What would you like?",
	stopConversation = "false",
	options = {
		{"I was looking for something to drink.", "wares_drink"},
		{"I was looking for something to eat.", "wares_food"},
		{"I was looking for some dessert.", "wares_dessert"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_chef);

wares_drink = ConvoScreen:new {
	id = "wares_drink",
	customDialogText = "Here are the drinks on the menu.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_drink);

wares_food = ConvoScreen:new {
	id = "wares_food",
	customDialogText = "Here is the food on the menu.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_food);

wares_dessert = ConvoScreen:new {
	id = "wares_dessert",
	customDialogText = "Here is our dessert menu.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_dessert);

--SCOUT--------------------------------------
---------------------------------------------

vendor_scout = ConvoScreen: new {
	id = "vendor_scout",
	customDialogText = "What kind of scout equipment were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for some traps.", "wares_trap"},
		{"I was looking for some camo.", "wares_camo"},
		{"I was looking for some camps.", "wares_camp"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_scout);

wares_trap = ConvoScreen:new {
	id = "wares_trap",
	customDialogText = "Here are the traps I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_trap);

wares_camo = ConvoScreen:new {
	id = "wares_camo",
	customDialogText = "Here are the traps I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_camo);

wares_camp = ConvoScreen:new {
	id = "wares_camp",
	customDialogText = "Here are the camps I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_camp);


--HIRELINGS----------------------------------
---------------------------------------------

vendor_hireling = ConvoScreen:new {
	id = "vendor_hireling",
	customDialogText = "What kind of a contract were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a marksman.", "hires_marksman"},
		{"I was looking for a brawler.", "hires_brawler"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_hireling);

hires_marksman = ConvoScreen:new {
	id = "hires_marksman",
	customDialogText = "Here are the marksman contracts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(hires_marksman);

hires_brawler = ConvoScreen:new {
	id = "hires_brawler",
	customDialogText = "Here are the brawler contracts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(hires_brawler);


--FURNITURE-----------------------------------
----------------------------------------------

vendor_furniture = ConvoScreen:new {
	id = "vendor_furniture",
	customDialogText = "What kind of furniture were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a furniture_all.", "wares_furniture_all"},
		{"I was looking for a furniture_city.", "wares_furniture_city"},
		{"I was looking for a furniture_decorative.", "wares_furniture_decorative"},
		{"I was looking for a furniture_tatooine.", "wares_furniture_tatooine"},
		{"I was looking for a painting.", "wares_painting"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_furniture);

wares_furniture_all = ConvoScreen:new {
	id = "wares_furniture_all",
	customDialogText = "Here are the wares_furniture_all I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_furniture_all);

wares_furniture_city = ConvoScreen:new {
	id = "wares_furniture_city",
	customDialogText = "Here are the wares_furniture_city I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_furniture_city);

wares_furniture_decorative = ConvoScreen:new {
	id = "wares_furniture_decorative",
	customDialogText = "Here are the wares_furniture_decorative I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_furniture_decorative);

wares_furniture_tatooine = ConvoScreen:new {
	id = "wares_furniture_tatooine",
	customDialogText = "Here are the wares_furniture_tatooine I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_furniture_tatooine);

wares_painting = ConvoScreen:new {
	id = "wares_painting",
	customDialogText = "Here are the wares_painting I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_painting);


--RESOURCES-----------------------------------
----------------------------------------------

resource_resources = ConvoScreen:new {
	id = "resource_resources",
	customDialogText = "Here are the resources I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(resource_resources)

----------------------------------------------
----------------------------------------------

wares_battery = ConvoScreen:new {
	id = "wares_battery",
	customDialogText = "Here are the wares_battery I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_battery);



wares_deed_city_deed = ConvoScreen:new {
	id = "wares_deed_city_deed",
	customDialogText = "Here are the wares_deed_city_deed I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_deed_city_deed);

wares_deed_pet_deed = ConvoScreen:new {
	id = "wares_deed_pet_deed",
	customDialogText = "Here are the wares_deed_pet_deed I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_deed_pet_deed);

wares_deed_vehicle_deed = ConvoScreen:new {
	id = "wares_deed_vehicle_deed",
	customDialogText = "Here are the wares_deed_vehicle_deed I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_deed_vehicle_deed);

wares_droid_battery = ConvoScreen:new {
	id = "wares_droid_battery",
	customDialogText = "Here are the wares_droid_battery I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_droid_battery);

wares_firework = ConvoScreen:new {
	id = "wares_firework",
	customDialogText = "Here are the wares_firework I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_firework);


wares_loot_loot_schematic = ConvoScreen:new {
	id = "wares_loot_loot_schematic",
	customDialogText = "Here are the wares_loot_loot_schematic I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_loot_loot_schematic);


wares_recycler = ConvoScreen:new {
	id = "wares_recycler",
	customDialogText = "Here are the wares_recycler I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_recycler);

wares_scout_camp = ConvoScreen:new {
	id = "wares_scout_camp",
	customDialogText = "Here are the wares_scout_camp I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_scout_camp);

wares_survey_tool = ConvoScreen:new {
	id = "wares_survey_tool",
	customDialogText = "Here are the wares_survey_tool I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_survey_tool);






--End Ethan edit 5-10-24 (JUNK DEALER VENDOR)

addConversationTemplate("junkDealerGenericConvoTemplate", junkDealerGenericConvoTemplate);
