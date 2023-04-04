local cooldown = true
local time = 1
local weather = 1

function MainMenu()
    local main = RageUI.CreateMenu(Config.name, "Que voulez-vous faire ?")
    local vehicle = RageUI.CreateSubMenu(main, "Véhicules", "Que voulez-vous faire ?")
    local weapons = RageUI.CreateSubMenu(main, "Armes", "Que voulez-vous faire ?")
    local meteo = RageUI.CreateSubMenu(main, "Météo", "Que voulez-vous faire ?")
    --main.Closable = false
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Button("Véhicules", nil, {}, true, {}, vehicle)

            RageUI.Button("Armes", nil, {}, true, {}, weapons)

            RageUI.Button("Météo", nil, {}, true, {}, meteo)

        end)

        RageUI.IsVisible(vehicle, function()

            RageUI.Button("Chercher un véhicule", nil, {}, cooldown, {
                onSelected = function()
                    local car = nFramework.Input("Quel véhicule cherchez-vous ?", "", 30)
                    nFramework.SpawnCar(car, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)
                    cooldown = false
                    Wait(7000)
                    cooldown = true
                    RageUI.CloseAll()
                end
            })

            RageUI.Line()

            for k,v in pairs(Cars.name) do
                RageUI.Button(v, nil, {}, cooldown, {
                    onSelected = function()
                        nFramework.SpawnCar(v, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)
                        cooldown = false
                        Wait(7000)
                        cooldown = true
                        RageUI.CloseAll()
                    end
                })
            end

        end)

        RageUI.IsVisible(weapons, function()

            for k,v in pairs(Weapons) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        GiveWeaponToPed(PlayerPedId(), v.hash, 20, true, true)
                        RageUI.CloseAll()
                    end
                })
            end

        end)

        RageUI.IsVisible(meteo, function()

            RageUI.Separator("Uniquement pour vous !")

            RageUI.Line()

            RageUI.Separator("↓ Heures ↓")

            RageUI.List("Heures ",{"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"}, time, nil, {}, true, {
                onListChange = function(Index)
                    time = Index
                end,
                onSelected = function(Index)
                    if Index == 1 then
                        NetworkOverrideClockTime(00, 00, 0)
                    elseif Index == 2 then
                        NetworkOverrideClockTime(01, 00, 0)
                    elseif Index == 3 then
                        NetworkOverrideClockTime(03, 00, 0)
                    elseif Index == 4 then
                        NetworkOverrideClockTime(04, 00, 0)
                    elseif Index == 5 then
                        NetworkOverrideClockTime(05, 00, 0)
                    elseif Index == 6 then
                        NetworkOverrideClockTime(06, 00, 0)
                    elseif Index == 7 then
                        NetworkOverrideClockTime(07, 00, 0)
                    elseif Index == 8 then
                        NetworkOverrideClockTime(08, 00, 0)
                    elseif Index == 9 then
                        NetworkOverrideClockTime(09, 00, 0)
                    elseif Index == 10 then
                        NetworkOverrideClockTime(10, 00, 0)
                    elseif Index == 11 then
                        NetworkOverrideClockTime(11, 00, 0)
                    elseif Index == 12 then
                        NetworkOverrideClockTime(12, 00, 0)
                    elseif Index == 13 then
                        NetworkOverrideClockTime(13, 00, 0)
                    elseif Index == 14 then
                        NetworkOverrideClockTime(14, 00, 0)
                    elseif Index == 15 then
                        NetworkOverrideClockTime(15, 00, 0)
                    elseif Index == 16 then
                        NetworkOverrideClockTime(16, 00, 0)
                    elseif Index == 17 then
                        NetworkOverrideClockTime(17, 00, 0)
                    elseif Index == 18 then
                        NetworkOverrideClockTime(18, 00, 0)
                    elseif Index == 19 then
                        NetworkOverrideClockTime(19, 00, 0)
                    elseif Index == 20 then
                        NetworkOverrideClockTime(20, 00, 0)
                    elseif Index == 21 then
                        NetworkOverrideClockTime(21, 00, 0)
                    elseif Index == 22 then
                        NetworkOverrideClockTime(22, 00, 0)
                    elseif Index == 23 then
                        NetworkOverrideClockTime(23, 00, 0)
                    end
                end
            })

            RageUI.Separator("↓ Météo ↓")

            RageUI.List("Météo",{"Normal", "Soleil", "Pluit", "Brouillard", "Tonnerre", "Noël", "Halloween"}, weather, nil, {}, true, {
                onListChange = function(Index)
                    weather = Index
                end,
                onSelected = function(Index)
                    if Index == 1 then
                        local weather = "Clear"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)
                    elseif Index == 2 then
                        local weather = "EXTRASUNNY"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)
                    elseif Index == 3 then
                        local weather = "Rain"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)
                    elseif Index == 4 then
                        local weather = "Snowlight"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)
                    elseif Index == 5 then 
                        local weather = "Thunder"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)
                    elseif Index == 6 then
                        local weather = "Xmas"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)    
                    elseif Index == 7 then 
                        local weather = "Halloween"
                        SetWeatherTypeOverTime(weather, 15.0)
                        ClearOverrideWeather()
                        ClearWeatherTypePersist()
                        SetWeatherTypePersist(weather)
                        SetWeatherTypeNow(weather)
                        SetWeatherTypeNowPersist(weather)
                    end
                end
            })
        end)

        if (not (RageUI.Visible(main))) and not RageUI.Visible(vehicle) and not RageUI.Visible(weapons) and not RageUI.Visible(meteo) then
            main = RMenu:DeleteType(main, true)
            vehicle = RMenu:DeleteType(vehicle, true)
            weapons = RMenu:DeleteType(weapons, true)
            meteo = RMenu:DeleteType(meteo, true)
        end
    end
end

-- RegisterCommand("+Main-Menu", function()
--     MainMenu()
-- end)

-- RegisterKeyMapping("+Main-Menu", "Ouvrir le menu principale", "keyboard", "F5")