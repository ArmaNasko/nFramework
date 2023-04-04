function Heal()
    if IsEntityDead(PlayerPedId()) then
        nFramework.Notification("~r~Vous êtes mort !~s~")
    else
        if GetEntityHealth(PlayerPedId()) <= 140 then
            FreezeEntityPosition(PlayerPedId(), true)
            nFramework.ProgressBar(7, "Régénération en cours ..", "#FF0000")
            Wait(7000)
            SetEntityHealth(PlayerPedId(), 200)
            FreezeEntityPosition(PlayerPedId(), false)
            nFramework.Notification("~g~Vous vous êtes bien soigné !~s~")
        else
            nFramework.Notification("~r~Vous avez déjà plus de 50% de vie !~s~")
        end
    end
end

RegisterCommand("+healt", function()
    Heal()
end)

RegisterKeyMapping("+healt", "Se régénérer", "keyboard", "G")