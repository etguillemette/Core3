fenceGenericConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "FenceGenericConvoHandler",
	screens = {}
}

ask_for_loot = ConvoScreen:new {
	id = "ask_for_loot",
	customDialogText = "Hey. I don't suppose you have anything... Interesting... That you'd be willing to part with?",
	stopConversation = "false",
	options = {
		{"I'd like to pay off some debts with a faction.", "faction_start"}, --Ethan edit 12-27-24 (FACTION BROKER)
	}
}
fenceGenericConvoTemplate:addScreen(ask_for_loot);

start_sale = ConvoScreen:new {
	id = "start_sale",
	customDialogText = "Alright, show me what you have, and be quick...", -- Alright, let me see what you are offering.
	stopConversation = "true",
	options = {}
}
fenceGenericConvoTemplate:addScreen(start_sale);

no_loot = ConvoScreen:new {
	id = "no_loot",
	leftDialog = "@conversation/junk_dealer_generic:s_4bd9d15e", -- That is to bad. Remember to come visit me in the future if you happen to come across anything I would be interested in.
	stopConversation = "true",
	options = {}
}
fenceGenericConvoTemplate:addScreen(no_loot);


--FACTION BROKER----------------------------
--------------------------------------------
--Ethan edit 12-27-24 (FACTION BROKER)
faction_start = ConvoScreen:new {
	id = "faction_start",
	customDialogText = "I may be able to call in some favors with some of my contacts...",
	stopConversation = "true",
	options = {}
}
fenceGenericConvoTemplate:addScreen(faction_start);



--End Ethan edit 5-10-24 (JUNK DEALER VENDOR)

addConversationTemplate("fenceGenericConvoTemplate", fenceGenericConvoTemplate);
