arkadia_herbporn = arkadia_herbporn or {
    state = false,
    items = {},
    panel = "",
    bufflabel = nil,
    fontsize = 14,
    alchemist_mode = false,
    alchemist_last_taken_name = nil,
    alchemist_last_taken_effect = nil,
    geyser_container = nil,
    geyser_container_timers = nil,
    trigger = nil,
    triggers = {}
}

arkadia_herbporn.herbs = {
    ["lampa"] = {cooldown = 0,effect = 300},
    ["default_sil"] = {cooldown = 0,effect = 600},
    ["default_zrc"] = {cooldown = 0,effect = 600},
    ["default_wyt"] = {cooldown = 0,effect = 600},
    ["default_odw"] = {cooldown = 0,effect = 600},
    ["default_int"] = {cooldown = 0,effect = 600},
    ["default_spo"] = {cooldown = 0,effect = 600},
    ["deliona"] = {cooldown = 600,effect = 30},
    ["mandragora"] = {cooldown = 600,effect = 1},
    ["ogorecznik"] = {cooldown = 0,effect = 600},
    ["bielun"] = {cooldown = 0,effect = 600},
    ["aralia"] = {cooldown = 0,effect = 600},
    ["casur"] = {cooldown = 0,effect = 600},
    ["krasnodrzew"] = {cooldown = 0,effect = 600},
    ["kulczyba"] = {cooldown = 0,effect = 600},
    ["ususzona_aralia"] = {cooldown = 0,effect = 600},
    ["item_healing"] = {cooldown = 0, effect = 0},
    ["misterny_plaszcz"] = {cooldown = 0, effect = 0},
    ["jatagan"] = {cooldown = 0, effect = 0}
}

function arkadia_herbporn:add_buff(bufftype)
    local itemcount = table.size(arkadia_herbporn.items)
    itemcount = itemcount + 1
    arkadia_herbporn.items[itemcount] = {}
    arkadia_herbporn.items[itemcount].type = bufftype
    arkadia_herbporn.items[itemcount].cooldown = arkadia_herbporn.herbs[bufftype].cooldown
    arkadia_herbporn.items[itemcount].effect = arkadia_herbporn.herbs[bufftype].effect
    arkadia_herbporn.items[itemcount].effect_max = arkadia_herbporn.herbs[bufftype].effect
    arkadia_herbporn.items[itemcount].file = arkadia_herbporn.herbs[bufftype].file
--    self:debug_print(os.date("%H:%m:%S") .. " Wyswietlam <yellow>" .. bufftype .. "<reset>")
end

function arkadia_herbporn:del_buff(bufftype)
    local itemcount = table.size(arkadia_herbporn.items)

    for i=1, itemcount, 1 do
        if arkadia_herbporn.items[i].effect == 0 and
            arkadia_herbporn.herbs[arkadia_herbporn.items[i].type].effect == 0 and
            arkadia_herbporn.items[i].type == bufftype
            then
                arkadia_herbporn.items[i].effect = -1
                return
            end
    end
end

function arkadia_herbporn:del_buff_force(bufftype)
    local itemcount = table.size(arkadia_herbporn.items)

    for i=1, itemcount, 1 do
        if --arkadia_herbporn.items[i].effect == 0 and
            --arkadia_herbporn.herbs[arkadia_herbporn.items[i].type].effect == 0 and
            arkadia_herbporn.items[i].type == bufftype
            then
                arkadia_herbporn.items[i].effect = -1
            end
    end
end


function arkadia_herbporn:refresh_buff(bufftype)
    local itemcount = table.size(arkadia_herbporn.items)

    for i=1, itemcount, 1 do
        if arkadia_herbporn.items[i].type == bufftype
            then
                arkadia_herbporn.items[i].effect = arkadia_herbporn.herbs[bufftype].effect
                return
            end
    end

end


function arkadia_herbporn:label_setup()
    local evenBiggerFont = scripts.ui.multibinds.font_size + 4
    local css = CSSMan.new([[
    padding-left: 5px;
    border-bottom: 1px solid black;
    margin-bottom: 3px;
    font-family:]].. getFont() ..[[,Consolas,Monaco,Lucida Console,Liberation Mono,DejaVu Sans Mono,Bitstream Vera Sans Mono,Courier New, monospace;
  ]] .. amap.ui.normal_button)

    arkadia_herbporn.bufflabel = Geyser.Label:new({
        name = "arkadia_herbporn.bufflabel",
        height = "100%",
        width = "50%",
        fontSize = arkadia_herbporn.fontsize
    }, scripts.ui.actions_container)

    arkadia_herbporn.bufflabel:setStyleSheet(css:getCSS())
    arkadia_herbporn.bufflabel:echo("<font color='lawn green'>Init...")
