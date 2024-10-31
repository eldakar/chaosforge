chaosforge.longdesc_label = chaosforge.longdesc_label or {
    handler = nil
}
chaosforge.longdesc_label.patterns = {
    { pattern = "okno",         color = nil },
    { pattern = "skrzyni%a*",   color = nil },
    { pattern = "posag%a*",     color = nil },
    { pattern = "obraz%a*",     color = nil },
    { pattern = "lustro",       color = nil },
    { pattern = "kominek",      color = nil },
    { pattern = "bibliotek%a*", color = nil },
    { pattern = "lozk%a*",      color = nil },
    { pattern = "biurk%a*",     color = nil },
    { pattern = "szaf%a*",      color = nil },
    { pattern = "dywan%a*",     color = nil },
    { pattern = "zegar%a*",     color = nil },
    { pattern = "fontann%a*",   color = nil },
    { pattern = "most%a*",      color = nil },
    { pattern = "kamien%a*",    color = nil },
    { pattern = "drzew%a*",     color = nil },
    { pattern = "krzew%a*",     color = nil },
    { pattern = "kwiat%a*",     color = nil },
    { pattern = "studni%a*",    color = nil },
    { pattern = "lawk%a*",      color = nil },
    { pattern = "mur%a*",       color = nil },
    { pattern = "bram%a*",      color = nil },
    { pattern = "latarni%a*",   color = nil },
    { pattern = "pomnik%a*",    color = nil },
    { pattern = "wiatrak%a*",   color = nil },
    { pattern = "most%a*",      color = nil },
    { pattern = "altan%a*",     color = nil },
    { pattern = "drzwi%a*",     color = nil },
    { pattern = "schod%a*",     color = nil },
    { pattern = "ksieg%a*",     color = nil },
    { pattern = "sadzawk%a*",   color = nil },
    { pattern = "stol%a*",      color = nil },
    { pattern = "krzes%a*",     color = nil },
    { pattern = "polk%a*",      color = nil },
    { pattern = "szuflad%a*",   color = nil },
    { pattern = "lamp%a*",      color = nil },
    { pattern = "korytarz%a*",  color = nil },
    { pattern = "dzban%a*",     color = nil },
    { pattern = "misk%a*",      color = nil },
    { pattern = "kubk%a*",      color = nil },
    { pattern = "dzbank%a*",    color = nil },
    { pattern = "kosz%a*",      color = nil },
    { pattern = "klucz%a*",     color = nil },
    { pattern = "zamk%a*",      color = nil },
    { pattern = "scian%a*",     color = nil },
    { pattern = "podlog%a*",    color = nil },
    { pattern = "sufit%a*",     color = nil },
    { pattern = "piwnic%a*",    color = nil },
    { pattern = "strych%a*",    color = nil },
    { pattern = "taras%a*",     color = nil },
    { pattern = "balkon%a*",    color = nil },
    { pattern = "ogrod%a*",     color = nil },
    { pattern = "dziedzin%a*",  color = nil },
    { pattern = "furtk%a*",     color = nil },
    { pattern = "plot%a*",      color = nil },
    { pattern = "krat%a*",      color = nil },
    { pattern = "klatk%a*",     color = nil },
    { pattern = "miecz%a*",     color = nil },
    { pattern = "mikstur%a*",   color = nil },
    { pattern = "pergamin%a*",  color = nil },
    { pattern = "skarb%a*",     color = nil },
    { pattern = "map%a*",       color = nil },
    { pattern = "notatk%a*",    color = nil },
    { pattern = "przedmiot%a*", color = nil },
    { pattern = "stert%a*",     color = nil },
    { pattern = "szmat%a*",     color = nil },
    { pattern = "pudelk%a*",    color = nil },
    { pattern = "pojemnik%a*",  color = nil },
    { pattern = "sloik%a*",     color = nil },
    { pattern = "beczk%a*",     color = nil },
    { pattern = "zwoj%a*",      color = nil },
    { pattern = "gor%a*",       color = nil },
    { pattern = "posag%a*",     color = nil },
    { pattern = "statu%a*",     color = nil },
    { pattern = "bandaz%a*",    color = nil },
    { pattern = "lancuch%a*",   color = nil },
    { pattern = "polk%a*",      color = nil },
    { pattern = "szczelin%a*",  color = nil },
    { pattern = "wnek%a*",      color = nil },
    { pattern = "otwor%a*",     color = nil },
    { pattern = "wyrw%a*",      color = nil },
    { pattern = "glaz%a*",      color = nil },
    { pattern = "owoc%a*",      color = nil },
    { pattern = "warzyw%a*",    color = nil },
    { pattern = "kufr%a*",      color = nil },
    { pattern = "klod%a*",      color = nil },
    { pattern = "slad%a*",      color = nil }
}


