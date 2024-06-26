junkDealerArmsConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "NPCVendorConvoHandler",
	screens = {}
}

ask_for_loot = ConvoScreen:new {
	id = "ask_for_loot",
	leftDialog = "@conversation/junk_dealer_arms:s_3c06418f", -- Hmmm. You seem to be a discreet sort. Perhaps you are looking to do some business. If you have any untraceable weapons that maybe you would like to get off your hands I am the right person to see
	stopConversation = "false",
	options = {
		{"Do you by chance have any equipment I could purchase?", "start_vendor"}, --Ethan edit 5-11-24 (JUNK DEALER VENDOR)
		--{"@conversation/junk_dealer_arms:s_c86eba88", "start_sale"}, -- I think I have a few things that you might be interested in.
		--{"@conversation/junk_dealer_arms:s_370a03c", "no_loot"}, -- I don't think that I have anything you would be interested in.
	}
}
junkDealerArmsConvoTemplate:addScreen(ask_for_loot);

start_sale = ConvoScreen:new {
	id = "start_sale",
	leftDialog = "@conversation/junk_dealer_arms:s_24f30320", -- Just remember what I said about discretion. My buyers would be less then pleased if the authorities got word of this transaction. And I don't think you want my buyers to be unhappy.
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(start_sale);

no_loot = ConvoScreen:new {
	id = "no_loot",
	leftDialog = "@conversation/junk_dealer_arms:s_df5bd64e", -- Right you are. Oh, and we never met.
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(no_loot);

addConversationTemplate("junkDealerArmsConvoTemplate", junkDealerArmsConvoTemplate);


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
		{"I am looking for some clothing.", "vendor_wearables"},
		{"I am looking for some medicine.", "vendor_medicine"},
		{"I am looking for some food and drink.", "vendor_chef"},
		{"I am looking for some crafting components", "vendor_component"},
		{"I am looking for some scout equipment.", "vendor_scout"},
		{"I am looking for some structures.", "vendor_installation"},
		{"I am looking for some bio-engineered goods.", "vendor_bio"},
		{"I am looking for some droid goods.", "vendor_droid"},
		{"I am looking for some miscellaneous goods.", "vendor_misc"},
		{"I am looking for some... Uh... 'Kitchenware'...", "vendor_smuggler"},
		{"I am looking for some ship components.", "vendor_ship"},
		{"I am looking for some entertainer goods.", "vendor_entertainer"},
		{"I am looking for some vehicle goods.", "vendor_vehicle"},
		{"I am looking for a mercenary.", "vendor_hireling"},
		{"I am looking for some resources.", "resource_resource"},
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerArmsConvoTemplate:addScreen(start_vendor);

--WEAPON----------------------------------
------------------------------------------

vendor_weapon = ConvoScreen:new {
	id = "vendor_weapon",
	customDialogText = "What sort of weapon were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a pistol.", "wares_pistol"},
		{"I was looking for a rifle.", "wares_rifle"},
		{"I was looking for a carbine.", "wares_carbine"},
		{"I was looking for a one-handed weapon.", "wares_onehanded"},
		{"I was looking for a polearm.", "wares_polearm"},
		{"I was looking for a two-handed weapon.", "wares_twohanded"},
		{"I was looking for a knuckler.", "wares_unarmed"},
		{"I was looking for a heavy weapon.", "wares_heavyweapon"},
		{"I was looking for an explosive.", "wares_munition"},
		{"I was looking for a powerup.", "wares_powerup"},		
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerArmsConvoTemplate:addScreen(vendor_weapon);

	wares_pistol = ConvoScreen:new {
		id = "wares_pistol",
		customDialogText = "Here are the wares_pistol I have available.",
		stopConversation = "true",	options = {}
	}
	junkDealerArmsConvoTemplate:addScreen(wares_pistol);

	wares_rifle = ConvoScreen:new {
		id = "wares_rifle",
		customDialogText = "Here are the wares_rifle I have available.",
		stopConversation = "true",
		options = {}
	}
	junkDealerArmsConvoTemplate:addScreen(wares_rifle);
	
	wares_carbine = ConvoScreen:new {
		id = "wares_carbine",
		customDialogText = "Here are the wares_carbine I have available.",
		stopConversation = "true",
		options = {}
	}
	junkDealerArmsConvoTemplate:addScreen(wares_carbine);
	
	wares_onehanded = ConvoScreen:new {
		id = "wares_onehanded",
		customDialogText = "Here are the wares_onehanded I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_onehanded);
	
	wares_polearm = ConvoScreen:new {
		id = "wares_polearm",
		customDialogText = "Here are the wares_polearm I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_polearm);
	
	wares_twohanded = ConvoScreen:new {
		id = "wares_twohanded",
		customDialogText = "Here are the wares_twohanded I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_twohanded);
	
	wares_unarmed = ConvoScreen:new {
		id = "wares_unarmed",
		customDialogText = "Here are the wares_unarmed I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_unarmed);
	
	wares_heavyweapon = ConvoScreen:new {
		id = "wares_heavyweapon",
		customDialogText = "Here are the wares_heavyweapon I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_heavyweapon);
	
	wares_munition = ConvoScreen:new {	
		id = "wares_munition",
		customDialogText = "Here are the wares_munition I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_munition);
	
	wares_powerup = ConvoScreen:new {
		id = "wares_powerup",
		customDialogText = "Here are the wares_powerup I have available.",
		stopConversation = "true",
		options = {}
	}junkDealerArmsConvoTemplate:addScreen(wares_powerup);

--ARMOR----------------------------------------
-----------------------------------------------

vendor_armor = ConvoScreen:new {
	id = "vendor_armor",
	customDialogText = "What sort of armor were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a helm.", "wares_armorhelm"},
		{"I was looking for a chestpiece.", "wares_armorchest"},
		{"I was looking for leg armor.", "wares_armorleg"},
		{"I was looking for arm armor.", "wares_armorarm"},
		{"I was looking for an armor accessory.", "wares_armoraccessory"},
		{"Actually, I don't need anything right now.","no_loot"}		
	}
}
junkDealerArmsConvoTemplate:addScreen(vendor_armor);

wares_armorhelm = ConvoScreen:new {	
	id = "wares_armorhelm",
	customDialogText = "Here are the helms I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(wares_armorhelm);

wares_armorchest = ConvoScreen:new {	
	id = "wares_armorchest",
	customDialogText = "Here are the chestpieces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(wares_armorchest);

wares_armorleg = ConvoScreen:new {
	id = "wares_armorleg",
	customDialogText = "Here are the leggings I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(wares_armorleg);

wares_armorarm = ConvoScreen:new {	
	id = "wares_armorarm",
	customDialogText = "Here are the arm armor I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(wares_armorarm);

wares_armoraccessory = ConvoScreen:new {
	id = "wares_armoraccessory",
	customDialogText = "Here are the armor accessories I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerArmsConvoTemplate:addScreen(wares_armoraccessory);