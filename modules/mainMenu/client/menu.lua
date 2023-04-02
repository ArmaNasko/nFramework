local cooldown = true

function MainMenu()
    local main = RageUI.CreateMenu(Config.name, "Que voulez-vous faire ?")
    local vehicle = RageUI.CreateSubMenu(main, "Véhicules", "Que voulez-vous faire ?")
    local weapons = RageUI.CreateSubMenu(main, "Armes", "Que voulez-vous faire ?")
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Button("Véhicules", nil, {}, true, {}, vehicle)

            RageUI.Button("Armes", nil, {}, true, {}, weapons)

        end)

        RageUI.IsVisible(vehicle, function()

            RageUI.Button("Chercher un véhicule", nil, {}, cooldown, {
                onSelected = function()
                    local car = nFramework.Input("Quel véhicule cherchez-vous ?", "", 30)
                    nFramework.SpawnCar(car, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z)
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
                    end
                })
            end

        end)

        RageUI.IsVisible(weapons, function()

            for k,v in pairs(Weapons) do
                RageUI.Button(v.label, nil, {}, true, {
                    onSelected = function()
                        GiveWeaponToPed(PlayerPedId(), v.hash, 20, true, true)
                    end
                })
            end

        end)

        if (not (RageUI.Visible(main))) and not RageUI.Visible(vehicle) and not RageUI.Visible(weapons) then
            main = RMenu:DeleteType(main, true)
            vehicle = RMenu:DeleteType(vehicle, true)
            weapons = RMenu:DeleteType(weapons, true)
        end
    end
end

RegisterCommand("+Main-Menu", function()
    MainMenu()
end)

RegisterKeyMapping("+Main-Menu", "Ouvrir le menu principale", "keyboard", "F5")