function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_kogos_zaslony()
    if scripts.gags:delete_line("rozkazy") then
        return
    end

    if matches[3] == "ciebie" or matches[3] == "cie" then
        local uppered = string.upper(matches[3])
        creplaceLine("<sea_green>[ ROZKAZ DEF ] " .. matches[2] .. uppered)
    else
        creplaceLine("<sea_green>[ ROZKAZ DEF ] " .. matches[2] .. matches[3])
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_kogos_zaatakowac()
    if scripts.gags:delete_line("rozkazy") then
        return
    end

    if matches[3] == "ciebie" or matches[3] == "cie" then
        local uppered = string.upper(matches[3])
        creplaceLine("<salmon>[ ROZKAZ ATT ] " .. matches[2] .. uppered .. ".")
    else
        creplaceLine("<salmon>[ ROZKAZ ATT ] " .. matches[2] .. matches[3] .. ".")
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_zaslona_wykonanie()
    local str_replace = "<sea_green>[ ROZKAZ WYK ] <".. scripts.gag_colors["zaslony_udane"] .. ">[ ZASLANIA ] " .. matches[1]
    creplaceLine(str_replace)
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_atak_wykonanie()
    if scripts.gags:delete_line("rozkazy") then
        return
    end

    selectCurrentLine()
    local str_replace = "[ ROZKAZ WYK ] "
    prefix(str_replace)
    if selectString(str_replace, 1) > -1 then
        fg("sea_green")
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_kogos_zablokowac()
    if scripts.gags:delete_line("rozkazy") then
        return
    end
    
    creplaceLine("<salmon>[ ROZKAZ BLO ] " .. matches[2] .. matches[3] .. ".")
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_zaslony_udane_zaslaniasz_ty()
    if scripts.gags:delete_line("zaslony_udane") then
        return
    end

    creplaceLine("<" .. scripts.gag_colors["zaslony_udane"] .. ">[ ZASLANIASZ ] " .. matches[2] .. "")
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_zaslony_udane_zaslania_kogos()
    if scripts.gags:delete_line("zaslony_udane") then
        return
    end

    creplaceLine("<" .. scripts.gag_colors["zaslony_udane"] .. ">[  ZASLANIA  ] " .. matches[2] .. "")
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_zaslony_udane_wycofanie_za_ciebie()
    if scripts.gags:delete_line("zaslony_udane") then
        return
    end

    scripts.gags:gag_prefix(" WYC ZA CIE ", "zaslony_udane")
end

function trigger_func_skrypty_ui_gags_color_color_zaslony_udane_wycofanie_sie_ty()
    if scripts.gags:delete_line("zaslony_udane") then
        return
    end

    scripts.gags:gag_prefix(" WYCOFUJESZ ", "zaslony_udane")
end

function trigger_func_skrypty_ui_gags_color_color_zaslony_udane_wycofanie_kogos()
    if scripts.gags:delete_line("zaslony_udane") then
        return
    end

    scripts.gags:gag_prefix(" WYC ", "zaslony_udane")
end


function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_kogos_zaslony()
    if scripts.gags:delete_line("rozkazy") then
        return
    end

    if matches[3] == "ciebie" or matches[3] == "cie" then
        local uppered = string.upper(matches[3])
        creplaceLine("<sea_green>[ ROZKAZ DEF ] " .. matches[2] .. uppered .. ".")
    else
        creplaceLine("<sea_green>[ ROZKAZ DEF ] " .. matches[2] .. matches[3] .. ".")
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_kogos_zaatakowac()
    if scripts.gags:delete_line("rozkazy") then
        return
    end

    if matches[3] == "ciebie" or matches[3] == "cie" then
        local uppered = string.upper(matches[3])
        creplaceLine("<salmon>[ ROZKAZ ATT ] " .. matches[2] .. uppered .. ".")
    else
        creplaceLine("<salmon>[ ROZKAZ ATT ] " .. matches[2] .. matches[3] .. ".")
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_zaslona_wykonanie()
    local str_replace = "<sea_green>[ ROZKAZ WYK ] <".. scripts.gag_colors["zaslony_udane"] .. ">[ ZASLANIA ] " .. matches[1]
    creplaceLine(str_replace)
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_atak_wykonanie()
    if scripts.gags:delete_line("rozkazy") then
        return
    end

    selectCurrentLine()
    local str_replace = "[ ROZKAZ WYK ] "
    prefix(str_replace)
    if selectString(str_replace, 1) > -1 then
        fg("sea_green")
    end
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_rozkazy_rozkaz_kogos_zablokowac()
    if scripts.gags:delete_line("rozkazy") then
        return
    end
    
    creplaceLine("<salmon>[ ROZKAZ BLO ] " .. matches[2] .. matches[3] .. ".")
    resetFormat()
end

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

