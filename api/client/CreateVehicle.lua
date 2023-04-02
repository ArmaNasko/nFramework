function nFramework.SpawnCar(model, x, y, z, heading)
    RequestModel(GetHashKey(model))
    while not HasModelLoaded(GetHashKey(model)) do 
        Wait(1) 
    end
    local vehicle = CreateVehicle(model, x, y, z, heading, true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
end