end

function arkadia_herbporn:nice_minutes(seconds)
    if seconds > 600 then return "10m" end
    if seconds > 540 then return "9m" end
    if seconds > 480 then return "8m" end
    if seconds > 420 then return "7m" end
    if seconds > 360 then return "6m" end
    if seconds > 300 then return "5m" end
    if seconds > 240 then return "4m" end
    if seconds > 180 then return "3m" end
    if seconds > 120 then return "2m" end
    if seconds > 60 then return "1m" end
    return seconds
end

function arkadia_herbporn:loop()
    --if arkadia_herbporn.geyser_container then arkadia_herbporn.geyser_container:Destroy() end
    arkadia_herbporn.geyser_container = Geyser.HBox:new({
        name = "herbporn_container",
        x="75%", y=-135,  --y=100
        width = "100%",
        height=40
    })
    arkadia_herbporn.geyser_container_timers = Geyser.HBox:new({
        name = "herbporn_timers",
        x="75%", y=-95,     --y=140
        width = "100%",
        height=8
    })


    local itemcount = table.size(arkadia_herbporn.items)

    for i=1, itemcount, 1 do
        if arkadia_herbporn.items[i].label then
            arkadia_herbporn.items[i].label:hide()
            arkadia_herbporn.items[i].gauge:hide()
        end
    end

    for i=1, itemcount, 1 do
        if arkadia_herbporn.items[i].effect == 0 and arkadia_herbporn.herbs[arkadia_herbporn.items[i].type].effect == 0 then
            arkadia_herbporn.items[i].label = Geyser.Label:new({
                name=math.random(os.time()) .. "label",
                width=40,
                height=40,
                container = self.geyser_container,
                v_policy=Geyser.Fixed,
                h_policy=Geyser.Fixed,
                fontSize=25,
            }, arkadia_herbporn.geyser_container)
            arkadia_herbporn.items[i].label:setStyleSheet(
                string.format("border-image: url('%s'); qproperty-alignment: 'AlignCenter | AlignVCenter';",
                string.format("%s/plugins/chaosforge/%s.png", getMudletHomeDir(), arkadia_herbporn.items[i].type))
            )
            --arkadia_herbporn.items[i].label:echo("<font color='lawn green'>" .. self:nice_minutes(arkadia_herbporn.items[i].effect))
            arkadia_herbporn.items[i].gauge = Geyser.Gauge:new({
                name=math.random(os.time()) .. "gauge",
                width=40,
                height="100%",
                container = self.geyser_container_timers,
                --fontSize=10,
                v_policy=Geyser.Fixed,
                h_policy=Geyser.Fixed,
            }, arkadia_herbporn.geyser_container_timers)
            arkadia_herbporn.items[i].gauge:setValue(100,100)
            arkadia_herbporn.items[i].gauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #f04141, stop: 0.1 #f02929, stop: 0.49 #cc0000, stop: 0.5 #a30000, stop: 1 #cc0000);
                border-top: 1px black solid;
                border-left: 1px black solid;
                border-bottom: 1px black solid;
                border-radius: 7;
                padding: 3px;
            ]])
        end

        if arkadia_herbporn.items[i].effect > 0 then
            arkadia_herbporn.items[i].effect = arkadia_herbporn.items[i].effect - 1
            if arkadia_herbporn.items[i].effect == 0 then
                self:debug_print("<DeepPink>Efekt <MediumPurple>" .. arkadia_herbporn.items[i].type .. "<DeepPink> konczy sie.")
                arkadia_herbporn.items[i].effect = -1
            else
                arkadia_herbporn.items[i].label = Geyser.Label:new({
                    name=math.random(os.time()) .. "label",
                    width=40,
                    height=40,
                    container = self.geyser_container,
                    v_policy=Geyser.Fixed,
                    h_policy=Geyser.Fixed,
                    fontSize=25,
                }, arkadia_herbporn.geyser_container)
                arkadia_herbporn.items[i].label:setStyleSheet(
                    string.format("border-image: url('%s'); qproperty-alignment: 'AlignCenter | AlignVCenter';",
                    string.format("%s/plugins/chaosforge/%s.png", getMudletHomeDir(), arkadia_herbporn.items[i].type))
                )
                --arkadia_herbporn.items[i].label:echo("<font color='lawn green'>" .. self:nice_minutes(arkadia_herbporn.items[i].effect))
                arkadia_herbporn.items[i].gauge = Geyser.Gauge:new({
                    name=math.random(os.time()) .. "gauge",
                    width=40,
                    height="100%",
                    container = self.geyser_container_timers,
                    --fontSize=10,
                    v_policy=Geyser.Fixed,
                    h_policy=Geyser.Fixed,
                }, arkadia_herbporn.geyser_container_timers)
                arkadia_herbporn.items[i].gauge:setValue(
                    arkadia_herbporn.items[i].effect/100,
                    arkadia_herbporn.items[i].effect_max/100
                )
                arkadia_herbporn.items[i].gauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #98f041, stop: 0.1 #8cf029, stop: 0.49 #66cc00, stop: 0.5 #52a300, stop: 1 #66cc00);
                    border-top: 1px black solid;
                    border-left: 1px black solid;
                    border-bottom: 1px black solid;
                    border-radius: 7;
                    padding: 3px;
                ]])
                end
        end
    end
    --arkadia_herbporn.bufflabel:echo(arkadia_herbporn.panel)
    tempTimer(1, [[arkadia_herbporn:loop()]])

   --arkadia_herbporn.geyser_container:organize()
   --Geyser.HBox:organize ()
