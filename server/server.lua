local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("holster", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("qb-holster:client:updateHolster", src)
    end
end)