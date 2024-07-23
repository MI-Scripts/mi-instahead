ESX = exports['es_extended']:getSharedObject()

local function checkHeadshot(ped, hitBone)
    return hitBone == 31086 -- Head bone ID
end

CreateThread(function()
    while true do
        Wait(100)
        local playerPed = PlayerPedId()

        if HasEntityBeenDamagedByAnyObject(playerPed) or HasEntityBeenDamagedByAnyPed(playerPed) then
            local hit, bone = GetPedLastDamageBone(playerPed)
            if hit and checkHeadshot(playerPed, bone) then
                SetEntityHealth(playerPed, 0) 
            end

            ClearEntityLastDamageEntity(playerPed)
        end
    end
end)
