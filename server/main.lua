local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("dorq-coin:phonebox")
AddEventHandler("dorq-coin:phonebox", function()
    local player = ESX.GetPlayerFromId(source)

    local currentCoin = player.getInventoryItem("cash")["count"]

end)

RegisterServerEvent("dorq-coin:retrievecoin")
AddEventHandler("dorq-coin:retrievecoin", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 69)
    local randomcoin = math.random((Config.coinphone[1] or 1), (Config.coinphone[10] or 10))

    if luck >= 0 and luck <= 29 then
        TriggerClientEvent("esx:showNotification", source, "Burada Kalan Bozukluk Yok.")
    else
        player.addInventoryItem("cash", randomcoin)
        TriggerClientEvent("esx:showNotification", source, ("Sen x%s tane bozukluk buldun."):format(randomcoin))
    end
end)
