<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giSine ftgen 1, 0, 2^16+1, 10, 1  ;sinusoide 
giTriangle ftgen 2, 0, 2^16+1, 7,0,16384,1,32768,-1,16384,0   ;triangle
giSaw ftgen 3, 0,2^16+1, 7, 0., 0, 1., 2^16+1, -1., 0, 0. ;saw
giSquare ftgen 4,0,2^16+1, 7, 0., 0, 1., 32768, 1., 0, -1., 32768, -1., 0, 0. ;square



;instrument will be triggered by keyboard widget
instr 1
gkAmp1 invalue "amp"
gkAmp1 port gkAmp1, 0.02

gkTable1 invalue "table"
gkTable1 port gkTable1, 0.02

gkPhase1 invalue "phase"
gkPhase1 port gkPhase1, 0.02

gkFreq1 invalue "freq"
gkFreq1 port gkFreq1, 0.02




gkAmp2 invalue "amp2"
gkAmp2 port gkAmp2, 0.02

gkTable2 invalue "table2"
gkTable2 port gkTable2, 0.02

gkPhase2 invalue "phase2"
gkPhase2 port gkPhase2, 0.02

gkfreqmulti2 invalue "freqmulti2"
gkfreqmulti2 port gkfreqmulti2, 0.02

gkDetune2 invalue "detune2"
gkDetune2 port gkDetune2, 0.02


gkAmp3 invalue "amp3"
gkAmp3 port gkAmp3, 0.02

gkTable3 invalue "table3"
gkTable3 port gkTable3, 0.02

gkPhase3 invalue "phase3"
gkPhase3 port gkPhase3, 0.02

gkfreqmulti3 invalue "freqmulti3"
gkfreqmulti3 port gkfreqmulti3, 0.02

gkDetune3 invalue "detune3"
gkDetune3 port gkDetune3, 0.02


gkAmp4 invalue "amp4"
gkAmp4 port gkAmp4, 0.02

gkTable4 invalue "table4"
gkTable4 port gkTable4, 0.02

gkPhase4 invalue "phase4"
gkPhase4 port gkPhase4, 0.02

gkfreqmulti4 invalue "freqmulti4"
gkfreqmulti4 port gkfreqmulti4, 0.02

gkDetune4 invalue "detune4"
gkDetune4 port gkDetune4, 0.02

aosc1 osciliktp  gkFreq1, gkTable1, gkPhase1

aosc2 osciliktp  (gkFreq1*gkfreqmulti2)+gkDetune2, gkTable2, gkPhase2

amin min (aosc1+gkAmp1), (aosc2+gkAmp2)



aosc3 osciliktp  (gkFreq1*gkfreqmulti3)+gkDetune3, gkTable3, gkPhase3

amin1 min amin, (aosc3+gkAmp3)


aosc4 osciliktp  (gkFreq1*gkfreqmulti4)+gkDetune4, gkTable4, gkPhase4

amin2 min amin1, (aosc4+gkAmp4)


amin2 dcblock2 amin2 ;[, iorder] [, iskip]

