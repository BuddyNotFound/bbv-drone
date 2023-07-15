local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('drone', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent('bbv-drone:openmenu', src)
    end
end)