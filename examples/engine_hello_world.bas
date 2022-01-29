#include "miniaudio.bi"

function engine_main() as integer
    dim as ma_result result
    dim as ma_engine engine
    dim as string input_file

    input_file = command(1)
    if(len(input_file) = 0) then
        print "No input file."
        return -1
    end if

    result = ma_engine_init(0, @engine)
    if(result <> MA_SUCCESS) then
        print "Failed to initialize audio engine."
        return -1
    end if

    ma_engine_play_sound(@engine, input_file, 0)

    print "Press any key to exit"
    sleep

    ma_engine_uninit(@engine)

    return 0
end function

end engine_main()
