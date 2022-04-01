draw.Color(255, 255, 255, 255)
local font = draw.CreateFont("Verdana", 16, 800)

client.ChatPrintf("\x05[\x04Module.lua\x05] \x01Loaded")

local function mydraw()
    local middleScreenX, middleScreenY = draw.GetScreenSize()
    draw.SetFont(font)
    local textW, textH = draw.GetTextSize("Modules")

    if engine.Con_IsVisible() or engine.IsGameUIVisible() then
        return
    end

    -- get aimbot, aimbot method, dt values using gui
    local aimbot = gui.GetValue("aim bot")
    local aimbotMethod = gui.GetValue("aim method")
    local dt = gui.GetValue("double tap")

    if dt == 1 then dt = "on" else dt = "off" end
    if aimbot == 1 then aimbot = "on" else aimbot = "off" end

    -- draw a box around the text
    draw.Color(255, 255, 255, 25)
    draw.FilledRect((middleScreenX/5)*3.25 - 40, (middleScreenY/5)*2 - 25, (middleScreenX/5)*3.25 + textW + 50, (middleScreenY/5)*2 + textH + 150)

    local boxLeftOffset = (middleScreenX/5)*3.25 - 40
    local boxRightOffset = (middleScreenX/5)*3.25 + textW + 50
    local boxInBetween = (boxRightOffset - boxLeftOffset) / 2

    -- draw different text inside the box
    draw.Color(255, 255, 255, 255)
    draw.Text((middleScreenX/5)*3.25 + 10, (middleScreenY/5)*2, "Modules")

    draw.Text(boxInBetween + boxLeftOffset - math.floor(draw.GetTextSize("DT: " .. tostring(dt))/2),      (middleScreenY/5)*2 + textH + 10, "DT: " .. dt)
    draw.Text(boxInBetween + boxLeftOffset - math.floor(draw.GetTextSize("Aim: " .. tostring(aimbot))/2), (middleScreenY/5)*2 + textH + 30, "Aim: " .. aimbot)
    draw.Text(boxInBetween + boxLeftOffset - math.floor(draw.GetTextSize("Aim method: ")/2),              (middleScreenY/5)*2 + textH + 50, "Aim method: ")
    draw.Text(boxInBetween + boxLeftOffset - math.floor(draw.GetTextSize(tostring(aimbotMethod))/2),      (middleScreenY/5)*2 + textH + 70, aimbotMethod)

    


end

callbacks.Unregister("Draw", "mydraw")
callbacks.Register("Draw", "mydraw", mydraw)