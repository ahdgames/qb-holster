local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

wearingHolster = false
playerped = PlayerPedId()

if PlayerData.charinfo.gender == 0 then
    male = true
else
    male = false
end

RegisterNetEvent("qb-holster:client:updateHolster", function()
    if not wearingHolster then
        text = "Putting on Holster"
    else
        text = "Removing Holster"
    end

    QBCore.Functions.Progressbar('holster', text, Config.HolsterTime, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Play When Done

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

    end, function() -- Play When Cancel
        --Stuff goes here
    end)
end)