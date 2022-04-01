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
    local aa = gui.GetValue("anti aim")

    if dt == 1 then dt = "on" else dt = "off" end
    if aimbot == 1 then aimbot = "on" else aimbot = "off" end
    if aa == 1 then aa = "on" else aa = "off" end

    -- draw a box around the text
    draw.Color(24, 9, 14, 75)
    draw.FilledRect((middleScreenX/5)*3.25 - 40, (middleScreenY/5)*2 - 5, (middleScreenX/5)*3.25 + textW + 50, (middleScreenY/5)*2 + textH + 5)
    draw.Color(94, 61, 77, 255)
    draw.Line((middleScreenX/5)*3.25 - 40, (middleScreenY/5)*2 - 5, (middleScreenX/5)*3.25 + textW + 50, (middleScreenY/5)*2 - 5)
    draw.Color(255, 255, 255, 255)

    local boxLeftOffset = (middleScreenX/5)*3.25 - 40
    local boxRightOffset = (middleScreenX/5)*3.25 + textW + 50
    local boxInBetween = (boxRightOffset - boxLeftOffset) / 2

    -- draw different text inside the box
    draw.Color(255, 255, 255, 255)
    draw.Text((middleScreenX/5)*3.25 + 10, (middleScreenY/5)*2, "Modules")

    draw.Text(10 + boxLeftOffset, (middleScreenY/5)*2 + textH + 10, "DT: ")
    draw.Text(10 + boxLeftOffset, (middleScreenY/5)*2 + textH + 30, "Aim: ")
    draw.Text(10 + boxLeftOffset, (middleScreenY/5)*2 + textH + 50, "AA: ")
    draw.Text(10 + boxLeftOffset, (middleScreenY/5)*2 + textH + 70, "Aim method: ")
    draw.Text(10 + boxLeftOffset, (middleScreenY/5)*2 + textH + 90, aimbotMethod)
    draw.Text(boxRightOffset - 40, (middleScreenY/5)*2 + textH + 10, "[ " .. dt .. " ]")
    draw.Text(boxRightOffset - 40, (middleScreenY/5)*2 + textH + 30, "[ " .. aimbot .. " ]")
    draw.Text(boxRightOffset - 40, (middleScreenY/5)*2 + textH + 50, "[ " .. aa .. " ]")

end

callbacks.Unregister("Draw", "mydraw")
callbacks.Register("Draw", "mydraw", mydraw)
