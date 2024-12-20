chaosforge.longdesc_label = chaosforge.longdesc_label or {
    handler = nil
}
Patterns = {
    { pattern = "schody",   color = "<yellow>" },
    { pattern = "ksiedze",  color = "<yellow>" },
    { pattern = "sadzawka", color = "<yellow>" }
    -- Dodaj więcej wzorców i kolorów według potrzeb
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
    local window_width = getMainWindowSize()
    local label_width = window_width
    local chars_per_line = math.floor(label_width / 10)
    local num_lines = math.ceil(#message / chars_per_line)
    local label_height = num_lines * 15

    for _, p in ipairs(Patterns) do
        message = message:gsub(p.pattern, p.color .. p.pattern .. "<green>")
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
