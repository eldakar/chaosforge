chaosforge = chaosforge or {}

function chaosforge:help()
    cecho("⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀                    /fm - odnajdywanie mapy, wyswietlanie magikow\n")
    cecho("⠀⠀⠀⢀⣴⣾⣦⣀⣀⣠⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀               dodawania lokacji\n")
    cecho("⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣧⠀    chaos         /ar - informacje o arce, podpowiedzi w skrzyni\n")
    cecho("   ⢀⣾⣿⡿⠋⠁⠈⠙⢿⣿⣷⣶⣶⡆ forge               uproszczenie elementow walki\n")
    cecho("⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  /hp - obsluga dopalaczy, wyswietlanie lampy\n")
    cecho("⠀⠘⠛⠛⠻⣿⣷⣤⣀⣀⣴⣿⣿⠏⢀⣀⠀⠀⠀⠀⣾⣿⣿⡇⠀⠀⠀⠀⣀⠀        opisywanie uzywanych ziol\n")
    cecho("⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⢿⣿⣿⣷⣿⣿⣧⠀⣀⣀⣿⣿⣿⣇⣀⡀⠀⣼⣿⠀  /gh - odmozdzajace zaslony, wyswietlanie celow\n")
    cecho("⠀⠀⠀⠀⠸⠿⣿⡿⠀⠀⠀⠻⠿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀        \n")
    cecho("⠀⠀⠀⠀⠀⠀⠀⠁⢀⣴⣤⣀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀  /cf - opis do wszystkich ustawien /cset\n")
end

function chaosforge:debug_print(module, text)
    cecho(" ⚙  <grey>[<magenta>" .. module .. "<grey>] " .. text .. "\n")
end

function chaosforge:config_cheatsheet()
    cecho("=== ⚙  ==============================================================\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.longs"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(chaosforge.longs)),1,10) .. "<reset>")
    cecho(" - czy wyswietlac dlugi opis lokacji jako okno\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.replacements"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(chaosforge.replacements)),1,10) .. "<reset>")
    cecho(" - usuwanie linii dookola tekstu zaslon <red>(restart)<reset>\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.item_hints"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(chaosforge.item_hints)),1,10) .. "<reset>")
    cecho(" - wyswietlaj podpowiedzi do przedmiotow <red>(restart)<reset>\n")

    cecho(" " .. string.sub(string.format("%-40s", "arkadia_findme.highlight_current_room"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(arkadia_findme.highlight_current_room)),1,10) .. "<reset>")
    cecho(" - czy kolorowac slady na mapce\n")

    cecho(" " .. string.sub(string.format("%-40s", "arkadia_findme.debug_enabled"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(arkadia_findme.debug_enabled)),1,10) .. "<reset>")
    cecho(" - wyswietlaj wyniki wyszukiwania pokojow\n")

    cecho(" " .. string.sub(string.format("%-40s", "arkadia_findme.search_depth"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(arkadia_findme.search_depth)),1,10) .. "<reset>")
    cecho(" - okresla jak gleboko w bazie szukac pokoju\n")

    cecho(" " .. string.sub(string.format("%-40s", "arkadia_findme.contributor_name"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(arkadia_findme.contributor_name)),1,10) .. "<reset>")
    cecho(" - ustawia nick kontrybutora bazy pokojow\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.replace_consumption"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(chaosforge.replace_consumption)),1,10) .. "<reset>")
    cecho(" - rozszerzony tekst zazycia ziola na opis efektu\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.buffbar_enabled"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(chaosforge.buffbar_enabled)),1,10) .. "<reset>")
    cecho(" - wyswietlam pasek sterydow\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.buffbar_position"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(chaosforge.buffbar_position)),1,10) .. "<reset>")
    cecho(" - umiejscowienie paska sterydow\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.respect_attack_flag"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.respect_attack_flag)),1,10) .. "<reset>")
    cecho(" - uzywaj flag AWR przy inteligetnych zaslonach\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.cooldown_lock"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.cooldown_lock)),1,10) .. "<reset>")
    cecho(" - blokuj wyslanie komendy zaslony w czasie cooldownu\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.show_suggested_target"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.show_suggested_target)),1,10) .. "<reset>")
    cecho(" - zaznacz sugerowany cel obrony w kondycjach\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.show_most_wounded"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.show_most_wounded)),1,10) .. "<reset>")
    cecho(" - zaznacz najbardziej poranionego w kondycjach\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.show_most_attacked"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.show_most_attacked)),1,10) .. "<reset>")
    cecho(" - zaznacz najbardziej atakowanego w kondycjach\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.show_guard_status"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.show_guard_status)),1,10) .. "<reset>")
    cecho(" - wyswietlaj animacje cooldownu zaslony\n")

    cecho(" " .. string.sub(string.format("%-40s", "guardhelper.targeted_guards"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.targeted_guards)),1,10) .. "<reset>")
    cecho(" - wlacz obsluge zawodow SC i MC\n")

    cecho(" " .. string.sub(string.format("%-40s", "chaosforge.states_in_prompt"),1,40) .. " " .. "<magenta>" .. string.sub(string.format("%-10s", tostring(guardhelper.states_in_prompt)),1,10) .. "<reset>")
    cecho(" - przenies opisy kondycji do paska dolnego <red>(restart)<reset>\n")


end

return {
    "longdesc_label"
}
