malleus_cobolorum = malleus_cobolorum or {
}

function malleus_cobolorum:init()
    self.dimension = 220
    self.label = Geyser.Label:new({
        name = "malleusLabel",
        x = -self.dimension - 30,
        y = 5,
        width = self.dimension, height = 120,
        fontSize = 30
      })

    self.label:setStyleSheet([[
        background-color: rgba(0,0,0,80);
        border: 0px solid;
        font: bold;
        font-family: ]] .. getFont() .. [[
    ]])

    self.labelclock = Geyser.Label:new({
        name = "malleusClock",
        x = self.dimension + 50,
        y = 5,
        width = self.dimension+40, height = self.dimension/3,
        fontSize = 30
      })

    self.labelclock:setStyleSheet([[
        background-color: rgba(0,0,0,80);
        border: 0px solid;
        font: bold;
        font-family: ]] .. getFont() .. [[
    ]])

    self.labellife = Geyser.Label:new({
        name = "malleusLife",
        x = 10,
        y = 5,
        width = self.dimension, height = self.dimension/3,
        fontSize = 30
      })

    self.labellife:setStyleSheet([[
        background-color: rgba(0,0,0,80);
        border: 0px solid;
        font: bold;
        font-family: ]] .. getFont() .. [[
    ]])
--    background: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #20f041, stop: 0.1 #40f029, stop: 0.49 #66cc00, stop: 0.5 #52a300, stop: 1 #66cc00);
--    background-color: rgba(0,100,0,50%);
 --   border: 10px solid #888833;
 --   border-style: outset;
 --   border-radius: 10px;
 --   border-bottom-right-radius: 30px;
 --   border-top-left-radius: 30px;
 --   border-left-color: #ffff00;

    self.label:hide()
    self.labelclock:hide()
    self.labellife:hide()


    self.handler_data  = scripts.event_register:register_singleton_event_handler(self.handler_data, "amapCompassDrawingDone", function() self:hunt() end)

end

---- get and store the timer ID in the global "greeting_timer_id" variable
--greeting_timer_id = tempTimer(2, [[ echo("hello!\n") ]])

-- delete the timer - thus nothing will actually happen!
--killTimer(greeting_timer_id)

function malleus_cobolorum:hunt()
    if amap.curr.id == 7161 or amap.curr.id == 6945 or amap.curr.id == 6938 then
        self:hide()
        return
    end
    if amap.curr.id == 11216 then
        self:show("snotlinga", "👿")
        return
    end
    if amap.curr.id == 6941 then
        self:show("goblina", "👾")
        return
    end

end

function malleus_cobolorum:show(mobtype, mobsymbol)
    self.mobtype = mobtype
    self.mobsymbol = mobsymbol

    self.label:show()
    self.labelclock:show()
    self.labellife:show()
    --self.timer_id = tempTimer(2, [[ malleus_cobolorum:start() ]])
end

function malleus_cobolorum:start()
    self:showcount()
    self:showclock()
    self:showlife()
end

function malleus_cobolorum:showcount()
    self.label:echo(self:getMobData(self.mobtype, self.mobsymbol))
end

function malleus_cobolorum:showclock()
    self.labelclock:echo("<center><pre>🕛" .. malleus_cobolorum:getLastImprove())
end

function malleus_cobolorum:showlife()
    self.labellife:echo("<pre>🧡" .. "<font color='red'> x " .. ateam.objs[ateam.my_id].hp)
end

function malleus_cobolorum:getMobData(key, mobsymbol)
    local mobtype = misc.counter.utils:get_entry_key(key)
    if not mobsymbol then
        mobsymbol = "a"
    end
    if not scripts.character_name then
        scripts:print_log("Korzystanie z bazy zabitych po ustawieniu 'scripts.character_name' w configu")
        return ""
    end
    local sql_query = "SELECT * FROM counter2_daysum WHERE character=\"" .. scripts.character_name .. "\" AND type!=\"all\" ORDER BY _row_id ASC"
    local retrieved = db:fetch_sql(misc.counter2.db_daysum.counter2_daysum, sql_query)
    local count_dict = {}

    for k, v in pairs(retrieved) do
        if not count_dict[v["type"]] then
            count_dict[v["type"]] = 0
        end
        count_dict[v["type"]] = count_dict[v["type"]] + tonumber(v["amount"])
    end

    chaosforge:debug_print("expo", "Zabiles <red>" .. mobtype .. "<reset>. Globalnie <green>" .. count_dict[mobtype] .. "<reset>")
    chaosforge:debug_print("expo", malleus_cobolorum:getLastImprove())
    --print("mobtype:" .. mobtype .. " volume:" .. )


    if misc.counter.killed["JA"] and misc.counter.killed["JA"][mobtype] then
        current_amount_value = misc.counter.killed["JA"][mobtype]
    else
        current_amount_value = 0
    end

 --   local curramount = string.sub(tostring(current_amount_value) .. "   ",1 , 4)
  --  local ret = "<pre><font color='gray'>" .. mobsymbol .. "<font color='green'> x " .. curramount