end


function arkadia_herbporn:debug_print(text)
    --cecho("\n<CadetBlue>(skrypty):<purple>(alchemy) <reset>" .. text)
    if chaosforge.replace_herb_consumption == true then
        cecho("\n<purple>(Alchemy) <reset>" .. os.date("%H:%m:%S") .. " ".. text)
    end
end

function arkadia_herbporn:alchemist_init_triggers()
    local r = tempTrigger("Przezuwasz eliptyczny zaostrzony lisc.", [[arkadia_herbporn.alchemist_last_taken_name="ogorecznik"]])
    local r = tempTrigger("Wachasz duzy bialy kwiat.", [[arkadia_herbporn.alchemist_last_taken_name="bielun"]])
end

function arkadia_herbporn:_add(action, herb)
    local tmpaction = "zjedz"
    if action == "Zjadasz" then tmpaction = "zjedz" end
    if action == "Wachasz" then tmpaction = "powachaj" end
    if action == "Przezuwasz" then tmpaction = "przezuj" end
    if action == "Proszkujesz" then tmpaction = "sproszkuj" end
    if action == "Przykladasz" then tmpaction = "przyloz" end
    if action == "Rozgryzasz" then tmpaction = "rozgryz" end
    if action == "Rozkruszasz" then tmpaction = "rozgryz" end
    if action == "Wcierasz" then tmpaction = "rozgryz" end
    if action == "Polykasz" then tmpaction = "polknij" end

    local tmpeffect = "<red>nic"
    for v, k in pairs(herbs.data.herb_id_to_use[herbs.herbs_long_to_short[herb]]) do
        if k.action  == tmpaction then
            tmpeffect = k.effect
        end
    end

    if herbs.herbs_long_to_short[herb] then
        if chaosforge.replace_herb_consumption == true then
            deleteLine()
            self:debug_print("<DeepPink>" .. action .. " <MediumPurple>" .. herb .. " <DeepPink>" .. herbs.herbs_long_to_short[herb] .. " <yellow>" .. tmpeffect)
        end
    else
        if chaosforge.replace_herb_consumption == true then
            deleteLine()
            self:debug_print("<red>Nie ma tego w bazie: " .. action .. " " .. herb)
        end
        return
    end

    local myplant = herbs.herbs_long_to_short[herb]
    if arkadia_herbporn.herbs[myplant] then
        self:add_buff(myplant)
    elseif tmpeffect == "+zrc" then
        self:add_buff("default_zrc")
    elseif tmpeffect == "+wyt" then --drath test
        self:add_buff("default_wyt")
    elseif tmpeffect == "+sila" then
        self:add_buff("default_sil")
    elseif tmpeffect == "+odw" then
        self:add_buff("default_odw")
    elseif tmpeffect == "<medium_turquoise>+spo<grey>" then
        self:add_buff("default_spo")
    elseif tmpeffect == "<medium_turquoise>+int<grey>" then
        self:add_buff("default_int")
    end
end

