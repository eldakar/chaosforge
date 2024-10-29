discord_login_notifier = discord_login_notifier or {
    state = {},
    handler = nil,
    handler_dis = nil
}

function discord_login_notifier:init()
    self.handler = scripts.event_register:force_register_event_handler(self.handler, "gmcp.char.info", function()
        --scripts.character.info = gmcp.char.info
        if mc and chaosforge.discord_notifier == true and scripts.character.info["guild_lay"] == "Kultysci Chaosu" then
            mc.discord:send("#ogolny", " zalogowal sie...")
        end
    end)

    self.handler_dis = scripts.event_register:force_register_event_handler(self.handler_dis, "sysDisconnectionEvent", function()
        --scripts.character.info = gmcp.char.info
        if mc and chaosforge.discord_notifier == true and scripts.character.info["guild_lay"] == "Kultysci Chaosu" then
            mc.discord:send("#ogolny", " stracil polaczenie...")
        end
    end)

end


discord_login_notifier:init()