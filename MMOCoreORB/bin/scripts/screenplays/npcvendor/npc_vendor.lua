includeFile("npcvendor/npc_vendor_data.lua")
local ObjectManager = require("managers.object.object_manager")

NPCVendorScreenplay= ScreenPlay:new {
	errorCodes =  {
		SUCCESS = 0, INVENTORYFULL = 1,  NOTENOUGHCREDITS = 2, GENERALERROR = 3, ITEMCOST = 4, INVENTORYERROR = 5,
		TEMPLATEPATHERROR = 6, GIVEERROR = 7, DATAPADFULL = 8, DATAPADERROR = 9, TOOMANYHIRELINGS = 10, SCHEMATICERROR = 11,
	}
}

NPCVendor = {

}


--Calls up a sale menu
function NPCVendor:sendSaleSui(pNpc, pPlayer, screenID)

	if (pPlayer == nil or pNpc == nil) then
		return
	end


	writeStringData(CreatureObject(pPlayer):getObjectID() .. ":npc_vendor_purchase", screenID)
	local suiManager = LuaSuiManager()
	local waresData = self:getWaresTable(screenID)

	local options = { }
	for i = 1, #waresData, 1 do
		local ware = {getStringId(waresData[i].displayName) .. " (Cost: " .. waresData[i].cost .. ")", 0}
		table.insert(options, ware)
	end

	suiManager:sendListBox(pNpc, pPlayer, "@event_perk:pro_show_list_title", "@event_perk:pro_show_list_desc", 2, "@cancel", "", "@ok", "NPCVendor", "handleSuiPurchase", 32, options)
end

function NPCVendor:getWaresTable(category)
	
	if category == "wares_pistol" then
		return genericWaresData.waresPistol
	elseif category == "wares_rifle" then
		return genericWaresData.waresRifle
	elseif category == "wares_carbine" then
		return genericWaresData.waresCarbine
	elseif category == "wares_oh" then
		return genericWaresData.waresOneHanded
	elseif category == "wares_th" then
		return genericWaresData.waresTwoHanded
	elseif category == "wares_pole" then
		return genericWaresData.waresPolearm
	elseif category == "wares_ua" then
		return genericWaresData.waresUnarmed
	elseif category == "wares_heavy" then
		return genericWaresData.waresHeavyWeapons
	elseif category == "wares_bone" then
		return genericWaresData.waresBone
	elseif category == "wares_chitin" then
		return genericWaresData.waresChitin
	elseif category == "wares_mabari" then
		return genericWaresData.waresMabari
	elseif category == "wares_tantel" then
		return genericWaresData.waresTantel
	elseif category == "wares_ubese" then
		return genericWaresData.waresUbese
	elseif category == "wares_padded" then
		return genericWaresData.waresPadded
	elseif category == "wares_composite" then
		return genericWaresData.waresComposite
	elseif category == "wares_guardian" then
		return genericWaresData.waresGuardian
	elseif category == "wares_defender" then
		return genericWaresData.waresDefender
	elseif category == "wares_sentinel" then
		return genericWaresData.waresSentinel
	elseif category == "wares_ceremonial" then
		return genericWaresData.waresCeremonial
	elseif category == "wares_mountain" then
		return genericWaresData.waresMountain
	elseif category == "wares_hunting" then
		return genericWaresData.waresHunting
	elseif category == "wares_stim" then
		return genericWaresData.waresStim
	elseif category == "deeds_harvester" then
		return genericWaresData.deedsHarvester
	end
end

--This functions is called by the conversation screenplay, and sends a list of items to the player for purchase
function NPCVendor:handleSuiPurchase(pPlayer, pSui, eventIndex, arg0)
	local cancelPressed = (eventIndex == 1)

	if (pPlayer == nil) then
		return
	end

	if (cancelPressed) then
		deleteStringData(CreatureObject(pPlayer):getObjectID() .. ":npc_vendor_purchase")
		return
	end

	local playerID = SceneObject(pPlayer):getObjectID()
	local purchaseCategory = readStringData(playerID .. ":npc_vendor_purchase")
	local purchaseIndex = arg0 + 1
	local waresData = self:getWaresTable(purchaseCategory)
	
	if (waresData == nil or purchaseIndex < 1 or purchaseIndex > #waresData) then
		return
	end

	local itemData = waresData[purchaseIndex]

	if string.find(purchaseCategory, "wares_") ~= nil  then 
		deleteStringData(playerID .. ":npc_vendor_purchase")
		self:giveItem(pPlayer, itemData)
	end
	--Ethan edit 5-15-24 testing deed additions:
	if string.find(purchaseCategory, "deeds_") ~= nil then
		deleteStringData(playerID .. ":npc_vendor_purchase")
		self:transferDeed(pPlayer, itemData)
	end
end

--Handles the actual handoff of the item to the player
function NPCVendor:giveItem(pPlayer, itemData)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()


	if (pGhost == nil) then
		return
	end

	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (CreatureObject(pPlayer):getCashCredits() < itemData.cost) then
		CreatureObject(pPlayer):sendSystemMessage("@dispenser:insufficient_funds")
		return
	elseif (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("@event_perk:promoter_full_inv")
		return
	end

	CreatureObject(pPlayer):subtractCashCredits(itemData.cost)

	local messageString = LuaStringIdChatParameter("@bartender:prose_buy_pass")
	messageString:setTT(itemData.displayName)
	messageString:setDI(itemData.cost)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())


	local templatePath

	templatePath = itemData.template

	local pItem = giveItem(pInventory, templatePath, -1)

	if (pItem ~= nil) then
		PlayerObject(pGhost):addEventPerk(pItem)
	end
end

--Ethan edit 5-15-24 testing (NPC VENDOR) Testing to see if I can add functions for awarding schematics and hirelings as well:
function NPCVendor:transferDeed(pPlayer, itemData)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return
	end
	
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (CreatureObject(pPlayer):getCashCredits() < itemData.cost) then
		CreatureObject(pPlayer):sendSystemMessage("@dispenser:insufficient_funds")
		return
	elseif (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("@event_perk:promoter_full_inv")
		return
	end


	local templatePath = itemData.template
	
	if templatePath == nil then
		return self.errorCodes.TEMPLATEPATHERROR
	end

	CreatureObject(pPlayer):subtractCashCredits(itemData.cost)

	local messageString = LuaStringIdChatParameter("@bartender:prose_buy_pass")
	messageString:setTT(itemData.displayName)
	messageString:setDI(itemData.cost)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())

	local pItem = giveItem(pInventory, templatePath, -1)

	if (pItem == nil) then
		return self.errorCodes.GIVEERROR
	end


	SceneObject(pItem):setObjectName("deed", itemData.displayName, true)
	local deed = LuaDeed(pItem)
	local genPath = itemData.generatedObjectTemplate

	if genPath == nil then
		return self.errorCodes.TEMPLATEPATHERROR
	end

	deed:setGeneratedObjectTemplate(genPath)

	return self.errorCodes.SUCCESS
end



return NPCVendor