function arkadia_herbporn:create_triggers()
    if self.trigger then
        killTrigger(self.trigger)
    end
    self.trigger = tempRegexTrigger("(Zjadasz|Przezuwasz|Wachasz|Proszkujesz|Rozgryzasz|Polykasz|Przykladasz|Rozkruszasz|Wcierasz) (jeden |jedna |dwa |dwie |trzy |)(.*)\\.$",function () self:_add(matches[2], matches[4]) end, nil)
end

function arkadia_herbporn:init_triggers()
    self.triggers["misterny_on"] = tempTrigger("Spinasz za pomoca srebrnej broszy",function () self:add_buff("misterny_plaszcz") end, nil)
    self.triggers["misterny_off"] = tempTrigger("Ostroznie odpinasz srebrna brosze spinajaca", function () self:del_buff("misterny_plaszcz") end, nil)
end

function trigger_func_skrypty_ui_footer_elements_weapon_on()
    scripts.inv.weapon_grip = true
    raiseEvent("weapon_state", true)
    if string.find(matches[1], "zdobionego jatagana") then arkadia_herbporn:add_buff("jatagan") end
end

function trigger_func_skrypty_ui_footer_elements_weapon_off()
    if matches[2] and string.match(matches[2], "burza piaskowa") then
        return
    end
    scripts.inv.weapon_grip = false
    raiseEvent("weapon_state", false)
    if string.find(matches[1], "Szybkim ruchem opuszczasz jasniejacy zdobiony jatagan") then arkadia_herbporn:del_buff("jatagan") end
end


function arkadia_herbporn:test()
    expandAlias("/fake Zjadasz dwie zolty jasny kwiat.") -- delion
    expandAlias("/fake Przezuwasz szary kolczasty korzen.") -- aralia
    expandAlias("/fake Wachasz dwie duzy bialy kwiat.") -- bielun
    expandAlias("/fake Zjadasz dwie mazisty bulwiasty grzyb.") -- casur
    expandAlias("/fake Przezuwasz dziwne zoltoszare nasionko.") -- kulczyba
    expandAlias("/fake Przezuwasz soczysty karminowy mech.") --dragh
end


--<string>^Czujesz sie (zreczniejsz(?:y|a)|wytrzymalsz(?:y|a)|silniejsz(?:y|a)|lepiej|mniej zmeczon(?:y|a)|znacznie lepiej|bardziej odporn(?:y|a) na trucizne|mniej zmeczon(?:y|a) mentalnie|silniejsz(?:y|a)|zreczniejsz(?:y|a)|bardziej wytrzymal(?:y|a)|bardziej inteligentn(?:y|a)|bardziej odwazn(?:y|a)|mniej zmeczon(?:y|a) mentalnie|mniej glodn(?:y|a)|lepiej|mniej zmeczon(?:y|a)|mniej niespokojn(?:y|a)|znacznie lepiej|bardziej odporn(?:y|a) na .*)\.$</string>
--<string>Otaczajacy cie smrod rozwiewa sie.</string>
--<string>Odnosisz wrazenie, ze bedziesz teraz sobie lepiej radzic w zauwazaniu tego, co ukryte.</string>
function trigger_func_herbs_positive_effect()
    selectCurrentLine()
    fg("forest_green")
    resetFormat()
end

--<string>^Czujesz sie (bardziej niezdarn(?:y|a)|mniej wytrzymal(?:y|a)|bardziej zmeczon(?:y|a)|mniej odporn(?:y|a) na trucizne|bardziej glodn(?:y|a)|oslabion(?:y|a)|bardziej niezdarn(?:y|a)|mniej wytrzymal(?:y|a)|mniej inteligentn(?:y|a)|mniej odwazn(?:y|a)|bardziej zmeczon(?:y|a) mentalnie|bardziej glodn(?:y|a)|gorzej|bardziej zmeczon(?:y|a)|bardziej niespokojn(?:y|a)|mniej odporn(?:y|a) na *)\.$</string>
--<string>Odnosisz wrazenie, ze bedziesz teraz sobie gorzej radzic w zauwazaniu tego, co ukryte.</string>
function trigger_func_herbs_negative_effect()
    selectCurrentLine()
    fg("orange_red")
    resetFormat()
end

function arkadia_herbporn:init()
    arkadia_herbporn.items = {}
    if chaosforge.buffbar_enabled == true then
        self.fontsize = scripts.ui.multibinds.font_size + 2
        arkadia_herbporn:loop()
    end
    arkadia_herbporn:create_triggers()

end

arkadia_herbporn:init()
