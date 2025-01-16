local ObjectManager = require("managers.object.object_manager")

Fence = {
	junkTypes = {
		{"generic", 1},
		{"finery", 2},
		{"arms", 4},
		{"geo", 8},
		{"tusken", 16},
		{"jedi", 32},
		{"jawa", 64},
		{"gungan", 128},
		{"corsec", 256},
		{"underworld", 512} --Ethan edit 12-5-24 (SMUGGLER REVAMP) (SLICING REVAMP)
	}
}

function Fence:sendSellJunkSelection(pPlayer, pNpc, dealerType, skipItem)
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
	suiManager:sendListBox(pNpc, pPlayer, "@loot_dealer:sell_title", "@loot_dealer:sell_prompt", 3, "@cancel", "@loot_dealer:btn_sell_all", "@loot_dealer:btn_sell", "Fence", "sellListSuiCallback", 10, junkList)
end

function Fence:getDealerNum(dealerType)
	local dealerNum = 0

	for i = 1, #self.junkTypes, 1 do
		if string.find(dealerType, self.junkTypes[i][1]) ~= nil then
			dealerNum = self.junkTypes[i][2]
		end
	end

	return dealerNum
end

function Fence:getEligibleJunk(pPlayer, dealerType, skipItem)
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

			--Ethan edit 12-18-24 (MERCHANT BONUS)
			local merchantBonus = 1.0 + (self:getMerchantSkill(pPlayer)/100)
			--End Ethan edit 12-18-24 (MERCHANT BONUS)

			if sceno:getObjectID() ~= skipItem then
				if tano:getJunkDealerNeeded() & dealerNum == 512 and not tano:isBroken() and not tano:isNoTrade() and sceno:getContainerObjectsSize() == 0 then
					local name = sceno:getDisplayedName()
					local value = math.floor(tano:getJunkValue() * merchantBonus) --Ethan edit 12-18-24 (MERCHANT BONUS)
					local textTable = {"[" .. value .. "] " .. name, sceno:getObjectID()}
					table.insert(junkList, textTable)
				end
			end
		end
	end

	return junkList
end

function Fence:sellListSuiCallback(pPlayer, pSui, eventIndex, otherPressed, rowIndex)
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

function Fence:sellAllItems(pPlayer, pSui, pInventory)
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
			createEvent(10, "Fence", "destroyItem", pItem, "")

			amount = amount + value
		end
	end

	local merchantBonus = 1.0 + (self:getMerchantSkill(pPlayer) / 100);
	amount = math.floor(amount * merchantBonus);
	
	CreatureObject(pPlayer):addCashCredits(amount, true)

	if CreatureObject(pPlayer):hasSkill("crafting_artisan_business_04") then 
		local xpValue = math.floor(amount/10)
		if(xpValue > 0) then
			CreatureObject(pPlayer):awardExperience("merchant", xpValue, true)
		end
	end

	local messageString = LuaStringIdChatParameter("@loot_dealer:prose_sold_all_junk") -- You sell all of your loot to %TT for %DI credits
	messageString:setTT(name)
	messageString:setDI(amount)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())
end

function Fence:destroyItem(pItem)
	if (pItem == nil) then
		return
	end

	SceneObject(pItem):destroyObjectFromWorld()
	SceneObject(pItem):destroyObjectFromDatabase()
end

function Fence:sellItem(pPlayer, pSui, rowIndex, pInventory)
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

	createEvent(10, "Fence", "destroyItem", pItem, "")

	local merchantBonus = 1.0 + (self:getMerchantSkill(pPlayer) / 100);
	value = math.floor(value * merchantBonus);

	CreatureObject(pPlayer):addCashCredits(value, true)

	if CreatureObject(pPlayer):hasSkill("crafting_artisan_business_04") then 
		local xpValue = math.floor(value/10)
		if(xpValue > 0) then
			CreatureObject(pPlayer):awardExperience("merchant", xpValue, true)
		end
	end 

	local messageString = LuaStringIdChatParameter("@loot_dealer:prose_sold_junk") -- You sell %TT for %DI credits.
	messageString:setTT(name)
	messageString:setDI(value)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())

	local dealerType = readStringData(SceneObject(pPlayer):getObjectID() .. ":junkDealerType")
	self:sendSellJunkSelection(pPlayer, pNpc, dealerType, skipItem)
end

--Ethan edit 12-18-24 (MERCHANT BONUS)
function Fence:getMerchantSkill(pPlayer)
	
	local merchantBonus = 0

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_novice") then 
		merchantBonus = merchantBonus + 4
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_advertising_01") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_advertising_02") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_advertising_03") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_advertising_04") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_sales_01") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_sales_02") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_sales_03") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_sales_04") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_hiring_01") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_hiring_02") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_hiring_03") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_hiring_04") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_management_01") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_management_02") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_management_03") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_management_04") then 
		merchantBonus = merchantBonus + 2
	end

	if CreatureObject(pPlayer):hasSkill("crafting_merchant_master") then 
		merchantBonus = merchantBonus + 4
	end

	return merchantBonus
end
--End Ethan edit 12-18-24 (MERCHANT BONUS)

return Fence


