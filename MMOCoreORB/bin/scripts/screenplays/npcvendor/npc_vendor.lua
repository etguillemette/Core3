includeFile("npcvendor/npc_vendor_data.lua")
includeFile("../managers/resource_manager_spawns.lua")
local ObjectManager = require("managers.object.object_manager")

NPCVendorScreenplay = ScreenPlay:new {
	errorCodes =  {
		SUCCESS = 0, INVENTORYFULL = 1,  NOTENOUGHCREDITS = 2, GENERALERROR = 3, ITEMCOST = 4, INVENTORYERROR = 5,
		TEMPLATEPATHERROR = 6, GIVEERROR = 7, DATAPADFULL = 8, DATAPADERROR = 9, TOOMANYHIRELINGS = 10, SCHEMATICERROR = 11,
	}
}

NPCVendor = {
	errorCodes =  {
		SUCCESS = 0, INVENTORYFULL = 1,  NOTENOUGHCREDITS = 2, GENERALERROR = 3, ITEMCOST = 4, INVENTORYERROR = 5,
		TEMPLATEPATHERROR = 6, GIVEERROR = 7, DATAPADFULL = 8, DATAPADERROR = 9, TOOMANYHIRELINGS = 10, SCHEMATICERROR = 11,
	},

	globalPriceModifier = 2.0,
}




