CuttingRecordGenerator
----------------------
This program generates "Record" image from audio file. If you have laser cutter or paper cutting machine, you can  make your own "Record".  
  
This work is licensed under the Creative Commons Attribution-NonCommercial 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/3.0/.  
  
  
Usage
-----
0. If you don't have Processing IDE, download from here.  
  http://www.processing.org/  

1. Download Ess library.We need this to handle audio file(wav, aif, mp3).  
  http://www.tree-axis.com/Ess/download.html  

2. Extruct Ess_r2.zip and put it into Processing library directory.  
  Usually, ~/Documents/Processing/libraries/  

3. Download CuttingRecordGenerator_src.zip and extract.  
  https://github.com/mitsuhito/CuttingRecordGenerator/blob/master/CuttingRecordGenerator_src.zip?raw=true  

4. Open *CuttingRecordGenerator.pde* and just press *Run* button.  
  Make sure there is no error or exception, then the Ess library is working.  
  After drawing animation, sin_440hz_30sec_wav.svg will be created in data directory.  

  If you have some audio file, put it into data directory and change this line.  
    *CuttingRecordGenerator.pde @L31*  
     `String audioFilePath = "sin_440hz_30sec.wav";`  

5. Adjust parameters.  
  There are some output parameters.According to the need, change these values.

  ```
//
// Parameters for svg output
//
double recordDiameterMillimeter = 300;//170; // 170mm
double outputSamplingRate = 44100;//44100; // 44.1kHz
double rpm = 33; // 33rmp
double amplitudeMax = 0.2; // 0.2pt
double spaceOfEachLine = 2; // 2pt
double rInnerMarginMillimeter = 100; // 100mm
double rOuterMarginMillimeter = 5; // 5mm
double centerHoleDaiameterMillimeter = 7.24; // 7.24mm
double svgPathStrokeWidth = 0.001; // 0.001pt
// fabrication machine's dpi 
// i.e. Universal VLS 2.30 with HPDFO lends is 1000dpi
int dpi = 200; 
  ```
  <img alt="Cutting Record Params Diagram1" src="https://raw.github.com/mitsuhito/CuttingRecordGenerator/master/cuttingrecord_param_diagram1.png" width="640px"/>
  <img alt="Cutting Record Params Diagram2" src="https://raw.github.com/mitsuhito/CuttingRecordGenerator/master/cuttingrecord_param_diagram2.png" width="640px"/>
  
6. Cutting "Record" and play it!  
  If you have some digital fabrication tool such as laser cutter, paper cutting machine, you can try to make your own record. If you don't have it go to hacker space, fablab!  
  
  
What kind of sound made by laser cutter?
----------------------------------------
Please watch this video.  
<a href="http://vimeo.com/58682203" target="_blank">
<img src="http://b.vimeocdn.com/ts/407/464/407464338_640.jpg" 
alt="Laser Cut Record from jo kazuhiro"/></a>

More detail is here.  
 http://www.instructables.com/id/How-to-make-a-record-without-prior-acoustic-inform/  
  
  
SVG Examples
------------
It is possible take a look at some examples.  
  
1. 440Hz sine wave 30 seconds  

  | RPM | Output Sampling Rate | SVG |  
  |-----|----------------------|-----|  
  |33|44100|https://docs.google.com/file/d/0B2E9z6xmj32kdkYwcndVWlZNNmM/edit?usp=sharing|  
  |33|16000|https://docs.google.com/file/d/0B2E9z6xmj32kRDd3SEo1Y1pSV0U/edit?usp=sharing|  
  |33|8000|https://docs.google.com/file/d/0B2E9z6xmj32kUk9JNGkzWE16OWc/edit?usp=sharing|  
  |45|44100|https://docs.google.com/file/d/0B2E9z6xmj32kSlU1WHZHSlFwUnM/edit?usp=sharing|  
  |45|16000|https://docs.google.com/file/d/0B2E9z6xmj32keFQ5bUNyd1QxUkE/edit?usp=sharing|  
  |45|8000|https://docs.google.com/file/d/0B2E9z6xmj32kcFVsTEFFRmVwMnc/edit?usp=sharing|  
  
2. Drum n Bass Hit-Hat Conga Loop by RutgerMuller  
   http://www.freesound.org/people/RutgerMuller/sounds/51257/  

  | RPM | Output Sampling Rate | SVG |
  |-----|----------------------|-----|
  |33|44100|https://docs.google.com/file/d/0B2E9z6xmj32kZzI4Q2ZqSnhEV1k/edit?usp=sharing|
  |33|16000|https://docs.google.com/file/d/0B2E9z6xmj32keEgtQ1IwdDBJNTA/edit?usp=sharing|
  |33|8000|https://docs.google.com/file/d/0B2E9z6xmj32kMTlpTG4wZ1Nmd1k/edit?usp=sharing|
  |45|44100|https://docs.google.com/file/d/0B2E9z6xmj32kaDdLVVRsUmdvdUU/edit?usp=sharing|
  |45|16000|https://docs.google.com/file/d/0B2E9z6xmj32kdjhfRUVlaGRTck0/edit?usp=sharing|
  |45|8000|https://docs.google.com/file/d/0B2E9z6xmj32kZjVBaXptTGE3WWc/edit?usp=sharing|

3. 8-bit ElectroHouse by RutgerMuller  
   http://www.freesound.org/people/RutgerMuller/sounds/51239/  

  | RPM | Output Sampling Rate | SVG |
  |-----|----------------------|-----|
  |33|44100|https://docs.google.com/file/d/0B2E9z6xmj32kLVBUZ1d0bS1yZjA/edit?usp=sharing|
  |33|16000|https://docs.google.com/file/d/0B2E9z6xmj32kRFBLeEI4S29LVHc/edit?usp=sharing|
  |33|8000|https://docs.google.com/file/d/0B2E9z6xmj32kV3haUmJTcjJBcDQ/edit?usp=sharing|
  |45|44100|https://docs.google.com/file/d/0B2E9z6xmj32kUnN3djJvMUF3cjQ/edit?usp=sharing|
  |45|16000|https://docs.google.com/file/d/0B2E9z6xmj32kQ0Nad1E0OGMtbXc/edit?usp=sharing|
  |45|8000|https://docs.google.com/file/d/0B2E9z6xmj32kZks3SmJ0cHcwZ0k/edit?usp=sharing|

4. Roadrunner loop by zagi2  
   http://www.freesound.org/people/zagi2/sounds/185558/  

  | RPM | Output Sampling Rate | SVG |
  |-----|----------------------|-----|
  |33|44100|https://docs.google.com/file/d/0B2E9z6xmj32kc01rV29VMHN5N1k/edit?usp=sharing|
  |33|16000|https://docs.google.com/file/d/0B2E9z6xmj32kMVZPYVNFYXdYOXM/edit?usp=sharing|
  |33|8000|https://docs.google.com/file/d/0B2E9z6xmj32kUGR1cHhqZ3ZreHc/edit?usp=sharing|
  |45|44100|https://docs.google.com/file/d/0B2E9z6xmj32kX1pFY2gtUlQ2SWM/edit?usp=sharing|
  |45|16000|https://docs.google.com/file/d/0B2E9z6xmj32kUVhBak9yYXUwczQ/edit?usp=sharing|
  |45|8000|https://docs.google.com/file/d/0B2E9z6xmj32kTmRWcDVLMWVkcXM/edit?usp=sharing|
  
  
mitsuhito.ando@gmail.com  
