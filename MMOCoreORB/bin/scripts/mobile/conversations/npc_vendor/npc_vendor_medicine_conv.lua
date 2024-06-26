NPCVendorMedicineConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "NPCVendorConvoHandler",
	screens = {}
}

ask_for_loot = ConvoScreen:new {
	id = "ask_for_loot",
	customDialogText = "Hello, do you need something?", -- Hello my friend. How are you doing today? I am a buyer of finery....clothing, jewelry, and such. If you happen to have anything that I might like to buy please let me know.
	stopConversation = "false",
	options = {
		{"Do you by chance have any medicine I could purchase?", "start_vendor"}, --Ethan edit 5-11-24 (JUNK DEALER VENDOR)
		--{"@conversation/junk_dealer_finery:s_c86eba88", "start_sale"}, -- I think I have a few things that you might be interested in.
		--{"@conversation/junk_dealer_finery:s_370a03c", "no_loot"}, -- I don't think that I have anything you would be interested in.
	}
}
NPCVendorMedicineConvoTemplate:addScreen(ask_for_loot);

start_sale = ConvoScreen:new {
	id = "start_sale",
	leftDialog = "@conversation/junk_dealer_finery:s_e8ceb290", -- That is wonderful news. Let me see what you have to offer and I will give you price on anything I wish to buy. Remember there is no obligation to sell but I certainly hope you decide to conduct your business with me.
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(start_sale);

no_loot = ConvoScreen:new {
	id = "no_loot",
	leftDialog = "@conversation/junk_dealer_finery:s_1eb9feb7", -- That is too bad. I was really hoping to get some new stock in today.
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(no_loot);

addConversationTemplate("NPCVendorMedicineConvoTemplate", NPCVendorMedicineConvoTemplate);

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
NPCVendorMedicineConvoTemplate:addScreen(start_vendor);


--MEDICINE--------------------------------
------------------------------------------

vendor_medicine = ConvoScreen:new {
	id = "vendor_medicine",
	customDialogText = "What sort of medicine were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a stimpack.", "wares_stim"},
		{"I was looking for a wound pack.", "wares_woundpack"},
		{"I was looking for a cure pack.", "wares_medpackcure"},
		{"I was looking for a disease pack.", "wares_medpackdisease"},
		{"I was looking for an enhancement.", "wares_enhacement"},
		{"I was looking for a poison pack.", "wares_medpackpoison"},
		{"I was looking for a pet stim.", "wares_petstim"},
		{"Actually, I don't need anything right now.","no_loot"},		
	}
}
NPCVendorMedicineConvoTemplate:addScreen(vendor_medicine);

wares_stim = ConvoScreen:new {	
	id = "wares_stim",
	customDialogText = "Here are the stimpacks I have available.",
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(wares_stim);

wares_woundpack = ConvoScreen:new {
	id = "wares_woundpack",
	customDialogText = "Here are the wound packs I have available.",
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(wares_woundpack);

wares_medpackcure = ConvoScreen:new {
	id = "wares_medpackcure",
	customDialogText = "Here are the cure packs I have available.",
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(wares_medpackcure);

wares_medpackdisease = ConvoScreen:new {
	id = "wares_medpackdisease",
	customDialogText = "Here are the disease packs I have available.",
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(wares_medpackdisease);

wares_enhacement = ConvoScreen:new {
	id = "wares_enhacement",
	customDialogText = "Here are the enhancements I have available.",
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(wares_enhacement);

wares_medpackpoison = ConvoScreen:new {
	id = "wares_medpackpoison",
	customDialogText = "Here are the poison packs I have available.",
	stopConversation = "true",
	options = {}
}
NPCVendorMedicineConvoTemplate:addScreen(wares_medpackpoison);

wares_petstim = ConvoScreen:new {
	id = "wares_petstim",
	customDialogText = "Here are the pet stimpacks I have available.",
	stopConversation = "true",
	options = {}
}NPCVendorMedicineConvoTemplate:addScreen(wares_petstim);
