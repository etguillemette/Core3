includeFile("junk_dealer/junkDealerData.lua") --Ethan edit 5-11-24 (JUNK DEALER VENDOR): Pulling in junk dealer data 
local ObjectManager = require("managers.object.object_manager") -- Ethan edit 5-11-24 (JUNK DEALER VENDOR):

--Ethan edit 5-11-24 (JUNK DEALER VENDOR): These are necessary for some stuff with the ware purchases
junkDealerScreenplay= ScreenPlay:new {
	errorCodes =  {
		SUCCESS = 0, INVENTORYFULL = 1,  NOTENOUGHCREDITS = 2, GENERALERROR = 3, ITEMCOST = 4, INVENTORYERROR = 5,
		TEMPLATEPATHERROR = 6, GIVEERROR = 7, DATAPADFULL = 8, DATAPADERROR = 9, TOOMANYHIRELINGS = 10, SCHEMATICERROR = 11,
	}
}
--End Ethan edit 5-11-24 (JUNK DEALER VENDOR): 


JunkDealer = {
	junkTypes = {
		{"generic", 1},
		{"finery", 2},
		{"arms", 4},
		{"geo", 8},
		{"tusken", 16},
		{"jedi", 32},
		{"jawa", 64},
		{"gungan", 128},
		{"corsec", 256}
	}
}

function JunkDealer:sendSellJunkSelection(pPlayer, pNpc, dealerType, skipItem)
	if pPlayer == nil or pNpc == nil then
		return
	end

	local junkList = self:getEligibleJunk(pPlayer, dealerType, skipItem)

	if #junkList == 0 then
		CreatureObject(pPlayer):sendSystemMessage("@loot_dealer:no_items") -- You have no items that the junk dealer wishes to buy.
		deleteStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
		return
	end

	local suiManager = LuaSuiManager()
	suiManager:sendListBox(pNpc, pPlayer, "@loot_dealer:sell_title", "@loot_dealer:sell_prompt", 3, "@cancel", "@loot_dealer:btn_sell_all", "@loot_dealer:btn_sell", "JunkDealer", "sellListSuiCallback", 10, junkList)
end

function JunkDealer:getDealerNum(dealerType)
	local dealerNum = 0

	for i = 1, #self.junkTypes, 1 do
		if string.find(dealerType, self.junkTypes[i][1]) ~= nil then
			dealerNum = self.junkTypes[i][2]
		end
	end

	return dealerNum
end

function JunkDealer:getEligibleJunk(pPlayer, dealerType, skipItem)
	local junkList = {}

	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if pInventory == nil then
		return junkList
	end

	local dealerNum = self:getDealerNum(dealerType)

	if dealerNum == 0 then
		return junkList
	end

	for i = 0, SceneObject(pInventory):getContainerObjectsSize() - 1, 1 do
		local pItem = SceneObject(pInventory):getContainerObject(i)

		if pItem ~= nil then
			local tano = TangibleObject(pItem)
			local sceno = SceneObject(pItem)
			if sceno:getObjectID() ~= skipItem then
				--Ethan edit 5-11-24 (JUNK DEALER VENDOR): removing the line "and tano:getCraftersName() == "" below...
				if tano:getJunkDealerNeeded() & dealerNum > 0 and not tano:isBroken() and not tano:isSliced() and not tano:isNoTrade() and sceno:getContainerObjectsSize() == 0 then
				--End Ethan edit 5-11-24 (JUNK DEALER VENDOR):
					local name = sceno:getDisplayedName()
					local value = tano:getJunkValue()
					local textTable = {"[" .. value .. "] " .. name, sceno:getObjectID()}
					table.insert(junkList, textTable)
				end
			end
		end
	end

	return junkList
end

function JunkDealer:sellListSuiCallback(pPlayer, pSui, eventIndex, otherPressed, rowIndex)
	local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")

	if pInventory == nil or eventIndex == 1 then
		deleteStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
		return
	end

	if (otherPressed == "true") then
		self:sellAllItems(pPlayer, pSui, pInventory)
	else
		rowIndex = tonumber(rowIndex)

		if (rowIndex == -1) then
			deleteStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
			return
		end

		self:sellItem(pPlayer, pSui, rowIndex, pInventory)
	end
end

function JunkDealer:sellAllItems(pPlayer, pSui, pInventory)
	deleteStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
	local listBox = LuaSuiListBox(pSui)
	local pNpc = listBox:getUsingObject()

	if pNpc == nil then
		return
	end

	local name = SceneObject(pNpc):getDisplayedName()
	local amount = 0

	for i = 0, listBox:getMenuSize() - 1, 1 do
		local oid = listBox:getMenuObjectID(i)
		local pItem = SceneObject(pInventory):getContainerObjectById(oid)

		if pItem ~= nil then
			local value = TangibleObject(pItem):getJunkValue()
			createEvent(10, "JunkDealer", "destroyItem", pItem, "")

			amount = amount + value
		end
	end

	CreatureObject(pPlayer):addCashCredits(amount, true)

	local messageString = LuaStringIdChatParameter("@loot_dealer:prose_sold_all_junk") -- You sell all of your loot to %TT for %DI credits
	messageString:setTT(name)
	messageString:setDI(amount)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())
