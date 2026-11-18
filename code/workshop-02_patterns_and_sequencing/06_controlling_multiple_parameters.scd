//////////////////////////////////////////////////
// 06 - MULTIPLE PARAMETERS
//////////////////////////////////////////////////

// Patterns can control ANY parameter.

(
p = Pbind(

    \instrument,\saw,

    \freq,
    Prand(
        [110,220,330,440],
        inf
    ),

    \lpf,
    Pwhite(
        400,
        12000
    ),

    \dur,
    Prand(
        [0.25,0.5,1],
        inf
    ),

    \amp,0.2

).play;
)

//////////////////////////////////////////////////
// IMPORTANT
//////////////////////////////////////////////////

// Patterns are NOT limited
// to pitch.

//
// They can control:
//
// freq
// lpf
// amp
// atk
// rel
// dur
//
// and anything else
// inside the SynthDef.