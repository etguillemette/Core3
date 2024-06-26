junkDealerGenericConvoTemplate = ConvoTemplate:new {
	initialScreen = "ask_for_loot",
	templateType = "Lua",
	luaClassHandler = "NPCVendorConvoHandler",
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
junkDealerGenericConvoTemplate:addScreen(start_vendor);





--CHEF---------------------------------------
---------------------------------------------

vendor_chef = ConvoScreen:new {
	id = "vendor_chef",
	customDialogText = "I have some food, drink and desserts available. What would you like?",
	stopConversation = "false",
	options = {
		{"I was looking for a dessert.", "wares_dessert"},
		{"I was looking for a meal.", "wares_food"},
		{"I was looking for a drink.", "wares_drink"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_chef);


wares_dessert = ConvoScreen:new {
	id = "wares_dessert",
	customDialogText = "Here are the desserts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_dessert);

wares_food = ConvoScreen:new {
	id = "wares_food",
	customDialogText = "Here are the meals I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_food);

wares_drink = ConvoScreen:new {
	id = "wares_drink",
	customDialogText = "Here are the drinks I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_drink);

--COMPONENTS------------------------------
------------------------------------------

vendor_component = ConvoScreen:new {
	id = "vendor_component",
	customDialogText = "What kind of crafting components were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a crafting tool.", "wares_tools"},		
		{"I was looking for a chef crafting component.", "wares_compchef"},
		{"I was looking for an armorsmith crafting component.", "wares_comparmor"},
		{"I was looking for a bio-engineer crafting component.", "wares_compbio"},
		{"I was looking for a medical crafting component.", "wares_compchemistry"},
		{"I was looking for a tailor crafting component.", "wares_compclothing"},
		{"I was looking for a droid crafting component.", "wares_compdroid"},
		{"I was looking for a shipwright crafting component.", "wares_compshipwright"},
		{"I was looking for an architect crafting component.", "wares_compstructure"},
		{"I was looking for a weaponsmith crafting component.", "wares_compweapon"},
		{"I was looking for an artisan crafting component.", "wares_compartisan"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_component);


wares_compchef = ConvoScreen:new {
	id = "wares_compchef",
	customDialogText = "Here are the chef components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compchef);

wares_comparmor = ConvoScreen:new {
	id = "wares_comparmor",
	customDialogText = "Here are the armor components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_comparmor);

wares_compbio = ConvoScreen:new {
	id = "wares_compbio",
	customDialogText = "Here are the bio-engineer components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compbio);

wares_compchemistry = ConvoScreen:new {
	id = "wares_compchemistry",
	customDialogText = "Here are the medical components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compchemistry);

wares_compclothing = ConvoScreen:new {
	id = "wares_compclothing",
	customDialogText = "Here are the tailor components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compclothing);

wares_compdroid = ConvoScreen:new {
	id = "wares_compdroid",
	customDialogText = "Here are the droid components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compdroid);

wares_compartisan = ConvoScreen:new {
	id = "wares_compartisan",
	customDialogText = "Here are the artisan components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compartisan);

wares_compshipwright = ConvoScreen:new {
	id = "wares_compshipwright",
	customDialogText = "Here are the shipwright components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compshipwright);

wares_compstructure = ConvoScreen:new {
	id = "wares_compstructure",
	customDialogText = "Here are the structure components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compstructure);

wares_compweapon = ConvoScreen:new {
	id = "wares_compweapon",
	customDialogText = "Here are the weaponsmith components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_compweapon);

wares_tools = ConvoScreen:new {
	id = "wares_tools",
	customDialogText = "Here are the tools I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_tools);


--SCOUT--------------------------------------
---------------------------------------------

vendor_scout = ConvoScreen: new {
	id = "vendor_scout",
	customDialogText = "What kind of scout equipment were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a trap.", "wares_trap"},
		{"I was looking for camouflage.", "wares_camo"},
		{"I was looking for a camp.", "wares_camp"},
		{"Actually, I don't need anything right now.","no_loot"},		
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
	customDialogText = "Here are the camouflage kits I have available.",
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

--STRUCTURE------------------------------
---------------------------------------------

vendor_installation = ConvoScreen:new {
	id = "vendor_installation",
	customDialogText = "What sort of an installation were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for an installation deed.", "wares_installation"},
		{"I was looking for a house deed.", "wares_house"},
		{"I was looking for a city deed.", "wares_city"},
		{"I was looking for some furnishings.", "wares_furniture"},	
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_installation);

wares_installation = ConvoScreen:new {
	id = "wares_installation",
	customDialogText = "Here are the installation deeds I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_installation);

wares_city = ConvoScreen:new {
	id = "wares_city",
	customDialogText = "Here are the city deeds I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_city);

wares_house = ConvoScreen:new {	
	id = "wares_house",
	customDialogText = "Here are the house deeds I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_house);

wares_furniture = ConvoScreen:new {
	id = "wares_furniture",
	customDialogText = "Here are the furnishings I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_furniture);

--BIOENGINEER------------------------------
----------------------------------------------

vendor_bio = ConvoScreen:new {
	id = "vendor_bio",
	customDialogText = "What sort of bio-engineer goods were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a pet.", "wares_pets"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_bio);


wares_pets = ConvoScreen:new {
	id = "wares_pets",
	customDialogText = "Here are the pets I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_pets);

--DROID---------------------------------------
----------------------------------------------

vendor_droid = ConvoScreen:new {
	id = "vendor_droid",
	customDialogText = "What sort of droid goods were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a droid.", "wares_droid"},
		{"I was looking for a droid accessory.", "wares_droidassc"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_droid);

wares_droid = ConvoScreen:new {
	id = "wares_droid",
	customDialogText = "Here are the droids I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_droid);

wares_droidassc = ConvoScreen:new {
	id = "wares_droidassc",
	customDialogText = "Here are the droid accessories I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_droidassc);

--MISC------------------------------------------
-----------------------------------------------


vendor_misc = ConvoScreen:new {
	id = "vendor_misc",
	customDialogText = "What sort of miscellaneous goods were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for some fireworks.", "wares_fireworks"},
		{"I was looking for some generic items", "wares_misc"},
		{"Actually, I don't need anything right now.","no_loot"},
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_misc);

wares_fireworks = ConvoScreen:new {	
	id = "wares_fireworks",
	customDialogText = "Here are the fireworks I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_fireworks);

wares_misc = ConvoScreen:new {
	id = "wares_misc",
	customDialogText = "Here are the generic items I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_misc);

--SMUGGLER-----------------------------------
---------------------------------------------

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
junkDealerGenericConvoTemplate:addScreen(vendor_smuggler);

wares_slicing = ConvoScreen:new {
	id = "wares_slicing",
	customDialogText = "Here is the 'cutlery' I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_slicing);

wares_spice = ConvoScreen:new {
	id = "wares_spice",
	customDialogText = "Here are the 'seasonings' I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_spice);

--SHIP COMPONENT--------------------------
------------------------------------------

vendor_ship = ConvoScreen:new {
	id = "vendor_ship",
	customDialogText = "What kind of ship components were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a customization kit.", "wares_spacecustomization"},
		{"I was looking for a ship chassis.", "wares_spacechassis"},
		{"I was looking for a ship component.", "wares_spacepart"},
		{"I was looking for a missile/countermeasure pack.", "wares_spacemissile"},		
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_ship);

wares_spacecustomization = ConvoScreen:new {
	id = "wares_spacecustomization",
	customDialogText = "Here are the ship customization kits I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_spacecustomization);

wares_spacechassis = ConvoScreen:new {
	id = "wares_spacechassis",
	customDialogText = "Here are the ship chassies I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_spacechassis);

wares_spacepart = ConvoScreen:new {
	id = "wares_spacepart",
	customDialogText = "Here are the ship components I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_spacepart);

wares_spacemissile = ConvoScreen:new {
	id = "wares_spacemissile",
	customDialogText = "Here are the missiles and countermeasure packs I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_spacemissile);

--ENTERTAINER----------------------------
-----------------------------------------

vendor_entertainer = ConvoScreen:new {
	id = "vendor_entertainer",
	customDialogText = "What kind of entertainer goods were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for an instrument.", "wares_instrument"},
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_entertainer);

wares_instrument = ConvoScreen:new {
	id = "wares_instrument",
	customDialogText = "Here are the instruments I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_instrument);

--VEHICLE-------------------------------------
---------------------------------------------

vendor_vehicle = ConvoScreen:new {
	id = "vendor_vehicle",
	customDialogText = "What kind of ship components were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a civilian vehicle deed.", "wares_vehicle"},
		{"Actually, I don't need anything right now.", "no_loot"}
	}
}
junkDealerGenericConvoTemplate:addScreen(vendor_vehicle);

wares_vehicle = ConvoScreen:new {
	id = "wares_vehicle",
	customDialogText = "Here are the wares_vehicle I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(wares_vehicle);

--HIRELINGS----------------------------------
---------------------------------------------

vendor_hireling = ConvoScreen:new {
	id = "vendor_hireling",
	customDialogText = "What kind of a contract were you looking for?",
	stopConversation = "false",
	options = {
		{"I was looking for a marksman.", "hires_marksman"},
		{"I was looking for a brawler.", "hires_brawler"},
		{"I was looking for a medic.", "hires_medic"},
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

hires_medic = ConvoScreen:new {
	id = "hires_medic",
	customDialogText = "Here are the medic contracts I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(hires_medic);

--RESOURCES-----------------------------------
----------------------------------------------

resource_resource = ConvoScreen:new {
	id = "resource_resource",
	customDialogText = "Here are the resources I have available.",
	stopConversation = "true",
	options = {}
}
junkDealerGenericConvoTemplate:addScreen(resource_resource)

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
