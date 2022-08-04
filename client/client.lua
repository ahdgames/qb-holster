local QBCore = exports['qb-core']:GetCoreObject()

wearingHolster = false
playerped = PlayerPedId()

RegisterNetEvent("qb-holster:client:updateHolster", function()
    if not wearingHolster then
        text = "Putting on Holster"
    else
        text = "Removing Holster"
    end

    QBCore.Functions.Progressbar('holster', text, Config.DrawTime, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = false,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Play When Done

        if not wearingHolster then
            wearingHolster = true
            TriggerEvent('weapons:ResetHolster')
            SetPedComponentVariation(playerped, 7, Config.WearingNumber, 0, 2)
        else
            wearingHolster = false
            TriggerEvent('weapons:ResetHolster')
            SetPedComponentVariation(playerped, 7, Config.RemovedNumber, 0, 2)
        end

    end, function() -- Play When Cancel
        --Stuff goes here
    end)
end)