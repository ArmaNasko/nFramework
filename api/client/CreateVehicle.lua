function nFramework.SpawnCar(model, x, y, z, heading)
    if model and IsModelValid(model) and IsModelAVehicle(model) then
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do 
            Wait(1) 
        end
        nFramework.Notification("~r~Model du véhicule invalide !~s~")
        local vehicle = CreateVehicle(model, x, y, z, heading, true, false)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    else
        nFramework.Notification("~r~Model du véhicule invalide !~s~")
    end
end