outs amin2, amin2
endin
</CsInstruments>
<CsScore>
i1 0 [3600*24*7]
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>122</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>3</x>
  <y>5</y>
  <width>1053</width>
  <height>244</height>
  <uuid>{9dd8f706-4ae4-4c68-a877-6201f8c2a3e3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Tropical Additive Synthesis</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>30</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>amp</objectName>
  <x>20</x>
  <y>80</y>
  <width>20</width>
  <height>100</height>
  <uuid>{2437b55f-e014-4293-9020-ed0203ab7b19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>-1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>phase</objectName>
  <x>50</x>
  <y>80</y>
  <width>20</width>
  <height>100</height>
  <uuid>{82885dcd-cb74-48fd-9c64-9ebf1c06bb84}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.72000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>table</objectName>
  <x>85</x>
  <y>115</y>
  <width>42</width>
  <height>25</height>
  <uuid>{c0d3ddea-7418-4c61-9d36-991069cf7719}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>4</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>freq</objectName>
  <x>50</x>
  <y>220</y>
  <width>708</width>
  <height>24</height>
  <uuid>{7b4ad675-3c39-4555-845b-b2f204a1ba92}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>30.00000000</minimum>
  <maximum>440.00000000</maximum>
  <value>220.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>830</x>
  <y>65</y>
  <width>214</width>
  <height>173</height>
  <uuid>{cd6e192c-a276-4e6e-ba59-e6c701088658}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>85</x>
  <y>60</y>
  <width>77</width>
  <height>27</height>
  <uuid>{aeaa9f35-6129-488e-bfa8-9f45d634292f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OSC 1</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>15</x>
  <y>60</y>
  <width>33</width>
  <height>22</height>
  <uuid>{2a70c2c0-3a7a-424d-a8ee-72282ec9cd4a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>amp</objectName>
  <x>10</x>
  <y>180</y>
  <width>37</width>
  <height>24</height>
  <uuid>{f796a28a-fa06-4aed-92b9-583d3774d56c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>-1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>45</x>
  <y>60</y>
  <width>39</width>
  <height>22</height>
  <uuid>{d5cf31d6-a960-4767-b600-f9c9ef13d6c8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Phase</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>phase</objectName>
  <x>45</x>
  <y>180</y>
  <width>37</width>
  <height>24</height>
  <uuid>{8da12751-df17-4e02-bcc0-96ff17cc1ea3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.72000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>85</x>
  <y>95</y>
  <width>41</width>
  <height>22</height>
  <uuid>{6a0ea9af-a535-45e0-84bc-1bfef3f64ea2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Wave</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>85</x>
  <y>140</y>
  <width>65</width>
  <height>61</height>
  <uuid>{56afd8cb-da33-4a34-bd35-71c7e8d7fc82}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1 = sin
2 = tri
3 = saw
4 = square</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>amp2</objectName>
  <x>185</x>
  <y>80</y>
  <width>20</width>
  <height>100</height>
  <uuid>{8b2f23c0-8d07-411f-8c50-c4869afb858c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>phase2</objectName>
  <x>215</x>
  <y>80</y>
  <width>20</width>
  <height>100</height>
  <uuid>{581f72ae-8ad6-44e5-bbb1-2c3ed542be7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>table2</objectName>
  <x>285</x>
  <y>120</y>
  <width>42</width>
  <height>24</height>
  <uuid>{c7d8bc5e-fa14-4585-ab61-d4d80853f25d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>4</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>285</x>
  <y>65</y>
  <width>77</width>
  <height>27</height>
  <uuid>{7c58a4dc-c43e-4b85-8a54-1e2ac53be58f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OSC 2</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>180</x>
  <y>60</y>
  <width>33</width>
  <height>22</height>
  <uuid>{1eeb817a-9bd5-4a9a-b012-c0a13df8ba3e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>amp2</objectName>
  <x>175</x>
  <y>180</y>
  <width>37</width>
  <height>24</height>
  <uuid>{d68ea9f5-4cbe-4176-8281-ea9f3240eb34}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>210</x>
  <y>60</y>
  <width>39</width>
  <height>22</height>
  <uuid>{17ba2343-139d-43e7-8115-5d65a85f9ac4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Phase</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>phase2</objectName>
  <x>210</x>
  <y>180</y>
  <width>37</width>
  <height>24</height>
  <uuid>{dced9dd5-1a14-4c1a-9cde-54a347741198}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.36000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>285</x>
  <y>100</y>
  <width>41</width>
  <height>21</height>
  <uuid>{54dbd4ba-72a5-47c7-b8a7-a92b16c9df98}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Wave</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>285</x>
  <y>145</y>
  <width>65</width>
  <height>61</height>
  <uuid>{86cda686-595c-4bc5-9f3e-1b5775c05cdb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1 = sin
2 = tri
3 = saw
4 = square</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>amp3</objectName>
  <x>400</x>
  <y>85</y>
  <width>20</width>
  <height>100</height>
  <uuid>{2bbbd5f5-f7fb-46a9-b0c1-665fa5970593}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>phase3</objectName>
  <x>430</x>
  <y>85</y>
  <width>20</width>
  <height>100</height>
  <uuid>{a0de3bb6-cdaa-45cf-ba49-93045f7db432}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.86000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>510</x>
  <y>65</y>
  <width>77</width>
  <height>27</height>
  <uuid>{94fcad93-aba9-4b55-bd2d-63bcaed2642b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OSC 3</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>395</x>
  <y>65</y>
  <width>33</width>
  <height>22</height>
  <uuid>{c7d944f8-11c2-4f94-865c-6211965bca6c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>amp3</objectName>
  <x>390</x>
  <y>185</y>
  <width>37</width>
  <height>24</height>
  <uuid>{f497817f-bc88-4237-a989-6a3012744cd6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>425</x>
  <y>65</y>
  <width>39</width>
  <height>22</height>
  <uuid>{6bb26c40-0103-4d61-9504-9372a2d23888}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Phase</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>phase3</objectName>
  <x>425</x>
  <y>185</y>
  <width>37</width>
  <height>24</height>
  <uuid>{8cdcccf2-b63d-48db-b590-221397f793fd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.86000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>510</x>
  <y>145</y>
  <width>65</width>
  <height>61</height>
  <uuid>{2882fd33-668a-4fb8-a85a-583bcb352b61}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1 = sin
2 = tri
3 = saw
4 = square</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>amp4</objectName>
  <x>620</x>
  <y>85</y>
  <width>20</width>
  <height>100</height>
  <uuid>{70a9a2bf-2829-4598-946d-64654f7021f8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>phase4</objectName>
  <x>650</x>
  <y>85</y>
  <width>20</width>
  <height>100</height>
  <uuid>{1350505a-b31d-4f72-afa2-5e0033c3255e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>-0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>730</x>
  <y>65</y>
  <width>77</width>
  <height>27</height>
  <uuid>{5d7d7ef8-d2ff-4fd9-ac07-69decbb9e37d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OSC 4</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>615</x>
  <y>65</y>
  <width>33</width>
  <height>22</height>
  <uuid>{18a849a4-180c-4b4f-89b6-0889ebfe9143}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>amp4</objectName>
  <x>610</x>
  <y>185</y>
  <width>37</width>
  <height>24</height>
  <uuid>{52cb2aa2-19bf-458d-b593-6d330d134137}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>645</x>
  <y>65</y>
  <width>39</width>
  <height>22</height>
  <uuid>{d398027c-e4dd-4f29-b499-e0e5fada6c59}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Phase</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>phase4</objectName>
  <x>645</x>
  <y>185</y>
  <width>37</width>
  <height>24</height>
  <uuid>{8bc47064-d3cc-45c1-85fd-167f44651ad8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>-0.50000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-1.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>730</x>
  <y>145</y>
  <width>65</width>
  <height>61</height>
  <uuid>{b9a9bb50-4d80-4680-a124-4b0ca3696de7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1 = sin
2 = tri
3 = saw
4 = square</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>freq</objectName>
  <x>760</x>
  <y>215</y>
  <width>60</width>
  <height>25</height>
  <uuid>{a0ee3eeb-dc9f-4e82-b987-8d52ad98f04f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>220.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>30.00000000</minimum>
  <maximum>440.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>10</x>
  <y>215</y>
  <width>40</width>
  <height>21</height>
  <uuid>{fba20329-0352-4130-a519-2aeea55a89e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>freqmulti2</objectName>
  <x>330</x>
  <y>120</y>
  <width>42</width>
  <height>24</height>
  <uuid>{f9a632d9-f103-454c-9508-c1cbe678619f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.25000000</resolution>
  <minimum>0</minimum>
  <maximum>12</maximum>
  <randomizable group="0">false</randomizable>
  <value>2</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>330</x>
  <y>100</y>
  <width>41</width>
  <height>21</height>
  <uuid>{ab8b8a8c-ad1f-4b20-befc-6dbdb707b0aa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq*</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>table3</objectName>
  <x>510</x>
  <y>115</y>
  <width>42</width>
  <height>24</height>
  <uuid>{e86d622c-4098-4f5f-a18d-ac595934de36}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>4</maximum>
  <randomizable group="0">false</randomizable>
  <value>3</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>510</x>
  <y>95</y>
  <width>41</width>
  <height>21</height>
  <uuid>{521f6048-3dc7-4d55-a1c7-902d77e04586}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Wave</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>freqmulti3</objectName>
  <x>555</x>
  <y>115</y>
  <width>42</width>
  <height>24</height>
  <uuid>{a180ce17-9504-4d2c-a3bc-70cc39b5f4c7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.25000000</resolution>
  <minimum>0</minimum>
  <maximum>12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0.5</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>555</x>
  <y>95</y>
  <width>41</width>
  <height>21</height>
  <uuid>{3782cd71-68eb-4c64-854d-90e2a2c8b69b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq*</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>table4</objectName>
  <x>730</x>
  <y>115</y>
  <width>42</width>
  <height>24</height>
  <uuid>{286f1e67-2296-409e-95d4-9f8325fd50c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>4</maximum>
  <randomizable group="0">false</randomizable>
  <value>4</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>730</x>
  <y>95</y>
  <width>41</width>
  <height>21</height>
  <uuid>{98338abb-e1ae-40f0-95a2-904bd08fcd7a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Wave</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>freqmulti4</objectName>
  <x>775</x>
  <y>110</y>
  <width>42</width>
  <height>24</height>
  <uuid>{787e759a-6a46-4cd0-b359-746b5c9d17e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.25000000</resolution>
  <minimum>0</minimum>
  <maximum>12</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.75</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>775</x>
  <y>90</y>
  <width>41</width>
  <height>21</height>
  <uuid>{c5cdce9e-dae0-48fa-97fc-5583b2c83fc3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq*</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>detune4</objectName>
  <x>690</x>
  <y>85</y>
  <width>20</width>
  <height>100</height>
  <uuid>{740e43c5-d966-4bab-804c-cce684d55cc7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-12.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-4.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>685</x>
  <y>65</y>
  <width>43</width>
  <height>22</height>
  <uuid>{ba83fac3-8821-4bac-8f41-f8fa015d9bbd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Detune</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>detune4</objectName>
  <x>680</x>
  <y>185</y>
  <width>42</width>
  <height>25</height>
  <uuid>{904d1bfd-5200-4eb5-896d-9899072c77f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>-4.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-20.00000000</minimum>
  <maximum>20.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>detune3</objectName>
  <x>470</x>
  <y>85</y>
  <width>20</width>
  <height>100</height>
  <uuid>{6daa65b7-8816-4204-9899-0bfff42dd7a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-12.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>465</x>
  <y>65</y>
  <width>43</width>
  <height>22</height>
  <uuid>{94a05a3c-8396-4b80-bdbe-25d322018fb0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Detune</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>detune3</objectName>
  <x>460</x>
  <y>185</y>
  <width>42</width>
  <height>25</height>
  <uuid>{a3b7da21-bc5c-4079-b161-1f8eaf489185}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-20.00000000</minimum>
  <maximum>20.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>detune2</objectName>
  <x>255</x>
  <y>80</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e0123f36-e208-4d26-946c-30168eadb3d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-12.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>245</x>
  <y>60</y>
  <width>43</width>
  <height>22</height>
  <uuid>{a6e440ca-6a73-4ee5-8812-c7a4a46e07dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Detune</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScrollNumber">
  <objectName>detune2</objectName>
  <x>245</x>
  <y>180</y>
  <width>42</width>
  <height>25</height>
  <uuid>{7d807846-0c01-4168-a6ab-d47559813865}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-20.00000000</minimum>
  <maximum>20.00000000</maximum>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
