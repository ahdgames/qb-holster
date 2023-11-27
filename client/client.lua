local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}



local wearingHolster = false
-- local playerped = PlayerPedId()




AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)


AddEventHandler('OnResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    PlayerData = QBCore.Functions.GetPlayerData()
end)

-- if gender == 0 then
--     male = true
-- else
--     male = false
-- end


local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function equipHolsterAnimation()
    loadAnimDict('clothingshirt')
    TaskPlayAnim(PlayerPedId(), 'clothingshirt', 'try_shirt_positive_d', 8.0, 1.0, -1, 49, 0, false, false, false)
end



function toggle()
    local playerped = PlayerPedId()
    local gender = QBCore.Functions.GetPlayerData().charinfo.gender
    if gender == 0 then
        male = true
        print(gender)
    else
        male = false
        print(gender)
    end
    if not wearingHolster then
        wearingHolster = true
        TriggerEvent('weapons:ResetHolster')
        if male == true then
            SetPedComponentVariation(playerped, Config.MaleCategory, Config.MaleWearingNumber, 0, 0)
        else
            SetPedComponentVariation(playerped, Config.FemaleCategory, Config.FemaleWearingNumber, 0, 2)
        end
    else
        wearingHolster = false
        TriggerEvent('weapons:ResetHolster')
        if male == true then
            SetPedComponentVariation(playerped, Config.MaleCategory, Config.MaleRemovedNumber, 0, 0)
        else
            SetPedComponentVariation(playerped, Config.FemaleCategory, Config.FemaleRemovedNumber, 0, 2)
        end
    end
end

RegisterNetEvent("qb-holster:client:updateHolster", function()
    local playerped = PlayerPedId()
    if not wearingHolster then
        text = "Putting on Holster"
    else
        text = "Removing Holster"
    end
    if Config.UsingPsProgressBar then
        QBCore.Functions.Progressbar('holster', text, Config.HolsterTime, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    },{}, {}, {}, function() -- Play When Done
           equipHolsterAnimation()
           Wait(2000)
           toggle()
           Wait(1000)
           TaskPlayAnim(playerped, 'clothingshirt', 'exit', 8.0, 1.0, -1, 49, 0, false, false, false)
         end, function() -- Play When Cancel
            --Stuff goes here
        end)
    else
        Citizen.Wait(Config.HolsterTime)
        toggle()
    end
end)
