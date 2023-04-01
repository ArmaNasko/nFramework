function MainMenu()
    local main = RageUI.CreateMenu(nFramework.name, "Que voulez-vous faire ?")
    local cars = RageUI.CreateSubMenu(main, "Véhicules", "Que voulez-vous faire ?")
    RageUI.Visible(main, not RageUI.Visible(main))
    while main do
        Wait(0)
        RageUI.IsVisible(main, function()

            RageUI.Button("Véhicules", nil, {}, true, {}, cars)

        end)

        RageUI.IsVisible(cars, function()
        end)

        if (not (RageUI.Visible(main))) and not RageUI.Visible(cars) then
            main = RMenu:DeleteType(main, true)
            cars = RMenu:DeleteType(cars, true)
        end
    end
end