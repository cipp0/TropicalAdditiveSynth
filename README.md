# 🏝 Tropical Additive Synthesis
Additive synthesizer using tropical algebra in CsoundQT
[based on the work of Giorgio Sancristoforo and Cristiano Bocci](https://www.giorgiosancristoforo.net/Tropical/paper.pdf)

![plot](/tropical.png)

Additive synthesis equations are transformed using tropical addition (⊕) and tropical multiplication (⊗).
We are using :
a⊕b := min{a,b}
a⊗b := a+b

If we consider the sum of two waves : b[n] = a1*cos(ω1n) + a2*cos(ω2n), its tropicalization is simply : trop(b[n]) = a1⊗cos(ω1n) ⊕ a2⊗cos(ω2n) = min{a1 + cos(ω1n),a2 + cos(ω2n)}.

In this CSoundQT example the user can change many parameters:
- Central Frequency
- Oscillator Waveform
- Harmonic frequency multiplier factor for each oscillator
- Detune
- Amplitude
- Phase


## Cabbage Version for VST dev
![plot](/tropicabbage.png)
