local button = 166 -- (F5) You can change it by going to this link (https://docs.fivem.net/docs/game-references/controls/)
local commandEnabled = false -- If you set the 'False' to 'True' then /enginetoggle will toggle your engine.



-- Please don't touch this script below.

Citizen.CreateThread(function()
    if commandEnabled then
        RegisterCommand('enginetoggle', function() 
            toggleEngine()
        end, false)
    end
    while true do
        Citizen.Wait(0)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        
        if (IsControlJustReleased(0, button) or IsDisabledControlJustReleased(0, button)) and vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
            toggleEngine()
        end
        
    end
end)

function toggleEngine()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end
