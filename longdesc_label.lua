chaosforge.longdesc_label = chaosforge.longdesc_label or {
    handler = nil
}

function chaosforge.longdesc_label:show()
    self.cf_long_label = Geyser.Label:new({
        name = "cf_long_label",
        x = 0, y = 0,
        width = "100%", height = "50",
        fgColor = "black",
        message = [[<center>""</center>]]
      })
    self.cf_long_label:setFontSize(10)
    self.cf_long_label:echo(amap.localization.current_long)
end
function chaosforge.longdesc_label:hide()
    self.cf_long_label:hide()
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
        if chaosforge.longs then
            
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

