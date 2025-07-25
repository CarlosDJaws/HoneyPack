-- ------------------------------------------------------------------
-- client.lua
-- Handles all the client-side effects when the item is used.
-- ------------------------------------------------------------------

local isEffectActive = false

-- This function contains all the visual and sound effects
local function StartHoneyPackEffect()
    if isEffectActive then return end
    isEffectActive = true

    -- 1. Show image and play music via NUI
    SendNUIMessage({
        type = "show",
        image = Config.ItemImage,
        sound = Config.MusicFile,
        volume = Config.MusicVolume
    })

    -- 2. Apply visual screen effects
    StartScreenEffect("DrugsDrivingIn", Config.EffectDuration, false)
    StartScreenEffect("DrugsMichaelAliensFightIn", Config.EffectDuration, false)
    AnimpostfxPlay("ChopVision", Config.EffectDuration, false)

    -- 3. Loop with changing colors and camera shakes
    local startTime = GetGameTimer()
    Citizen.CreateThread(function()
        while GetGameTimer() - startTime < Config.EffectDuration do
            -- Randomly shake the camera for a disorienting effect
            if math.random(1, 100) > 95 then
                ShakeGameplayCam("DRUNK_SHAKE", 1.0)
            end

            -- Change timecycle modifiers for vibrant, shifting colors
            SetTimecycleModifier("drug_drive_blend01")

            Wait(500) -- Wait half a second before the next change
        end

        -- 4. Clean up after the effect is over
        isEffectActive = false
        StopScreenEffect("DrugsDrivingIn")
        StopScreenEffect("DrugsMichaelAliensFightIn")
        AnimpostfxStop("ChopVision")
        ClearTimecycleModifier()
        -- Stop the music
        SendNUIMessage({ type = 'stopSound' })
    end)
end

-- This is how you would trigger the effect using an inventory item.
-- You need to integrate this with your specific inventory system (ESX, QBCore, etc.).
RegisterNetEvent('your_inventory:useItem', function(item)
    if item.name == Config.ItemName then
        StartHoneyPackEffect()
    end
end)

-- For testing purposes, you can use a command to trigger the effect.
RegisterCommand('testhoneypack', function()
    StartHoneyPackEffect()
    print("Honey Pack effect started for testing.")
end, false)
