AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("[^2INFO^0] ^5nFramework^0 ^2as been loaded^0")
end)