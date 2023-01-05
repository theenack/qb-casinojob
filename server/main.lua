local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("qb-casinojob:bill:player")
AddEventHandler("qb-casinojob:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'casino' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientmargarita', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local tequila = Ply.Functions.GetItemByName("tequila")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    local fruit = Ply.Functions.GetItemByName("fruit-mix")
    if tequila ~= nil and syrup ~= nil and fruit ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientOldFashioned', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    local bitter = Ply.Functions.GetItemByName("v-bitter")
    if whiskey ~= nil and syrup ~= nil and bitter ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientManhattan', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    if whiskey ~= nil and syrup ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientEspressoMartini', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local coffee = Ply.Functions.GetItemByName("coffee")
    local vodka = Ply.Functions.GetItemByName("vodka")
    if coffee ~= nil and vodka ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientSparkles', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local vodka = Ply.Functions.GetItemByName("vodka")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    local fruit = Ply.Functions.GetItemByName("fruit-mix")
    if vodka ~= nil and syrup ~= nil and fruit ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientUnicorn', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    local fruit = Ply.Functions.GetItemByName("fruit-mix")
    if whiskey ~= nil and syrup ~= nil and fruit ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientDancerz', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local beer = Ply.Functions.GetItemByName("beer")
    local vodka = Ply.Functions.GetItemByName("vodka")
    local bitter = Ply.Functions.GetItemByName("v-bitter")
    if beer ~= nil and vodka ~= nil and bitter ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientHulk', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local whiskey = Ply.Functions.GetItemByName("whiskey")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    local vodka = Ply.Functions.GetItemByName("vodka")
    if whiskey ~= nil and syrup ~= nil and vodka ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-casinojob:server:get:ingredientClass', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fruit = Ply.Functions.GetItemByName("fruit-mix")
    local syrup = Ply.Functions.GetItemByName("v-sugar-syrup")
    local coffee = Ply.Functions.GetItemByName("coffee")
    if fruit ~= nil and syrup ~= nil and coffee ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

----/////NEW INVENTORY EXPORTS/////////-----------

RegisterNetEvent('qb-casinojob:server:shotpack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('v-shots-pack', 1)
    Player.Functions.AddItem('shot-absinthe', Config.ShotsAmount)
    Player.Functions.AddItem('shot-snakebite', Config.ShotsAmount)
    Player.Functions.AddItem('shot-redsnapper', Config.ShotsAmount)
    Player.Functions.AddItem('shot-fireball', Config.ShotsAmount)
end)

RegisterNetEvent('qb-casinojob:server:vodkacrate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('vodkacrate', 1)
    Player.Functions.AddItem('vodka', Config.VodkaAmount)
end)

RegisterNetEvent('qb-casinojob:server:whiskeybox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('whiskey-box', 1)
    Player.Functions.AddItem('whiskey', Config.WhiskeyAmount)
end)

RegisterNetEvent('qb-casinojob:server:tequilacrate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('tequila-crate', 1)
    Player.Functions.AddItem('tequila', Config.TequilaAmount)
end)

RegisterNetEvent('qb-casinojob:server:beerbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('beer-crate', 1)
    Player.Functions.AddItem('beer', Config.BeerAmount)
end)

RegisterNetEvent('qb-casinojob:server:fruitbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('fruit-box', 1)
    Player.Functions.AddItem('fruit-mix', Config.FruitAmount)
end)

RegisterNetEvent('qb-casinojob:server:espresso', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('coffee', 1)
    Player.Functions.RemoveItem('vodka', 1)
    Player.Functions.AddItem('v-espressomartini', 1)
end)

RegisterNetEvent('qb-casinojob:server:margaritatata', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('tequila', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.RemoveItem('fruit-mix', 1)
    Player.Functions.AddItem('v-margarita', 1)
end)

RegisterNetEvent('qb-casinojob:server:manhattan', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('whiskey', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.AddItem('v-manhattan', 1)
end)

RegisterNetEvent('qb-casinojob:server:oldfash', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('whiskey', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.RemoveItem('v-bitter', 1)
    Player.Functions.AddItem('v-oldfashioned', 1)
end)

RegisterNetEvent('qb-casinojob:server:sparkle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('vodka', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.RemoveItem('fruit-mix', 1)
    Player.Functions.AddItem('v-sparkles', 1)
end)

RegisterNetEvent('qb-casinojob:server:unicorndrink', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('whiskey', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.RemoveItem('fruit-mix', 1)
    Player.Functions.AddItem('v-unicorn', 1)
end)

RegisterNetEvent('qb-casinojob:server:dancerzz', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('beer', 1)
    Player.Functions.RemoveItem('vodka', 1)
    Player.Functions.RemoveItem('v-bitter', 1)
    Player.Functions.AddItem('v-dancerz', 1)
end)

RegisterNetEvent('qb-casinojob:server:hulkmake', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('whiskey', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.RemoveItem('vodka', 1)
    Player.Functions.AddItem('v-hulk', 1)
end)

RegisterNetEvent('qb-casinojob:server:unicorndrink', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('fruit-mix', 1)
    Player.Functions.RemoveItem('v-sugar-syrup', 1)
    Player.Functions.RemoveItem('coffee', 1)
    Player.Functions.AddItem('v-class', 1)
end)

QBCore.Functions.CreateUseableItem("v-shots-pack", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-casinojob:v-shots-pack", source, item.name)
end)

QBCore.Functions.CreateUseableItem("vodka-crate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-casinojob:vodka-crate", source, item.name)
end)

QBCore.Functions.CreateUseableItem("whiskey-box", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-casinojob:whiskey-box", source, item.name)
end)

QBCore.Functions.CreateUseableItem("beer-crate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-casinojob:beer-crate", source, item.name)
end)

QBCore.Functions.CreateUseableItem("fruit-box", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-casinojob:fruit-box", source, item.name)
end)

QBCore.Functions.CreateUseableItem("tequila-crate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-casinojob:tequila-crate", source, item.name)
end)
