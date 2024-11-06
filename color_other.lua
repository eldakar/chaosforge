function trigger_func_skrypty_ui_gags_color_color_other_zabiles_color()
    if chaosforge.new_kill_summary == true then
        scripts.inv.collect:killed_action()
        deleteLine()
        print("\n")
        chaosforge:debug_print("expo", matches[1])
        malleus_cobolorum:getMobData(matches[4], "n")
        chaosforge:debug_print("<green>item", "Zbierz z ciala: " .. scripts.keybind.configuration.collect_from_body.modifier[1] .. " + " .. scripts.keybind.configuration.collect_from_body.key)
        print("\n")
    else
        selectCurrentLine()

        local counter = 1
        if misc.counter.killed_amount["JA"] then
            counter = misc.counter.killed_amount["JA"]
        end
        local counter_str = "<tomato> (" .. tostring(counter) .. " / " .. tostring(misc.counter.all_kills) .. ")"
  
        creplaceLine("\n\n<tomato>[  " .. matches[3]:upper() .. "  ] <grey>" .. matches[2] .. counter_str .. "\n\n")
        scripts.inv.collect:killed_action()
        resetFormat()
    end
end

function trigger_func_skrypty_ui_gags_color_color_other_zabil_color()
    selectCurrentLine()
    local counter_str = nil

    if ateam.team_names[matches[3]] then
        local counter = 1
        if misc.counter.killed_amount[matches[3]] then
            counter = misc.counter.killed_amount[matches[3]]
        end
        counter_str = " (" .. tostring(counter) .. " / " .. tostring(misc.counter.all_kills) .. ")"
    end

    if counter_str then
        creplaceLine("<tomato>[   " .. matches[4]:upper() .. "   ] <grey>" .. matches[2] .. counter_str .. "\n")
    else
        creplaceLine("<tomato>[   " .. matches[4]:upper() .. "   ] <grey>" .. matches[2] .. "\n")
    end
    scripts.inv.collect:team_killed_action(matches[3])
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_other_mozesz_dobywac()
    raiseEvent("playBeep")
    raiseEvent("canWieldAfterKnockOff")
    creplaceLine("<green>\n\n[    BRON    ]<cornsilk> Mozesz dobyc broni klawiszem '" .. scripts.keybind:keybind_tostring("functional_key") .."'\n\n")
    resetFormat()
    scripts.utils.bind_functional(scripts.inv.weapons.wield)
    scripts.ui:info_action_update("DOBADZ")
    scripts.ui.info_action_bind = scripts.inv.weapons.wield
end

function trigger_func_skrypty_ui_gags_color_color_other_wytracenie_tobie()
    raiseEvent("playBeep")
    raiseEvent("weaponKnockedOff")
    raiseEvent("weapon_state", false)
    creplaceLine("\n\n<tomato>[    BRON    ] " .. matches[2] .. "\n\n")
    resetFormat()
    scripts.ui:info_action_update("WYTRACENIE")
end

function trigger_func_skrypty_ui_gags_color_color_other_przelamanie()
    local team_break = ateam.team_names[matches[3]] or ateam.team_names[string.lower(matches[3])]
    local color = team_break and "green" or "red"
    creplaceLine("\n\n<".. color ..">[ KTOS LAMIE ] " .. matches[2] .. "\n\n")
    ateam:may_setup_broken_defense(matches[4])
    resetFormat()

    if team_break then
        scripts.utils.echobind("zabij cel ataku", nil, "zabij cel ataku", "attack_target", 0)
    end
end

function trigger_func_skrypty_ui_gags_color_color_other_przelamanie_ty()
    creplaceLine("<green>\n[ TY LAMIESZ ] " .. matches[2] .. "\n")
    ateam:may_setup_broken_defense(matches[3])
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_other_nie_przelamanie_ty()
    creplaceLine("<tomato>\n[ NIE LAMIESZ ] " .. matches[2] .. "\n")
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_other_nie_przelamanie()
    creplaceLine("<tomato>\n[ NIE LAMIE  ] " .. matches[2] .. "\n")
    resetFormat()
end

function trigger_func_skrypty_ui_gags_color_color_other_nekro_tilea()
    raiseEvent("playBeep")
    raiseEvent("weaponKnockedOffNekroTilea")
    creplaceLine("<green>\n[    BRON    ]<cornsilk> Wez bron i dobadz jej\n")
    resetFormat()
    scripts.utils.bind_functional(scripts.inv.weapons.wield)
    scripts.ui:info_action_update("WEZ BRON/DOBADZ")
    scripts.ui.info_action_bind = scripts.inv.weapons.wield
end

function trigger_func_team_leadership()
    fg("DarkGoldenrod")
    prefix("\n[   DRUZYNA   ]  ")
    echo("\n")
    resetFormat()
end
