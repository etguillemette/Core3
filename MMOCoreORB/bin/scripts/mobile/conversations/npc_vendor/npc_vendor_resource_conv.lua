NPCVendorResourceConvoTemplate = ConvoTemplate:new {
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
		{"Do you by chance have any equipment I could purchase?", "start_vendor"}, --Ethan edit 5-11-24 (JUNK DEALER VENDOR)
		--{"@conversation/junk_dealer_finery:s_c86eba88", "start_sale"}, -- I think I have a few things that you might be interested in.
		--{"@conversation/junk_dealer_finery:s_370a03c", "no_loot"}, -- I don't think that I have anything you would be interested in.
	}
}
NPCVendorResourceConvoTemplate:addScreen(ask_for_loot);


addConversationTemplate("NPCVendorResourceConvoTemplate", NPCVendorResourceConvoTemplate);

--VENDOR------------------------------------
--------------------------------------------

--Ethan edit 5-10-24 (JUNK DEALER VENDOR)
start_vendor = ConvoScreen:new {
	id = "start_vendor",
	customDialogText = "Of course! I have plenty of odds and ends for the discerning buyer... What exactly were you looking for?",
	stopConversation = "false",
	options = {
		{"I am looking for some resources.", "resource_resource"},
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
NPCVendorResourceConvoTemplate:addScreen(start_vendor);

