soundsense = soundsense or {}

soundsense.soundtable = {
    ["walka"] = {
        ["zadane"] = {
            ["cios"] = "sounds/walka_zadane_1.mp3",
            ["finish"] = "sounds/walka_zadane_2.mp3",
        },
        ["uniki"] = {
            ["unik"] = "sounds/walka_uniki_1.mp3",
            ["pudlo"] = "sounds/walka_uniki_2.mp3",
        },
        ["parowanie"] = {
            ["bron"] = "sounds/walka_parowanie_1.mp3",
            ["zbroja"] = "sounds/walka_parowanie_2.mp3",
            ["tarcza"] = "sounds/walka_parowanie_3.mp3",
        }
    },
    ["env"] = {
        ["deszcz"] = "sounds/deszcz.mp3",
        ["burza"] = "sounds/burza.mp3",
        ["wiatr"] = "sounds/wiatr.mp3",
    }
}

local sound_map = {
    ["ledwo muskasz"] = soundsense.soundtable["walka"]["zadane"]["1"],
    ["uuu wieje wiatr"] = soundsense.soundtable["env"]["wiatr"]
}

function soundsense.play_sound(sound)
    if not sound then
        return
    end
    playSoundFileplaySoundFile(
        sound -- name
        , 75 -- volume
        , nil -- fadein
        , nil -- fadeout
        , nil -- start
        , 25 -- priority
        , "" -- url
        , nil -- finish
    )
end