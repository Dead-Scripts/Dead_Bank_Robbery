-----------------------
--- DeadBankRobbery ---
-----------------------
--- Server ---
robberyActive = false
RegisterNetEvent('DeadBankRobbery:IsActive')
AddEventHandler('DeadBankRobbery:IsActive', function()
	-- Check if active or not
	if robberyActive then
		-- One is active
		TriggerClientEvent('DeadBankRobbery:IsActive:Return', source, true)
	else
		-- One is not active
		TriggerClientEvent('DeadBankRobbery:IsActive:Return', source, false)
	end
end)

RegisterNetEvent('DeadBankRobbery:SetActive')
AddEventHandler('DeadBankRobbery:SetActive', function(bool)
	robberyActive = bool
	if bool then
		Wait((1000 * 60 * config.robberyCooldown)) -- Wait 15 minutes
		robberyActive = false
	end
end)

RegisterNetEvent('Print:PrintDebug')
AddEventHandler('Print:PrintDebug', function(msg)
	print(msg)
	TriggerClientEvent('chatMessage', -1, "^7[^1Dead's Scripts^7] ^1DEBUG ^7" .. msg)
end)
RegisterNetEvent('PrintBR:PrintMessage')
AddEventHandler('PrintBR:PrintMessage', function(msg)
	TriggerClientEvent('chatMessage', -1, msg)
end)