function chaosforge:longdesc_stylesheet()
    return [[
        QLabel {
            border-style: solid;
            background-color: #171512;
            border-width: 10px 20px 10px 20px;
            border-image: url(]] .. scripts.ui.img_path .. [[uni-container-borders-short-height.png) 20 20 repeat;
            qproperty-wordWrap: true;
        }
    ]]
end

function chaosforge.longdesc_label:show()
    local message = amap.localization.current_long
    local label_width = getMainWindowSize()
    local chars_per_line = math.floor(label_width / 12)
    local num_lines = math.ceil(#message / chars_per_line)
    local label_height = num_lines * 20

    for _, p in ipairs(chaosforge.longdesc_label.patterns) do
        local color = p.color or "<white>"
        message = message:gsub(p.pattern, color .. "%0" .. "<green>")
    end
    self.cf_long_label = Geyser.Label:new({
        name = "cf_long_label",
        x = 0,
        y = 0,
        width = "100%",
        height = tostring(label_height) .. "px",
        fgColor = "black",
        message = [[<center>""</center>]]
    })
    setBackgroundColor("cf_long_label", 0, 20, 0, 200)
    --cecho("cf_long_label", "<green>".. string.gsub(amap.localization.current_long, "[.]", '.\n'))
    cecho("cf_long_label", "<green>" .. ansi2string(message))
    self.cf_long_label:setStyleSheet(chaosforge:longdesc_stylesheet())
end

function chaosforge.longdesc_label:hide()
    if self.cf_long_label then
        self.cf_long_label:hide()
    end
end

function chaosforge.longdesc_label:init()
    self.handler = scripts.event_register:register_singleton_event_handler(self.handler, "amapNewLocation",
        function() self:hide() end)
end

function scripts.ingress:post_process_message(msg)
    if scripts.ui.separate_talk_window and scripts.ui.separate_talk_window_msg_types[gmcp.gmcp_msgs.type] then
        local timestamp = ""
        if scripts.ui.separate_talk_window_timestamp and string.trim(scripts.ui.separate_talk_window_timestamp) ~= "" then
            timestamp = string.format("[%s] ", os.date(scripts.ui.separate_talk_window_timestamp))
        end
        decho("talk_window", timestamp .. scripts.ui.separate_talk_window_prefix .. ansi2decho(gmcp.gmcp_msgs.decoded))
    end
    if gmcp.gmcp_msgs.type == "comm" then
        scripts.ui.talk_history:add(msg)
    end
    if gmcp.gmcp_msgs.type == "room.short" then
        amap.localization.current_short = ansi2string(msg):gsub("\n", "")
        amap.localization.current_exit = ""
    end
    if gmcp.gmcp_msgs.type == "room.long" then
        amap.localization.current_long = ansi2string(msg):gsub("\n", "")
        if chaosforge.longs == true then
            chaosforge.longdesc_label:show()
        end
    end
    if gmcp.gmcp_msgs.type == "room.exits" then
        amap.localization.current_exit = ansi2string(msg):gsub("\n", "")
    end
    if scripts.ui.combat_window.enabled then
        if not self.deleteLineCalled then
            scripts.ui.combat_window:process(msg)
        end
    end
    raiseEvent("incomingMessage", gmcp.gmcp_msgs.type, msg)
end

chaosforge.longdesc_label:init()
