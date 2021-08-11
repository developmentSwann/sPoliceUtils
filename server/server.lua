ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterNetEvent('buy')
AddEventHandler('buy', function(cash)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx:showAdvancedNotification', source,'÷ LSPD', 'Armurerie','Voici ton nouvel équipement ! ~r~-'..cash..'$' , "char_greed", 1)
        xPlayer.removeMoney(cash) 
end)


ESX.RegisterServerCallback('swann_mask:verifsous', function(source, cb, prix)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= prix then
        cb(true)
    else
        cb(false)
    end
end)


RegisterNetEvent('defcon')
AddEventHandler('defcon', function(def)
    
    if not def then
        def= true
    else
        def = false
    end
    
   TriggerClientEvent('defconclient', -1, def)
    
end)


RegisterNetEvent('statedef')
AddEventHandler('statedef', function(state)
    
    if state == "OFF" then
        state = "ON"
    else
        state = "OFF"
    end
    TriggerClientEvent('stateclient', -1, state)
    
end)

RegisterNetEvent('access')
AddEventHandler('access', function(name, munt,max)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(name).count == max then 
        TriggerClientEvent('esx:showAdvancedNotification', source,'÷ LSPD', 'Armurerie','Tu en as déjà assez !' , "char_greed", 1)
    else
        xPlayer.addInventoryItem(name, munt)
        
   
    end
end)




RegisterNetEvent('ammu')
AddEventHandler('ammu', function(name, munt)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addWeapon(name, munt)
    
   
    
end)



