ESX = nil

local cachedBins = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)



Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 1000

        local entity, entityDst = ESX.Game.GetClosestObject(Config.BinsAvailable)

        if DoesEntityExist(entity) and entityDst <= 1.5 then
            sleepThread = 5

            local binCoords = GetEntityCoords(entity)

            ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "Tuşları Kurcala[~g~E~s~]. ", 0.4)

            if IsControlJustReleased(0, 38) then
                if not cachedBins[entity] then
                    cachedBins[entity] = true

                    OpenTrashCan()
                else
                    ESX.ShowNotification("Burada Bozukluk Kalmamış !")
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_ATM", 0, true)

    Citizen.Wait(10000)

    TriggerServerEvent("dorq-coin:retrievecoin")

    ClearPedTasks(PlayerPedId())
end
