-- Name: Input Library 
-- Author: his cumdumpster#2115

-- Credits to Klient for doing it first. Pretty much his code

input_library = {

    keys_pressed = {},
    keys_pressed_prev = {},

    -- @info: Updates recently pressed keys (Always run in "on_paint" callback at the very beginning)
    update = function() 
        for i = 1, 255 do 
            input_library.keys_pressed_prev[i] = input_library.keys_pressed[i]
            input_library.keys_pressed[i] = utils.get_active_key(i)
        end
    end,

    -- @info: Checks if key is currently pressed
    -- @param: key: number
    -- @usage: input_library.key_down(0x02)
    key_down = function(key) 
        return input_library.keys_pressed[key]
    end,
    
    -- @info: Checks when the key pressed
    -- @param: key: number
    -- @usage: input_library.key_pressed(0x02)
    key_pressed = function(key) 
        return input_library.keys_pressed[key] and not input_library.keys_pressed_prev[key]
    end,
    
    -- @info: Checks once when the key is released
    -- @param: key: number
    -- @usage: input_library.key_released(0x02)
    key_released = function(key) 
        return not input_library.keys_pressed[key] and input_library.keys_pressed_prev[key]
    end,
    
    -- @info: Checks if the cursor is within a specified box
    -- @param: x: number
    -- @param: y: number
    -- @param: w: number
    -- @param: h: number
    -- @usage: input_library.cursor_in_bounds(10, 10, 100, 100)
    cursor_in_bounds = function(x, y, w, h) 
        local mouse_pos = utils.get_cursor_position()

	    local check = (mouse_pos.x >= x and mouse_pos.x < x + w and mouse_pos.y >= y and mouse_pos.y < y + h) 

        return check
    end,
    
    -- @info: Gets the virtual-key code for specified key
    -- @param: key name: string
    -- @usage: input_library.keys["MOUSE1"] = 0x01
    keys = {["MOUSE1"] = 0x01,["MOUSE2"] = 0x02,["CANCEL"] = 0x03,["MOUSE3"] = 0x04,["MOUSE4"] = 0x05,["MOUSE5"] = 0x06,["BACK"] = 0x08,["TAB"] = 0x09,["CLEAR"] = 0x0C,["RETURN"] = 0x0D,["SHIFT"] = 0x10,["CTRL"] = 0x11,["MENU"] = 0x12,["PAUSE"] = 0x13,["CAPS"] = 0x14,["KANA"] = 0x15,["HANGUEL"] = 0x15,["HANGUL"] = 0x15,["IME_ON"] = 0x16,["JUNJA"] = 0x17,["FINAL"] = 0x18,["HANJA"] = 0x19,["KANJI"] = 0x19,["IME_OFF"] = 0x1A,["Disabled"] = 0x1B,["CONVERT"] = 0x1C,["NONCONVERT"] = 0x1D,["ACCEPT"] = 0x1E,["MODECHANGE"] = 0x1F,["SPACE"] = 0x20,["PRIOR"] = 0x21,["NEXT"] = 0x22,["END"] = 0x23,["HOME"] = 0x24,["LEFT"] = 0x25,["UP"] = 0x26,["RIGHT"] = 0x27,["DOWN"] = 0x28,["SELECT"] = 0x29,["PRINT"] = 0x2A,["EXECUTE"] = 0x2B, ["SNAPSHOT"] = 0x2C,["INSERT"] = 0x2D,["DELETE"] = 0x2E,["HELP"] = 0x2F,["0"] = 0x30,["1"] = 0x31,["2"] = 0x32,["3"] = 0x33,["4"] = 0x34,["5"] = 0x35,["6"] = 0x36,["7"] = 0x37,["8"] = 0x38,["9"] = 0x39,["A"] = 0x41,["B"] = 0x42,["C"] = 0x43,["D"] = 0x44,["E"] = 0x45,["F"] = 0x46,["G"] = 0x47,["H"] = 0x48,["I"] = 0x49,["J"] = 0x4A,["K"] = 0x4B,["L"] = 0x4C,["M"] = 0x4D,["N"] = 0x4E,["O"] = 0x4F,["P"] = 0x50,["Q"] = 0x51,["R"] = 0x52,["S"] = 0x53,["T"] = 0x54,["U"] = 0x55,["V"] = 0x56,["W"] = 0x57,["X"] = 0x58,["Y"] = 0x59,["Z"] = 0x5A,["LWIN"] = 0x5B,["RWIN"] = 0x5C,["APPS"] = 0x5D,["SLEEP"] = 0x5F,["NUM0"] = 0x60,["NUMP1"] = 0x61,["NUM2"] = 0x62,["NUM3"] = 0x63,["NUM4"] = 0x64,["NUM5"] = 0x65,["NUM6"] = 0x66,["NUM7"] = 0x67,["NUM8"] = 0x68,["NUM9"] = 0x69,["MULTIPLY"] = 0x6A,["ADD"] = 0x6B,["SEPARATOR"] = 0x6C,["SUBTR"] = 0x6D,["DECIMAL"] = 0x6E,["DIVIDE"] = 0x6F,["F1"] = 0x70,["F2"] = 0x71,["F3"] = 0x72,["F4"] = 0x73,["F5"] = 0x74,["F6"] = 0x75,["F7"] = 0x76,["F8"] = 0x77,["F9"] = 0x78,["F10"] = 0x79,["F11"] = 0x7A,["F12"] = 0x7B,["F13"] = 0x7C,["F14"] = 0x7D,["F15"] = 0x7E,["F16"] = 0x7F,["F17"] = 0x80,["F18"] = 0x81,["F19"] = 0x82,["F20"] = 0x83,["F21"] = 0x84,["F22"] = 0x85,["F23"] = 0x86,["F24"] = 0x87,["NUMLCK"] = 0x90,["SCROLL"] = 0x91,["LSHIFT"] = 0xA0,["RSHIFT"] = 0xA1,["LCONTROL"] = 0xA2,["RCONTROL"] = 0xA3,["LMENU"] = 0xA4,["RMENU"] = 0xA5,["BROWSER_BACK"] = 0xA6,["BROWSER_FORWARD"] = 0xA7,["BROWSER_REFRESH"] = 0xA8,["BROWSER_STOP"] = 0xA9,["BROWSER_SEARCH"] = 0xAA,["BROWSER_FAVORITES"] = 0xAB,["BROWSER_HOME"] = 0xAC,["VOLUME_MUTE"] = 0xAD,["VOLUME_DOWN"] = 0xAE,["VOLUME_UP"] = 0xAF,["MEDIA_NEXT_TRACK"] = 0xB0,["MEDIA_PREV_TRACK"] = 0xB1,["MEDIA_STOP"] = 0xB2,["MEDIA_PLAY_PAUSE"] = 0xB3,["LAUNCH_MAIL"] = 0xB4,["LAUNCH_MEDIA_SELECT"] = 0xB5,["LAUNCH_APP1"] = 0xB6,["LAUNCH_APP2"] = 0xB7,["OEM_1"] = 0xBA,["OEM_PLUS"] = 0xBB,["OEM_COMMA"] = 0xBC,["OEM_MINUS"] = 0xBD,["OEM_PERIOD"] = 0xBE,["OEM_2"] = 0xBF,["OEM_3"] = 0xC0,["OEM_4"] = 0xDB,["OEM_5"] = 0xDC,["OEM_6"] = 0xDD,["OEM_7"] = 0xDE,["OEM_8"] = 0xDF,["OEM_102"] = 0xE2,["PROCESSKEY"] = 0xE5,["PACKET"] = 0xE7,["ATTN"] = 0xF6,["CRSEL"] = 0xF7,["EXSEL"] = 0xF8,["EREOF"] = 0xF9,["PLAY"] = 0xFA,["ZOOM"] = 0xFB,["NONAME"] = 0xFC,["PA1"] = 0xFD,["OEM_CLEAR"] = 0xFE}

}

return input_library

--[[ Renders a small rectangle in the top left of your screen, which will turn green when pressed

    cheat.push_callback("on_paint", function()

	    input_library.update()

	    local check = input_library.key_down(input_library.keys["MOUSE1"]) and input_library.cursor_in_bounds(50, 50, 50, 50)

	    render.rect_filled(50, 50, 50, 50, check and color(0, 255, 0, 255) or color(255, 0, 0, 255))

    end)

]]