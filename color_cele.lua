function trigger_func_skrypty_ui_gags_color_color_cele_cel_obrony_ktos()
    if scripts.gags:delete_line("cele") then
        return
    end

    if matches[3] == "ciebie" then
        creplaceLine("<sea_green>[  CEL DEF   ] " .. matches[2] .. "CIEBIE jako CEL OBRONY.")
    else
        creplaceLine("<sea_green>[  CEL DEF   ] " .. matches[2] .. matches[3] .. " jako CEL OBRONY.")
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_cele_cel_ataku_ktos()
    if scripts.gags:delete_line("cele") then
        return
    end
    
    creplaceLine("<salmon>[  CEL ATT   ] " .. matches[2] .. " CEL ATAKU.")

    resetFormat()
end
