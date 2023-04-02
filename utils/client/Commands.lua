RegisterCommand("die", function()
    SetEntityHealth(PlayerPedId(), 0)
end)

RegisterCommand("pos", function()
    print("X "..GetEntityCoords(PlayerPedId()).x, "Y "..GetEntityCoords(PlayerPedId()).y, "Z "..GetEntityCoords(PlayerPedId()).z, "Heading "..GetEntityHeading(PlayerPedId()))
end)