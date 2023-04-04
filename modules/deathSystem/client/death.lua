local respawnTimer = 0
local respawnTime = Config.respawnTime * 1000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityDead(PlayerPedId()) then
            if respawnTimer == 0 then
                respawnTimer = GetGameTimer() + respawnTime
            else
                local remainingTime = math.ceil((respawnTimer - GetGameTimer()) / 1000)
                if Config.respawnText == "DrawText" then
                    nFramework.DrawText('Vous êtes mort, vous allez réapparaître dans ~b~' .. remainingTime .. '~s~ secondes', 0.5, 0.9)
                elseif Config.respawnText == "ProgressBar" then
                    nFramework.ProgressBar(300, "Réapparition en cours ..", "#FF0000")
                    nFramework.StopProgressBar()
                end
                if remainingTime <= 0 then
                    nFramework.Revive()
                    respawnTimer = 0
                end
            end
        end
    end
end)