--    ret = ret .. "\n🥇 x " .. misc.improve.current_improve_level .. "</pre>"
  --  return ret
end

function malleus_cobolorum:getLastImprove()
    local time = getTime(true, "dd/MM hh:mm:ss")
    local average = misc.improve:calculate_average()
    local average_str = "             "
    if average > 0 then
        average_str = " : sred " .. misc.improve:seconds_to_formatted_string(average)
    end

    local today = string.split(getTime(true, "yyyy MM dd"), " ")
    local sql_query = "SELECT val FROM improvee WHERE character='" .. scripts.character_name .. "' and year = "..today[1].." and month = "..today[2].." and day = "..today[3].." ORDER BY _row_id ASC"
    local retrieved = db:fetch_sql(misc.improve.db_improvee.improvee, sql_query)
    local value = table.size(retrieved) > 0 and retrieved[1]["val"] or 0

    local sum_me_killed = 0
    local sum_all_killed = 0
    local last_time_stamp = misc.improve["improve_start_timestamp"]

    for k, v in pairs(misc.improve["level_snapshots"]) do
        local when_got = string.sub(v["time"] .. "                    ", 1, 18)
        sum_me_killed = v["me_killed"]
        sum_all_killed = v["all_killed"]

        -- fix timestamp if /expstart was used
        if k > 1 and misc.improve.level_snapshots[k]["timestamp"] < misc.improve.level_snapshots[k - 1]["timestamp"] then
            misc.improve.level_snapshots[k]["timestamp"] = misc.improve.level_snapshots[k - 1]["timestamp"] + misc.improve.level_snapshots[k]["timestamp"]
        end

        last_time_stamp = v.timestamp
        local time_str = v["time_passed"]

        local killed_str = nil
        if k == 1 then
            killed_str = tostring(v["me_killed"]) .. "/" .. tostring(v["all_killed"])
        else
            killed_str = tostring(v["me_killed"] - misc.improve.level_snapshots[k - 1]["me_killed"]) .. "/" .. tostring(v["all_killed"] - misc.improve.level_snapshots[k - 1]["all_killed"])
        end

--        local name = string.sub(misc.improve["levels"][v["level"]] .. "                ", 1, 16)
--        local sep = ": "
--        local details_time = string.sub("czas " .. time_str .. "                ", 1, 14)
--        local details_killed = string.sub(" zabici " .. killed_str .. "                ", 1, 14)
    end

    local since_last_str = "";
--    if last_time_stamp then
 --       local seconds_since_last = getEpoch() - last_time_stamp
  --      since_last_str = string.format("%s",misc.improve:seconds_to_formatted_string(seconds_since_last))
   -- end

    if last_time_stamp then
        local seconds_since_last = getEpoch() - last_time_stamp
        since_last_str = string.format("Od postepu: <medium_purple>%s<reset> : zabici: <red>%s<reset>/<hot_pink>%s<reset>.",
                misc.improve:seconds_to_formatted_string(seconds_since_last),
                tostring(misc.counter.killed_amount["JA"] - sum_me_killed),
                tostring(misc.counter.all_kills - sum_all_killed))
    end

    return since_last_str
end

-- trigger_func_skrypty_misc_counter_Zabiles
--<string>^(Zabil(es|as) ([A-Za-z ]+))\.$</string>

--trigger_func_skrypty_ui_gags_color_color_other_zabiles_color()
--<string>(^[ &gt;]*(Zabil(?:es|as|)) (?'target'[a-zA-Z (),!]+)\.$)</string>



function malleus_cobolorum:hide()
    self.label:hide()
    self.labelclock:hide()
    self.labellife:hide()

    --killTimer(self.timer_id)
end

malleus_cobolorum:init()
