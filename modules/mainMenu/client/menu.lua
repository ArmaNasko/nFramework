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

        end)

        if (not (RageUI.Visible(main))) and not RageUI.Visible(vehicle) then
            main = RMenu:DeleteType(main, true)
            vehicle = RMenu:DeleteType(vehicle, true)
        end
    end
end