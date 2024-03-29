<Cabbage>
form caption("Tropical Synth") size(550, 355), guiMode("queue"), pluginId("def1")
keyboard bounds(0, 258, 550, 95)
rslider bounds(2, 12, 60, 60) range(-1, 1, -1, 1, 0.001)channel("amp") text("Amp") textColour(255, 255, 255, 255)
rslider bounds(4, 96, 60, 60) range(1, 4, 1, 1, 1)channel("table") text("Table") textColour(255, 255, 255, 255)
rslider bounds(2, 178, 60, 60) range(-1, 1, 0, 1, 0.001)channel("phase") text("Phase") textColour(255, 255, 255, 255)

rslider bounds(90, 14, 60, 60) range(-1, 1, 1, 1, 0.001)channel("amp2") text("Amp2")  textColour(255, 255, 255, 255)
rslider bounds(150, 14, 60, 60) range(1, 4, 1, 1, 1)channel("table2") text("Table2") textColour(255, 255, 255, 255)
rslider bounds(210, 14, 60, 60) range(-1, 1, 0, 1, 0.001)channel("phase2") text("Phase2") textColour(255, 255, 255, 255)
rslider bounds(270, 14, 60, 60) range(-12, 12, 0, 1, 0.001)channel("detune2") text("Detune2") textColour(255, 255, 255, 255)

rslider bounds(90, 94, 60, 60) range(-1, 1, 1, 1, 0.001)channel("amp3") text("Amp3") textColour(255, 255, 255, 255)
rslider bounds(150, 94, 60, 60) range(1, 4, 1, 1, 1)channel("table3") text("Table3") textColour(255, 255, 255, 255)
rslider bounds(210, 94, 60, 60) range(-1, 1, 0, 1, 0.001)channel("phase3") text("Phase3") textColour(255, 255, 255, 255)
rslider bounds(270, 94, 60, 60) range(-12, 12, 0, 1, 0.001)channel("detune3") text("Detune3")textColour(255, 255, 255, 255)

rslider bounds(88, 172, 60, 60) range(-1, 1, 1, 1, 0.001)channel("amp4") text("Amp4") textColour(255, 255, 255, 255)
rslider bounds(148, 172, 60, 60) range(1, 4, 1, 1, 1)channel("table4") text("Table4")textColour(255, 255, 255, 255)
rslider bounds(208, 172, 60, 60) range(-1, 1, 0, 1, 0.001)channel("phase4") text("Phase4")textColour(255, 255, 255, 255)
rslider bounds(268, 172, 60, 60) range(-12, 12, 0, 1, 0.001)channel("detune4") text("Detune4")textColour(255, 255, 255, 255)


vslider bounds(450, 2, 70, 236) channel("mainvol") range(0, 1, 0.75, 1, 0.001) text("Main Volume")textColour(255, 255, 255, 255)

nslider bounds(336, 40, 102, 24) channel("freqmulti2") range(0, 12, 0, 1, 0.25)
label bounds(334, 194, 108, 14) channel("label10019") colour(255, 255, 255, 0) text("Freq multiplier") fontColour(255, 255, 255, 255)

nslider bounds(336, 120, 102, 24) channel("freqmulti3") range(0, 12, 0, 1, 0.25)
label bounds(334, 106, 108, 14) channel("label10029") colour(255, 255, 255, 0) text("Freq multiplier") fontColour(255, 255, 255, 255)

nslider bounds(336, 208, 102, 24) channel("freqmulti4") range(0, 12, 0, 1, 0.25)
label bounds(336, 26, 108, 14) channel("label100319") colour(255, 255, 255, 0) text("Freq multiplier") fontColour(255, 255, 255, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

;==========================   
;==== OSCILLATOR WAVES ==== 
;========================== 


giSine ftgen 1, 0, 2^16+1, 10, 1  ;sinusoide 
giTriangle ftgen 2, 0, 2^16+1, 7,0,16384,1,32768,-1,16384,0   ;triangle
giSaw ftgen 3, 0,2^16+1, 7, 0., 0, 1., 2^16+1, -1., 0, 0. ;saw
giSquare ftgen 4,0,2^16+1, 7, 0., 0, 1., 32768, 1., 0, -1., 32768, -1., 0, 0. ;square

instr 10

gkAmp1 cabbageGetValue "amp"
gkAmp1 port gkAmp1, 0.02

gkTable1 cabbageGetValue "table"
gkTable1 port gkTable1, 0.02

gkPhase1 cabbageGetValue "phase"
gkPhase1 port gkPhase1, 0.02

gkFreq1 cabbageGetValue "freq"
gkFreq1 port gkFreq1, 0.02


gkAmp2 cabbageGetValue "amp2"
gkAmp2 port gkAmp2, 0.02

gkTable2 cabbageGetValue "table2"
gkTable2 port gkTable2, 0.02

gkPhase2 cabbageGetValue "phase2"
gkPhase2 port gkPhase2, 0.02

gkfreqmulti2 cabbageGetValue "freqmulti2"
gkfreqmulti2 port gkfreqmulti2, 0.02

gkDetune2 cabbageGetValue "detune2"
gkDetune2 port gkDetune2, 0.02


gkAmp3 cabbageGetValue "amp3"
gkAmp3 port gkAmp3, 0.02

gkTable3 cabbageGetValue "table3"
gkTable3 port gkTable3, 0.02

gkPhase3 cabbageGetValue "phase3"
gkPhase3 port gkPhase3, 0.02

gkfreqmulti3 cabbageGetValue "freqmulti3"
gkfreqmulti3 port gkfreqmulti3, 0.02

gkDetune3 cabbageGetValue "detune3"
gkDetune3 port gkDetune3, 0.02


gkAmp4 cabbageGetValue "amp4"
gkAmp4 port gkAmp4, 0.02

gkTable4 cabbageGetValue "table4"
gkTable4 port gkTable4, 0.02

gkPhase4 cabbageGetValue "phase4"
gkPhase4 port gkPhase4, 0.02

gkfreqmulti4 cabbageGetValue "freqmulti4"
gkfreqmulti4 port gkfreqmulti4, 0.02

gkDetune4 cabbageGetValue "detune4"
gkDetune4 port gkDetune4, 0.02

gkMainVol cabbageGetValue "mainvol"
gkMainVol port gkMainVol, 0.02
endin

;instrument will be triggered by keyboard widget
instr 1


aosc1 osciliktp  p4, gkTable1, gkPhase1

aosc2 osciliktp  (p4*gkfreqmulti2)+gkDetune2, gkTable2, gkPhase2

amin min (aosc1+gkAmp1), (aosc2+gkAmp2)



aosc3 osciliktp  (p4*gkfreqmulti3)+gkDetune3, gkTable3, gkPhase3

amin1 min amin, (aosc3+gkAmp3)


aosc4 osciliktp  (p4*gkfreqmulti4)+gkDetune4, gkTable4, gkPhase4

amin2 min amin1, (aosc4+gkAmp4)


amin2 dcblock2 amin2 ;[, iorder] [, iskip]

kenv madsr 0.05, 0.1, 1, 0.1
outs amin2*gkMainVol*kenv, amin2*gkMainVol*kenv
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
i10 0 [3600*24*7]
</CsScore>
</CsoundSynthesizer>
