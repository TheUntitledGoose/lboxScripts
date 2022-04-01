local font = draw.CreateFont( "Verdana", 16, 800 )

client.ChatPrintf( "\x05[\x04Module.lua\x05] \x01Loaded" )

local ui_state = function( ... )
    local ref_status = {}
    for i, v in ipairs( { ... } ) do
        v = (v == 1) and "on" or "off"
        ref_status[i] = v
    end
    return table.unpack( ref_status )
end

local draw_text_continious = function( ... )
    local va_args = { ... }
    for i, v in ipairs( { ... } ) do
        printLuaTable( table.unpack( v ) )
        -- draw.Text(x, y, text)
    end
end

local function mydraw()
    if engine.Con_IsVisible() or engine.IsGameUIVisible() then
        return
    end

    local middleScreenX, middleScreenY = draw.GetScreenSize()

    -- get aimbot, aimbot method, dt values using gui
    local aimbot = gui.GetValue( "aim bot" )
    local aimbotMethod = gui.GetValue( "aim method" )
    local dt = gui.GetValue( "double tap" )
    local aa = gui.GetValue( "anti aim" )

    dt, aimbot, aa = ui_state( dt, aimbot, aa )

    draw.SetFont( font )

    -- position logic
    local textW, textH = draw.GetTextSize( "Modules" )
    local posX, posY = (middleScreenX / 5) * 3.25, (middleScreenY / 5) * 2 -- read the documentation : X and Y must be integer!
    local boxLeftOffset = posX - 40
    local boxRightOffset = posX + textW + 50
    local boxInBetween = (boxRightOffset - boxLeftOffset) / 2

    -- draw a box around the text
    draw.Color( 24, 9, 14, 75 )
    draw.FilledRect( posX - 40, posY - 5, posX + textW + 50, posY + textH + 5 )
    draw.Color( 94, 61, 77, 255 )
    draw.Line( posX - 40, posY - 5, posX + textW + 50, posY - 5 )
    draw.Color( 255, 255, 255, 255 )

    -- draw different text inside the box
    draw.Color( 255, 255, 255, 255 )
    draw.Text( posX + 10, posY, "Modules" )

    draw.Text( 10 + boxLeftOffset, posY + textH + 10, "DT: " )
    draw.Text( 10 + boxLeftOffset, posY + textH + 30, "Aim: " )
    draw.Text( 10 + boxLeftOffset, posY + textH + 50, "AA: " )
    draw.Text( 10 + boxLeftOffset, posY + textH + 70, "Aim method: " )
    draw.Text( 10 + boxLeftOffset, posY + textH + 90, aimbotMethod )
    draw.Text( boxRightOffset - 40, posY + textH + 10, "[ " .. dt .. " ]" )
    draw.Text( boxRightOffset - 40, posY + textH + 30, "[ " .. aimbot .. " ]" )
    draw.Text( boxRightOffset - 40, posY + textH + 50, "[ " .. aa .. " ]" )

end

callbacks.Unregister( "Draw", "mydraw" )
callbacks.Register( "Draw", "mydraw", mydraw )