--Calls up a sale menu
function NPCVendor:sendSaleSui(pNpc, pPlayer, screenID)

	if (pPlayer == nil or pNpc == nil) then
		return
	end


	writeStringData(CreatureObject(pPlayer):getObjectID() .. ":npc_vendor_purchase", screenID)
	local suiManager = LuaSuiManager()
	local waresData = self:getWaresTable(screenID)

	print(screenID)


	--Filter inventory based on the planet the vendor is on, with certain higher level planets receiving more advanced inventory
	local zoneName = CreatureObject(pPlayer):getZoneName()
	local inventoryTable = genericWaresData.planetInventory[zoneName]

	local startIndex = math.floor(inventoryTable.inventoryStartIndex * #waresData)

	if startIndex < 1 then
		startIndex = 1
	end

	local endIndex = math.ceil(inventoryTable.inventoryEndIndex * #waresData)
	
	local options = { }
	--	for i = 1, #waresData, 1 do --TESTING
	for i = startIndex, endIndex, 1 do
		
		local quantity = waresData[i].quantity

		if(quantity == nil) then
			quantity = 1
		end

		local itemCost = waresData[i].cost * NPCVendor.globalPriceModifier
		local ware = {getStringId(waresData[i].displayName) .. " (Cost: " .. (itemCost) .. ") Qty: (x" .. waresData[i].quantity .. ")", 0}
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
	elseif category == "wares_onehanded" then
		return genericWaresData.waresOneHanded
	elseif category == "wares_polearm" then
		return genericWaresData.waresPolearm
	elseif category == "wares_twohanded" then
		return genericWaresData.waresTwoHanded
	elseif category == "wares_unarmed" then
		return genericWaresData.waresUnarmed
	elseif category == "wares_heavyweapon" then
		return genericWaresData.waresHeavyWeapon
	elseif category == "wares_munition" then
		return genericWaresData.waresMunition
	elseif category == "wares_powerup" then
		return genericWaresData.waresPowerup
	elseif category == "wares_armorhelm" then
		return genericWaresData.waresArmorHelm
	elseif category == "wares_armorchest" then
		return genericWaresData.waresArmorChest
	elseif category == "wares_armorleg" then
		return genericWaresData.waresArmorLeg
	elseif category == "wares_armorarm" then
		return genericWaresData.waresArmorArm
	elseif category == "wares_armoraccessory" then
		return genericWaresData.waresArmorAccessory
	elseif category == "wares_clothingapron" then
		return genericWaresData.waresClothingApron
	elseif category == "wares_clothingbackpack" then
		return genericWaresData.waresClothingBackpack
	elseif category == "wares_clothingbandolier" then
		return genericWaresData.waresClothingBandolier
	elseif category == "wares_clothingbelt" then
		return genericWaresData.waresClothingBelt
	elseif category == "wares_clothingbikini" then
		return genericWaresData.waresClothingBikini
	elseif category == "wares_clothingbodysuit" then
		return genericWaresData.waresClothingBodysuit
	elseif category == "wares_clothingboots" then
		return genericWaresData.waresClothingBoots
	elseif category == "wares_clothingbracelet" then
		return genericWaresData.waresClothingBracelet
	elseif category == "wares_clothingnecklace" then
		return genericWaresData.waresClothingNecklace
	elseif category == "wares_clothingpants" then
		return genericWaresData.waresClothingPants
	elseif category == "wares_clothingring" then
		return genericWaresData.waresClothingRing
	elseif category == "wares_clothingshirt" then
		return genericWaresData.waresClothingShirt
	elseif category == "wares_clothingrobe" then
		return genericWaresData.waresClothingRobe
	elseif category == "wares_clothingshoes" then
		return genericWaresData.waresClothingShoes
	elseif category == "wares_clothingskirt" then
		return genericWaresData.waresClothingSkirt
	elseif category == "wares_clothingvest" then
		return genericWaresData.waresClothingVest
	elseif category == "wares_clothingwookie" then
		return genericWaresData.waresClothingWookie
	elseif category == "wares_clothingbustier" then
		return genericWaresData.waresClothingBustier
	elseif category == "wares_clothingdress" then
		return genericWaresData.waresClothingDress
	elseif category == "wares_clothinggloves" then
		return genericWaresData.waresClothingGloves
	elseif category == "wares_clothinghat" then
		return genericWaresData.waresClothingHat
	elseif category == "wares_clothingjacket" then
		return genericWaresData.waresClothingJacket
	elseif category == "wares_clothingithorianchest" then
		return genericWaresData.waresClothingIthorianChest
	elseif category == "wares_clothingithorianheadwear" then
		return genericWaresData.waresClothingIthorianHeadwear
	elseif category == "wares_clothingithorianhandwear" then
		return genericWaresData.waresClothingIthorianHandwear
	elseif category == "wares_clothingithorianjewelry" then
		return genericWaresData.waresClothingIthorianJewelry
	elseif category == "wares_clothingithorianpants" then
		return genericWaresData.waresClothingIthorianPants
	elseif category == "wares_stim" then
		return genericWaresData.waresStim
	elseif category == "wares_woundpack" then
		return genericWaresData.waresWoundPack
	elseif category == "wares_medpackcure" then
		return genericWaresData.waresMedpackCure
	elseif category == "wares_medpackdisease" then
		return genericWaresData.waresMedpackDisease
	elseif category == "wares_enhacement" then
		return genericWaresData.waresEnhacement
	elseif category == "wares_medpackpoison" then
		return genericWaresData.waresMedpackPoison
	elseif category == "wares_petstim" then
		return genericWaresData.waresPetStim
	elseif category == "wares_dessert" then
		return genericWaresData.waresDessert
	elseif category == "wares_food" then
		return genericWaresData.waresFood
	elseif category == "wares_drink" then
		return genericWaresData.waresDrink
	elseif category == "wares_compchef" then
		return genericWaresData.waresCompChef
	elseif category == "wares_comparmor" then
		return genericWaresData.waresCompArmor
	elseif category == "wares_compbio" then
		return genericWaresData.waresCompBio
	elseif category == "wares_compchemistry" then
		return genericWaresData.waresCompChemistry
	elseif category == "wares_compclothing" then
		return genericWaresData.waresCompClothing
	elseif category == "wares_compdroid" then
		return genericWaresData.waresCompDroid
	elseif category == "wares_tools" then
		return genericWaresData.waresTools
	elseif category == "wares_compartisan" then
		return genericWaresData.waresCompArtisan
	elseif category == "wares_trap" then
		return genericWaresData.waresTrap
	elseif category == "wares_camo" then
		return genericWaresData.waresCamo
	elseif category == "wares_camp" then
		return genericWaresData.waresCamp
	elseif category == "wares_compshipwright" then
		return genericWaresData.waresCompShipwright
	elseif category == "wares_installation" then
		return genericWaresData.waresInstallation
	elseif category == "wares_city" then
		return genericWaresData.waresCity
	elseif category == "wares_compstructure" then
		return genericWaresData.waresCompStructure
	elseif category == "wares_compweapon" then
		return genericWaresData.waresCompWeapon
	elseif category == "wares_furniture" then
		return genericWaresData.waresFurniture
	elseif category == "wares_house" then
		return genericWaresData.waresHouse
	elseif category == "wares_pets" then
		return genericWaresData.waresPets
	elseif category == "wares_droid" then
		return genericWaresData.waresDroid
	elseif category == "wares_droidassc" then
		return genericWaresData.waresDroidAssc
	elseif category == "wares_fireworks" then
		return genericWaresData.waresFireworks
	elseif category == "wares_misc" then
		return genericWaresData.waresMisc
	elseif category == "wares_slicing" then
		return genericWaresData.waresSlicing
	elseif category == "wares_spice" then
		return genericWaresData.waresSpice
	elseif category == "wares_spacecustomization" then
		return genericWaresData.waresSpaceCustomization
	elseif category == "wares_spacechassis" then
		return genericWaresData.waresSpaceChassis
	elseif category == "wares_spacepart" then
		return genericWaresData.waresSpacePart
	elseif category == "wares_spacemissile" then
		return genericWaresData.waresSpaceMissile
	elseif category == "wares_instrument" then
		return genericWaresData.waresInstrument
	elseif category == "wares_vehicle" then
		return genericWaresData.waresVehicle
	elseif category == "hires_marksman" then
		return genericWaresData.hiresMarksman
	elseif category == "hires_brawler" then
		return genericWaresData.hiresBrawler
	elseif category == "hires_medic" then
		return genericWaresData.hiresMedic
	elseif category == "wares_resource" then
		return genericWaresData.waresResource
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

	print(purchaseCategory)

	local itemData = waresData[purchaseIndex]

	if string.find(purchaseCategory, "wares_") ~= nil  then 
		deleteStringData(playerID .. ":npc_vendor_purchase")
		self:giveItem(pPlayer, itemData)
	end

	if string.find(purchaseCategory, "hires_") ~= nil then
		deleteStringData(playerID .. ":npc_vendor_purchase")
		self:awardData(pPlayer,itemData)
	end

	if string.find(purchaseCategory, "services_") ~= nil then
		deleteStringData(playerID .. ":npc_vendor_purchase")
		self:giveService(pPlayer,itemData)
	end

	--if string.find(purchaseCategory, "resources_") ~= nil then
	--	deleteStringData(playerID .. ":npc_vendor_purchase")
	--	self:giveResource(pPlayer,itemData)
	--end
end


--Handles the actual handoff of the item to the player
function NPCVendor:giveItem(pPlayer, itemData)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()


	if (pGhost == nil) then
		return
	end
	local itemCost = itemData.cost * NPCVendor.globalPriceModifier
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	if (CreatureObject(pPlayer):getCashCredits() < itemCost) then
		CreatureObject(pPlayer):sendSystemMessage("@dispenser:insufficient_funds")
		return
	elseif (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("@event_perk:promoter_full_inv")
		return
	end

	CreatureObject(pPlayer):subtractCashCredits(itemCost)

	local messageString = LuaStringIdChatParameter("@bartender:prose_buy_pass")
	messageString:setTT(itemData.displayName)
	messageString:setDI(itemCost)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())


	local templatePath = itemData.template
	local newSerial = itemData.serial
	local quantity = itemData.quantity
	
	if(quantity == nil) then
		quantity = 1
	end

	if(templatePath ~= nil) then
		for i = 1, quantity do
			local pItem = giveItem(pInventory, templatePath, -1)
			local tano = TangibleObject(pItem)
			if(newSerial ~= nil) then
				tano:setSerialNumber(newSerial)
			end
			if(pItem ~= nil) then
				if(SceneObject(pInventory):isContainerFullRecursive() == false) then
					PlayerObject(pGhost):addEventPerk(pItem)
				end
			else
				CreatureObject(pPlayer):sendSystemMessage("@event_perk:promoter_full_inv")
			end
		end	
	end

	--[[
	local pItem = giveItem(pInventory, templatePath, -1)

	local newSerial = itemData.serial
	local quantity = itemData.quantity
	local tano = TangibleObject(pItem)

	if(newSerial ~= nil) then
		tano:setSerialNumber(newSerial)
	end

	if (pItem ~= nil) then
		if(quantity ~= nil) then
			for i = 1, quantity do	
				if(SceneObject(pInventory):isContainerFullRecursive() == false) then
					local pItemStack = giveItem(pInventory,templatePath, -1)
					if(pItemStack ~= nil) then
						PlayerObject(pGhost):addEventPerk(pItemStack)
					end
				else
					CreatureObject(pPlayer):sendSystemMessage("@event_perk:promoter_full_inv")
				end
			end
		else
			if(SceneObject(pInventory):isContainerFullRecursive() == false) then
				PlayerObject(pGhost):addEventPerk(pItem)
			else
				CreatureObject(pPlayer):sendSystemMessage("@event_perk:promoter_full_inv")
			end
		end
	end
	--]]
end


--HIRELINGS-------------------------------------------------
------------------------------------------------------------


--Essentially checks that all the data is valid before creating the control device for a hireling
function NPCVendor:awardData(pPlayer, itemData)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return self.errorCodes.DATAPADERROR
	end

	local pDatapad = SceneObject(pPlayer):getSlottedObject("datapad")

	if pDatapad == nil then
		return self.errorCodes.DATAPADERROR
	end

	local itemCost = itemData.cost * NPCVendor.globalPriceModifier

	if itemCost == nil then
		return self.errorCodes.ITEMCOST
	end

	local slotsRemaining = SceneObject(pDatapad):getContainerVolumeLimit() - SceneObject(pDatapad):getCountableObjectsRecursive()

	if (slotsRemaining < 1) then
		return self.errorCodes.DATAPADFULL
	end

	local transferResult = self:transferData(pPlayer, pDatapad, itemData)

	if(transferResult ~= self.errorCodes.SUCCESS) then
		return transferResult
	end

	if (CreatureObject(pPlayer):getCashCredits() < itemCost) then
		CreatureObject(pPlayer):sendSystemMessage("@dispenser:insufficient_funds")
		return
	end

	CreatureObject(pPlayer):subtractCashCredits(itemCost)

	local messageString = LuaStringIdChatParameter("@faction_recruiter:hireling_purchase_complete") -- The %TT is now under your command.
	messageString:setTT(itemData.displayName)
	CreatureObject(pPlayer):sendSystemMessage(messageString:_getObject())

	return self.errorCodes.SUCCESS
end


--This function actually gives the data (hireling) to the player. It is called by function awardData()
function NPCVendor:transferData(pPlayer, pDatapad, itemData)
	local pItem
	local templatePath = itemData.template

	if templatePath == nil then
		return self.errorCodes.TEMPLATEPATHERROR
	end

	local genPath = itemData.controlledObjectTemplate

	if genPath == nil then
		return self.errorCodes.TEMPLATEPATHERROR
	end

	--if (self:isHireling(faction, itemString)) then
	if (checkTooManyHirelings(pDatapad)) then
		return self.errorCodes.TOOMANYHIRELINGS
	end

	pItem = giveHirelingControlDevice(pDatapad, templatePath, genPath, -1, true)
	--else
	--	pItem = giveControlDevice(pDatapad, templatePath, genPath, -1, false)
	--end

	print(templatePath)
	print(genPath)

	if pItem ~= nil then
		SceneObject(pItem):sendTo(pPlayer)
	else
		return self.errorCodes.GIVEERROR
	end

	return self.errorCodes.SUCCESS
end


--RESOURCES-------------------------------------------------
------------------------------------------------------------

--Calls up a sale menu
function NPCVendor:sendResourceSaleSui(pNpc, pPlayer, screenID)

	if (pPlayer == nil or pNpc == nil) then
		return
	end


	writeStringData(CreatureObject(pPlayer):getObjectID() .. ":npc_vendor_purchase", screenID)
	local suiManager = LuaSuiManager()
	--sendResourceListBox(SceneObject* player, const String& title, const String& text, const String& cancelButton, const String& otherButton, const String& okButton, const String& screenplay, const String& callback, const float& forceCloseDist);
	suiManager:sendResourceListBox(pPlayer,"@veteran:resource_title","@veteran:choose_class","@cancel","@back","@ok","NPCVendor","ResourceDeedSuiCallback",32)
	--suiManager:sendListBox(pNpc, pPlayer, "@event_perk:pro_show_list_title", "@event_perk:pro_show_list_desc", 2, "@cancel", "", "@ok", "NPCVendor", "handleSuiPurchase", 32, options)
	--suiManager:sendListBox(pNpc, pPlayer, "Title", "Description", 3, "@cancel", "@back", "&ok", "Resources", "ResourceDeedCallback", 32, options);
	--suiManager:sendListBox(pNpc, pPlayer, "@veteran:resource_title", "@veteran:choose_class", 3, "@cancel", "@back", "@ok", "Resources", "ResourceDeedSuiCallback", 32, "Resources")
	--suiManager:sendResourceSaleSui(pPlayer)
end

return NPCVendor
