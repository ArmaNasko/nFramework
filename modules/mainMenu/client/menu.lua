local cooldown = true

function MainMenu()
    local main = RageUI.CreateMenu(Config.name, "Que voulez-vous faire ?")
    local vehicle = RageUI.CreateSubMenu(main, "Véhicules", "Que voulez-vous faire ?")
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Button("Véhicules", nil, {}, true, {}, vehicle)

        end)

        RageUI.IsVisible(vehicle, function()

            for k,v in pairs(CarsList.name) do
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

        if (not (RageUI.Visible(main))) and not RageUI.Visible(vehicle) then
            main = RMenu:DeleteType(main, true)
            vehicle = RMenu:DeleteType(vehicle, true)
        end
    end
end

RegisterCommand("menu", function()
    MainMenu()
end)