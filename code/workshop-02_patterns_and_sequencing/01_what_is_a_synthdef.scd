//////////////////////////////////////////////////
// 01 - WHAT IS A SYNTHDEF?
//////////////////////////////////////////////////

// Before we can make sound we need
// to define an instrument.
//
// In SuperCollider an instrument is
// called a SynthDef.
//
// Think of a SynthDef as a recipe.
//
// A SynthDef describes:
//
// • what sound to generate
// • how loud it is
// • how long it lasts
// • how it is processed
//
// Defining a SynthDef does NOT
// play any sound yet.

s.boot;

(
SynthDef(\saw, {

    arg freq=220, lpf=8000, amp=0.5, gate=1, atk=0.01, rel=1;

    var sig;
    var env;
    var detune;

    // Detune eight oscillators slightly

    detune = LFNoise1.kr(0.2!8)
        .bipolar(0.4)
        .midiratio;

    sig = Saw.ar(freq * detune);

    // Mix all oscillators

    sig = Mix(sig);

    // Lowpass filter

    sig = RLPF.ar(
        sig,
        lpf.clip(20, 19000)
    );

    // Envelope

    env = Env.perc(atk, rel)
        .kr(2, gate);

    sig = sig * env;
    sig = sig * amp;

    Out.ar(0, sig ! 2);

}).add;
)

//////////////////////////////////////////////////
// PLAY ONE NOTE
//////////////////////////////////////////////////

x = Synth(\saw);

//////////////////////////////////////////////////
// STOP IT
//////////////////////////////////////////////////

x.free;