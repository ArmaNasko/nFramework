Zones = {}

builder = setmetatable({}, builder)


function builder:AddZone(text, vector, radius, cb)
    local zone = {
        text = text,
        vector = vector,
        radius = radius,
        cb = cb
    }
    table.insert(Zones, zone)
end

function builder:Handle(cb)
    if type(cb) == "function" then 
        cb()
    end
end

function builder:Wait()
    for _, zone in pairs(Zones) do 
        if self:Check(zone.vector, 10) then
            return Wait(0)
        end
    end
    return Wait(1000)
end

function builder:ShowFloading(text, coords)
    AddTextEntry('FloatingHelpNotification',text)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('FloatingHelpNotification')
    EndTextCommandDisplayHelp(2, false, false, -1)
end


function builder:DrawZone(zone)
    local x, y, z = table.unpack(zone.vector)
    local radius = zone.radius
    local text = zone.text                                                --R G     B    
    DrawMarker(25, x, y, z-0.98, 0, 0, 0, 0, 0, 0, radius, radius, radius, 0, 255, 188, 255, 0, 0, 0, 0)
end

function builder:IsControlJustPressed()
    if IsControlJustPressed(0, 51) then 
        return true 
    end 
    return false
end

function builder:Check(coords, radius)
    if #(GetEntityCoords(PlayerPedId()) - coords) < radius then 
        return true 
    end 
    return false
end

function builder:Visuel()
    for _, zone in pairs(Zones) do 
        if self:Check(zone.vector, 10) then
            self:DrawZone(zone)
            
            if self:Check(zone.vector, 1.5) then
                self:ShowFloading(zone.text, zone.vector)
                if self:IsControlJustPressed() then
                    self:Handle(zone.cb)
                end
            end
        end
    end
end

-- Zone Builder by Gunware (son discord : https://discord.gg/JhJCzUZYjY)
Citizen.CreateThread(function()
    builder:AddZone("~INPUT_PICKUP~ Pour ouvrir le menu principal", vector3(-77.53657, -2005.359, 18.01696), 0.8, function()
        MainMenu()
    end)
    while true do
        builder:Wait()
        builder:Visuel()
    end
end)