end

function JunkDealer:destroyItem(pItem)
	if (pItem == nil) then
		return
	end

	SceneObject(pItem):destroyObjectFromWorld()
	SceneObject(pItem):destroyObjectFromDatabase()
end

function JunkDealer:sellItem(pPlayer, pSui, rowIndex, pInventory)
	local listBox = LuaSuiListBox(pSui)
	local pNpc = listBox:getUsingObject()
	local oid = listBox:getMenuObjectID(rowIndex)
	local pItem = SceneObject(pInventory):getContainerObjectById(oid)

	if pItem == nil or pNpc == nil then
		deleteStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
		return
	end

	local item = SceneObject(pItem)
	local skipItem = item:getObjectID()
	local name = item:getDisplayedName()
	local value = TangibleObject(pItem):getJunkValue()

	createEvent(10, "JunkDealer", "destroyItem", pItem, "")

	CreatureObject(pPlayer):addCashCredits(value, true)

	local messageString = LuaStringIdChatParameter("@loot_dealer:prose_sold_junk") -- You sell %TT for %DI credits.
	messageString:setTT(name)
	messageString:setDI(value)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())

	local dealerType = readStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
	self:sendSellJunkSelection(pPlayer, pNpc, dealerType, skipItem)
end

-----------------------------------------
--Ethan edit 5-11-24 (JUNK DEALER VENDOR): Multiple new functions

--Ethan edit 5-11-24 (JUNK DEALER VENDOR): Calls up a sale menu
function JunkDealer:sendSaleSui(pNpc, pPlayer, screenID)
	
	printf("calling sendSaleSui and screenID is: ")
	printf(screenID)
	printf("\n")
	
	if (pPlayer == nil or pNpc == nil) then
		return
	end


	writeStringData(CreatureObject(pPlayer):getObjectID() .. ":junk_dealer_purchase", screenID)
	local suiManager = LuaSuiManager()
	local waresData = self:getWaresTable(screenID)

	local options = { }
	for i = 1, #waresData, 1 do
		local ware = {getStringId(waresData[i].displayName) .. " (Cost: " .. waresData[i].cost .. ")", 0}
		table.insert(options, ware)
	end

	suiManager:sendListBox(pNpc, pPlayer, "@event_perk:pro_show_list_title", "@event_perk:pro_show_list_desc", 2, "@cancel", "", "@ok", "JunkDealer", "handleSuiPurchase", 32, options)
end

--Ethan edit 5-11-24 (JUNK DEALER VENDOR): Grabs the ware data tables from junkDealerData.lua
function JunkDealer:getWaresTable(category)
	
	printf("calling getWaresTable and category is: ")
	printf(category)
	printf("\n")

	if category == "wares_pistol" then
		return genericJunkData.waresPistol
	elseif category == "wares_rifle" then
		return genericJunkData.waresRifle
	end
end

--This functions is called by the conversation screenplay, and sends a list of items to the player for purchase
function JunkDealer:handleSuiPurchase(pPlayer, pSui, eventIndex, arg0)
	local cancelPressed = (eventIndex == 1)

	if (pPlayer == nil) then
		return
	end

	if (cancelPressed) then
		deleteStringData(CreatureObject(pPlayer):getObjectID() .. ":junk_dealer_purchase")
		return
	end

	local playerID = SceneObject(pPlayer):getObjectID()
	local purchaseCategory = readStringData(playerID .. ":junk_dealer_purchase")
	local purchaseIndex = arg0 + 1
	local waresData = self:getWaresTable(purchaseCategory)

	printf("purchseCategory is: ")
	printf(purchaseCategory)
	printf("\n")


	
	if (waresData == nil or purchaseIndex < 1 or purchaseIndex > #waresData) then
		return
	end

	if(purchaseCategory == "wares_pistol" or purchaseCategory == "wares_rifle") then
		local itemData = waresData[purchaseIndex]
		deleteStringData(playerID .. ":junk_dealer_purchase")
		self:giveItem(pPlayer, itemData)
	end
end


--Ethan edit 5-11-24 (JUNK DEALER VENDOR): Actually awards the item to the player
function JunkDealer:giveItem(pPlayer, itemData)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()


	printf("Calling giveItem and itemData is: ")
	printf(itemData.template)
	printf("\n")
		printf("Display name is: ")
	printf(itemData.displayName)
	printf("\n")

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



------------------------- END ETHAN EDIT


return JunkDealer
