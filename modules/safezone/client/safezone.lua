function isInSafezone(playerPos)
    local distance = GetDistanceBetweenCoords(playerPos, Config.safezoneCenter.x, Config.safezoneCenter.y, Config.safezoneCenter.z, true)
    return distance <= Config.safezoneRadius
end

CreateThread(function()
    while true do
        Wait(1000)
        local playerPed = PlayerPedId()
        if DoesEntityExist(playerPed) then
            local playerPos = GetEntityCoords(playerPed)
            if isInSafezone(playerPos) then
                SetPlayerInvincible(PlayerId(), true)
            else
                SetPlayerInvincible(PlayerId(), false)
            end
        end
    end
end)