local NPCVendor = require("screenplays.npcvendor.npc_vendor")

NPCVendorGenericConvoHandler = conv_handler:new {
    lootLevel = "novice"
}

function NPCVendorGenericConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedScreen = LuaConversationScreen(pConvScreen)

	elseif string.find(screenID, "wares_") ~= nil then --Ethan edit 5-10-24 (JUNK DEALER VENDOR) 	--Checks to see if we're on a "wares" screen
		NPCVendor:sendSaleSui(pNpc, pPlayer, screenID)
	elseif string.find(screenID, "hires_") ~= nil then
		NPCVendor:sendSaleSui(pNpc, pPlayer, screenID) --Ethan edit 5-15-24 (NPC VENDOR HIRES) testing
	elseif string.find(screenID, "resource_") ~= nil then
		NPCVendor:sendResourceSaleSui(pNpc,pPlayer,screenID);
	return pConvScreen
end

NPCVendorGenericConvoHandler = NPCVendorGenericConvoHandler:new {
    lootLevel = "novice"
}

NPCVendorNoviceConvoHandler = NPCVendorGenericConvoHandler:new {
    lootLevel = "novice"
}

NPCVendorMidConvoHandler = NPCVendorGenericConvoHandler:new {
    lootLevel = "mid"
}

NPCVendorMasterConvoHandler = NPCVendorGenericConvoHandler:new {
    lootLevel = "master"
}

