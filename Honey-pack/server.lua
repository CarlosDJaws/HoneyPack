-- ------------------------------------------------------------------
-- server.lua
-- Handles item registration for the ESX framework.
-- ------------------------------------------------------------------

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- ==================================================================
-- ESX FRAMEWORK - ITEM REGISTRATION
-- ==================================================================
-- Make sure you add this item to your database in the 'items' table.
-- SQL query to add the item (the name should match Config.ItemName):
-- INSERT INTO `items` (`name`, `label`, `weight`) VALUES
-- ('honeypack', 'Honey Pack', 1);

ESX.RegisterUsableItem(Config.ItemName, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    -- Remove one item from the player's inventory
    xPlayer.removeInventoryItem(Config.ItemName, 1)
    
    -- Trigger the effect on the client
    TriggerClientEvent('your_inventory:useItem', source, { name = Config.ItemName })
end)


-- ==================================================================
-- COMMAND TO GIVE THE ITEM (FOR ADMINS/TESTING)
-- This command is configured for ESX.
-- ==================================================================
RegisterCommand('givehoneypack', function(source, args, rawCommand)
    if source == 0 then -- Check if command is run from server console
        local targetPlayer = tonumber(args[1])
        if targetPlayer then
            local xPlayer = ESX.GetPlayerFromId(targetPlayer)
            if xPlayer then
                xPlayer.addInventoryItem(Config.ItemName, 1)
                print('Gave 1 Honey Pack to player ' .. targetPlayer)
            end
        end
    else -- Command is run from in-game chat
        local xPlayer = ESX.GetPlayerFromId(source)
        -- You can change 'admin' to any group you want (e.g., 'superadmin', 'mod')
        if xPlayer.getGroup() == 'admin' then -- Check for admin permissions
            local targetPlayer = tonumber(args[1])
            if targetPlayer then
                local targetXPlayer = ESX.GetPlayerFromId(targetPlayer)
                if targetXPlayer then
                    targetXPlayer.addInventoryItem(Config.ItemName, 1)
                    TriggerClientEvent('chat:addMessage', source, {
                        args = {'SYSTEM', 'You gave a Honey Pack to player ' .. targetPlayer}
                    })
                end
            else
                xPlayer.addInventoryItem(Config.ItemName, 1)
                TriggerClientEvent('chat:addMessage', source, {
                    args = {'SYSTEM', 'You received a Honey Pack.'}
                })
            end
        end
    end
end, true) -- true makes this a restricted command
