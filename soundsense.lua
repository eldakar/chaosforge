soundsense = soundsense or {}

soundsense.soundtable = {
    ["walka"] = {
        ["zadane"] = {
            ["cios"] = "sounds/hit.mp3",
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