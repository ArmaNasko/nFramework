CreateThread(function()
    DoScreenFadeOut(5000)
    Wait(5000)
    SetMaxWantedLevel(0)
    while (not NetworkIsSessionStarted()) do Wait(0) end
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    local mod = GetHashKey("mp_m_freemode_01")
    RequestModel(mod)
    while not HasModelLoaded(mod) do Citizen.Wait(10) end
    SetPlayerModel(PlayerId(), mod)
    SetEntityCoords(PlayerPedId(), -77.53657, -2005.359, 18.01696, 78.521606445313)
    DoScreenFadeIn(1000)
    FreezeEntityPosition(PlayerPedId(), false)
    NetworkConcealPlayer(NetworkGetPlayerIndexFromPed(PlayerPedId()), false, 1)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetEntityVisible(PlayerPedId(), true)
    MainMenu()
end)