-- attemping to clone Fate by Geodesics
-- https://github.com/MarcBoule/Geodesics/blob/master/src/Fate.cpp
-- 
-- by saiiils

--[[ crow io:
        in1: trigger
        in2: cv in
        out1: trigger when event is modified
        out2: mod cv out 1
        out3: mod cv out 2
        out4: ?

]]
--[[ todo:
        16n integration to control free will and choice depth
        16n as step sequencer?
        integrate JF
]]

function init()
    input[1].mode('change', 1.0, 0.1, 'rising')
    input[2].mode('stream')
end

function process_stream(v)
    print("input stream: "..v)
end

crow.input[1].stream = process_stream
crow.input[1].model("stream", 0.1)