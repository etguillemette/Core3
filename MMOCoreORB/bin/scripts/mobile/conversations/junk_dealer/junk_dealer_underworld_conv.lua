--Ethan addition 12-5-24 (SMUGGLER REVAMP) (SLICING REVAMP)

junkDealerUnderworldConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "junkDealerUnderworldConvoTemplate",
	screens = {}
}

ask_for_loot = ConvoScreen:new {
	id = "ask_for_loot",
	customDialogText  = "Hrmmm. You seem to be a discreet sort. Perhaps you are looking to do some business. If you have some... Sensitive items... I may be able to take them off your hands...",
	stopConversation = "false",
	options = {
		{"Do you by chance have any... 'Kitchenware' that I could purchase?", "vendor_smuggler"},
		--{"@conversation/junk_dealer_arms:s_c86eba88", "start_sale"}, -- I think I have a few things that you might be interested in.
		--{"@conversation/junk_dealer_arms:s_370a03c", "no_loot"}, -- I don't think that I have anything you would be interested in.
	}
}
junkDealerUnderworldConvoTemplate:addScreen(ask_for_loot);

start_sale = ConvoScreen:new {
	id = "start_sale",
	leftDialog = "@conversation/junk_dealer_arms:s_24f30320", -- Just remember what I said about discretion. My buyers would be less then pleased if the authorities got word of this transaction. And I don't think you want my buyers to be unhappy.
	stopConversation = "true",
	options = {}
}
junkDealerUnderworldConvoTemplate:addScreen(start_sale);

no_loot = ConvoScreen:new {
	id = "no_loot",
	leftDialog = "@conversation/junk_dealer_arms:s_df5bd64e", -- Right you are. Oh, and we never met.
	stopConversation = "true",
	options = {}
}
junkDealerUnderworldConvoTemplate:addScreen(no_loot);

vendor_smuggler = ConvoScreen:new {
	id = "vendor_smuggler",
	customDialogText = "What sort of... 'Kitchen goods' were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for some cutlery...", "wares_slicing"},
		{"I was looking for a little seasoning...", "wares_spice"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerUnderworldConvoTemplate:addScreen(vendor_smuggler);

wares_slicing = ConvoScreen:new {
	id = "wares_slicing",
	customDialogText = "Here is the 'cutlery' I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerUnderworldConvoTemplate:addScreen(wares_slicing);

wares_spice = ConvoScreen:new {
	id = "wares_spice",
	customDialogText = "Here are the 'seasonings' I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerUnderworldConvoTemplate:addScreen(wares_spice);


addConversationTemplate("junkDealerUnderworldConvoTemplate", junkDealerUnderworldConvoTemplate);
