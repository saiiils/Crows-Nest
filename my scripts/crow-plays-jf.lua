--- crow plays jf
-- crow remembers songs
-- jf sings songs
-- 
-- in 1: trigger to advance playhead
-- in 2: 
-- outs: none planned
-- i2c crow-jf

seq = sequins{0,0,0,0,0,0,0,0}:map(function(n) return n/12 end)

function init()

    input[1].mode('change')
    ii.jf.mode(1) -- set jf to synth mode
    
end

function getNotes()
    for i = 1, 8 do
        seq[i] = ii.faders.get(i + 8) - 3
    end
end

input[1].change = function()
    ii.jf.play_note(sequence[playhead], 5.0)
end