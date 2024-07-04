junkDealerFineryConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "JunkDealerGenericConvoHandler",
	screens = {}
}

ask_for_loot = ConvoScreen:new {
	id = "ask_for_loot",
	leftDialog = "@conversation/junk_dealer_finery:s_9666d79a", -- Hello my friend. How are you doing today? I am a buyer of finery....clothing, jewelry, and such. If you happen to have anything that I might like to buy please let me know.
	stopConversation = "false",
	options = {
		{"Do you by chance have any equipment I could purchase?", "start_vendor"}, --Ethan edit 5-11-24 (JUNK DEALER VENDOR)
		--{"@conversation/junk_dealer_finery:s_c86eba88", "start_sale"}, -- I think I have a few things that you might be interested in.
		--{"@conversation/junk_dealer_finery:s_370a03c", "no_loot"}, -- I don't think that I have anything you would be interested in.
	}
}
junkDealerFineryConvoTemplate:addScreen(ask_for_loot);

start_sale = ConvoScreen:new {
	id = "start_sale",
	leftDialog = "@conversation/junk_dealer_finery:s_e8ceb290", -- That is wonderful news. Let me see what you have to offer and I will give you price on anything I wish to buy. Remember there is no obligation to sell but I certainly hope you decide to conduct your business with me.
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(start_sale);

no_loot = ConvoScreen:new {
	id = "no_loot",
	leftDialog = "@conversation/junk_dealer_finery:s_1eb9feb7", -- That is too bad. I was really hoping to get some new stock in today.
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(no_loot);

addConversationTemplate("junkDealerFineryConvoTemplate", junkDealerFineryConvoTemplate);

--VENDOR------------------------------------
--------------------------------------------

--Ethan edit 5-10-24 (JUNK DEALER VENDOR)
start_vendor = ConvoScreen:new {
	id = "start_vendor",
	customDialogText = "Of course! I have plenty of odds and ends for the discerning buyer... What exactly were you looking for?",
	stopConversation = "false",
	options = {
		{"I am looking for some clothing.", "vendor_wearables"},
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerFineryConvoTemplate:addScreen(start_vendor);


--CLOTHING--------------------------------
------------------------------------------

vendor_wearables = ConvoScreen:new {
	id = "vendor_wearables",
	customDialog = "Of course! What kind of clothing were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for an apron.", "wares_clothingapron"},
		{"I was looking for a backpack.", "wares_clothingbackpack"},
		{"I was looking for a bandolier.", "wares_clothingbandolier"},
		{"I was looking for a belt.", "wares_clothingbelt"},
		{"I was looking for a bikini.", "wares_clothingbikini"},
		{"I was looking for a bodysuit.", "wares_clothingbodysuit"},
		{"I was looking for a pair of boots.", "wares_clothingboots"},
		{"I was looking for a bracelet.", "wares_clothingbracelet"},
		{"I was looking for a necklace.", "wares_clothingnecklace"},
		{"I was looking for a pair of pants.", "wares_clothingpants"},
		{"I was looking for a ring.", "wares_clothingring"},
		{"I was looking for a shirt.", "wares_clothingshirt"},
		{"I was looking for a robe.", "wares_clothingrobe"},
		{"I was looking for a pair of shoes.", "wares_clothingshoes"},
		{"I was looking for a skirt.", "wares_clothingskirt"},
		{"I was looking for a vest.", "wares_clothingvest"},
		{"I was looking for wookie clothing.", "wares_clothingwookie"},
		{"I was looking for a bustier.", "wares_clothingbustier"},
		{"I was looking for a dress.", "wares_clothingdress"},
		{"I was looking for a pair of glvoes.", "wares_clothinggloves"},
		{"I was looking for a hat.", "wares_clothinghat"},
		{"I was looking for a jacket.", "wares_clothingjacket"},
		{"I was looking for an Ithorian shirt.", "wares_clothingithorianchest"},
		{"I was looking for an Ithorian hat.", "wares_clothingithorianheadwear"},
		{"I was looking for a pair of Ithorian gloves.", "wares_clothingithorianhandwear"},
		{"I was looking for Ithorian jewelry.", "wares_clothingithorianjewelry"},
		{"I was looking for a pair of Ithorian pants.", "wares_clothingithorianpants"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerFineryConvoTemplate:addScreen(vendor_wearables);


wares_clothingapron = ConvoScreen:new {
	id = "wares_clothingapron",
	customDialogText = "Here are the aprons I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingapron);

wares_clothingbackpack = ConvoScreen:new {
	id = "wares_clothingbackpack",
	customDialogText = "Here are the backpacks I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbackpack);

wares_clothingbandolier = ConvoScreen:new {
	id = "wares_clothingbandolier",
	customDialogText = "Here are the bandoliers I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbandolier);

wares_clothingbelt = ConvoScreen:new {
	id = "wares_clothingbelt",
	customDialogText = "Here are the belts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbelt);

wares_clothingbikini = ConvoScreen:new {
	id = "wares_clothingbikini",
	customDialogText = "Here are the bikinis I have available.",
	topConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbikini);

wares_clothingbodysuit = ConvoScreen:new {
	id = "wares_clothingbodysuit",
	customDialogText = "Here are the bodysuits I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbodysuit);

wares_clothingboots = ConvoScreen:new {
	id = "wares_clothingboots",
	customDialogText = "Here are the boots I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingboots);

wares_clothingbracelet = ConvoScreen:new {
	id = "wares_clothingbracelet",
	customDialogText = "Here are the bracelets I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbracelet);

wares_clothingnecklace = ConvoScreen:new {
	id = "wares_clothingnecklace",
	customDialogText = "Here are the necklaces I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingnecklace);

wares_clothingpants = ConvoScreen:new {
	id = "wares_clothingpants",
	customDialogText = "Here are the pants I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingpants);

wares_clothingring = ConvoScreen:new {
	id = "wares_clothingring",
	customDialogText = "Here are the rings I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingring);

wares_clothingshirt = ConvoScreen:new {
	id = "wares_clothingshirt",
	customDialogText = "Here are the shirts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingshirt);

wares_clothingrobe = ConvoScreen:new {
	id = "wares_clothingrobe",
	customDialogText = "Here are the robes I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingrobe);

wares_clothingshoes = ConvoScreen:new {
	id = "wares_clothingshoes",
	customDialogText = "Here are the shoes I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingshoes);

wares_clothingskirt = ConvoScreen:new {
	id = "wares_clothingskirt",
	customDialogText = "Here are the skirts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingskirt);

wares_clothingvest = ConvoScreen:new {
	id = "wares_clothingvest",
	customDialogText = "Here are the vests I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingvest);

wares_clothingwookie = ConvoScreen:new {
	id = "wares_clothingwookie",
	customDialogText = "Here are the wookie clothing I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingwookie);

wares_clothingbustier = ConvoScreen:new {
	id = "wares_clothingbustier",
	customDialogText = "Here are the bustiers I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingbustier);

wares_clothingdress = ConvoScreen:new {
	id = "wares_clothingdress",
	customDialogText = "Here are the dresses I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingdress);

wares_clothinggloves = ConvoScreen:new {
	id = "wares_clothinggloves",
	customDialogText = "Here are the gloves I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothinggloves);

wares_clothinghat = ConvoScreen:new {
	id = "wares_clothinghat",
	customDialogText = "Here are the hats I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothinghat);

wares_clothingjacket = ConvoScreen:new {
	id = "wares_clothingjacket",
	customDialogText = "Here are the jackets I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingjacket);

wares_clothingithorianchest = ConvoScreen:new {
	id = "wares_clothingithorianchest",
	customDialogText = "Here are the Ithorian shirts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingithorianchest);

wares_clothingithorianheadwear = ConvoScreen:new {
	id = "wares_clothingithorianheadwear",
	customDialogText = "Here are the Ithorian hats I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingithorianheadwear);

wares_clothingithorianhandwear = ConvoScreen:new {
	id = "wares_clothingithorianhandwear",
	customDialogText = "Here are the Ithorian handwear I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingithorianhandwear);

wares_clothingithorianjewelry = ConvoScreen:new {
	id = "wares_clothingithorianjewelry",
	customDialogText = "Here are the Ithorian jewelries I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingithorianjewelry);

wares_clothingithorianpants = ConvoScreen:new {
	id = "wares_clothingithorianpants",
	customDialogText = "Here are the Ithorian pants I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerFineryConvoTemplate:addScreen(wares_clothingithorianpants);