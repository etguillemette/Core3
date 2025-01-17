--Ethan edit 1-16-25 (SMUGGLER REVAMP)
local Fence = require("screenplays.fence.fence")
local NPCVendor = require("screenplays.npcvendor.npc_vendor")

FenceGenericConvoHandler = conv_handler:new {
	junkType = "",
	noLootText = "",
	startSaleText = "",
	inventorText = "",
	isJawa = false
}

function FenceGenericConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedScreen = LuaConversationScreen(pConvScreen)

	if screenID == "ask_for_loot" then
		print(junkType); --Ethan edit 12-11-24 TESTING

		local junkList = Fence:getEligibleJunk(pPlayer, self.junkType)

		if #junkList > 0 then
			clonedScreen:addOption(self.startSaleText, "start_sale")
		end

		clonedScreen:addOption(self.noLootText, "no_loot")

	elseif screenID == "start_sale" then
		writeStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType", self.junkType)
		Fence:sendSellJunkSelection(pPlayer, pNpc, self.junkType)
	elseif string.find(screenID, "faction_") ~= nil then
		NPCVendor:sendSaleSui(pNpc, pPlayer, screenID)
	end
	return pConvScreen
end


FenceGenericConvoHandler = FenceGenericConvoHandler:new {
	junkType = "underworld",
	noLootText = "@conversation/junk_dealer_generic:s_cd7a3f41",
	startSaleText = "@conversation/junk_dealer_generic:s_54fab04f",
}
--End Ethan edit 1-16-25 (SMUGGLER REVAMP)