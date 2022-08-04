local QBCore = exports['qb-core']:GetCoreObject()

wearingHolster = false
playerped = PlayerPedId()

if IsPedMale then
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
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Play When Done

        if not wearingHolster then
            wearingHolster = true
            TriggerEvent('weapons:ResetHolster')
            if male then
                SetPedComponentVariation(playerped, 7, Config.MaleWearingNumber, 0, 2)
            else
                SetPedComponentVariation(playerped, 7, Config.FemaleWearingNumber, 0, 2)
            end
        else
            wearingHolster = false
            TriggerEvent('weapons:ResetHolster')
            if male then
                SetPedComponentVariation(playerped, 7, Config.MaleRemovedNumber, 0, 2)
            else
                SetPedComponentVariation(playerped, 7, Config.FemaleRemovedNumber, 0, 2)
            end
        end

    end, function() -- Play When Cancel
        --Stuff goes here
    end)
end)