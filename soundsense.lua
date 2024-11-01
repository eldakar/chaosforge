soundsense = soundsense or {}

soundsense.soundtable = {
    ["walka"] = {
        ["zadane"] = {
            ["cios"] = "sounds/finish.wav",
            ["finish"] = "sounds/finish.wav",
            ["spec"] = "sounds/spec.wav",
        },
        ["uniki"] = {
            ["unik"] = "sounds/dodge.wav",
            ["pudlo"] = "sounds/miss.wav",
        },
        ["parowanie"] = {
            ["bron"] = "sounds/parry.ogg",

        }
    },
    ["env"] = {
        ["deszcz"] = "sounds/deszcz.mp3",
        ["burza"] = "sounds/burza.mp3",
        ["wiatr"] = "sounds/wiatr.mp3",
    }
}

function soundsense.play_sound(sound)
    playSoundFile(sound)
end