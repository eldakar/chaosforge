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

return {
    "longdesc_label"
}
