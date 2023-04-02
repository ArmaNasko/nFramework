function nFramework.ProgressBar(time, text, color)
    SendNUIMessage({
        action = 'run',
        time = time,
        text = text,
        color = color or usedColor,
    })
end

function nFramework.StopProgressBar()
    SendNUIMessage({
        action = 'stop',
    })
end