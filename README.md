CuttingRecordGenerator
----------------------
This program generates "Record" image from audio file. If you have laser cutter or paper cutting machine, you can  make your own "Record".  
  
This work is licensed under the Creative Commons Attribution-NonCommercial 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/3.0/.  
  
  
Usage
-----
0. If you don't have Processing IDE, download from here.  
  http://www.processing.org/  

1. Download Ess library.  
  http://www.tree-axis.com/Ess/download.html  

2. Extruct Ess_r2.zip and put it into Processing library directory.  
  Usually, ~/Documents/Processing/libraries/  

3. Download CuttingRecordGenerator_src.zip and extract.  
  https://github.com/mitsuhito/CuttingRecordGenerator/blob/master/CuttingRecordGenerator_src.zip  

4. Open *CuttingRecordGenerator.pde* and just press *Run* button.  
  Make sure there is no error or exception, then the Ess library is working.  
  After drawing animation, sin_440hz_30sec_wav.svg will be created in data directory.  

  If you have some audio file, put it into data directory and change this line.  
    *CuttingRecordGenerator.pde @L31*  
     `String audioFilePath = "sin_440hz_30sec.wav";`  

5. Cutting "Record" and play it!  
  If you have some digital fabrication tool such as laser cutter, paper cutting machine, you can try to make your own record. If you don't have it go to hacker space, fablab!  
  
  
What kind of sound made by laser cutter?
----------------------------------------
Please watch this video.  
<iframe src="http://player.vimeo.com/video/58682203" width="640" height="360" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe> <p><a href="http://vimeo.com/58682203">Laser Cut Record</a> from <a href="http://vimeo.com/user638795">jo kazuhiro</a> on <a href="http://vimeo.com">Vimeo</a>.</p>

More detail is here.  
 http://www.instructables.com/id/How-to-make-a-record-without-prior-acoustic-inform/  
  
  
SVG Examples
------------
It is possible take a look at some examples.  
  
1. 440Hz sine wave 30 seconds  
  SVGs:

  | Name | RPM | Output Sampling Rate | Wav | SVG |
  |------|-----|----------------------|-----|-----|
  |440Hz|33|44100| - |https://docs.google.com/file/d/0B2E9z6xmj32kdkYwcndVWlZNNmM/edit?usp=sharing|

  * 33 RPM  
  *  * Sampling Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kdkYwcndVWlZNNmM/edit?usp=sharing  
  *  * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32kRDd3SEo1Y1pSV0U/edit?usp=sharing  
  *  * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kUk9JNGkzWE16OWc/edit?usp=sharing  
  * 45 RPM  
  *  * Sampling Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kSlU1WHZHSlFwUnM/edit?usp=sharing  
  *  * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32keFQ5bUNyd1QxUkE/edit?usp=sharing  
  *  * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kcFVsTEFFRmVwMnc/edit?usp=sharing  
  
  
2. Drum n Bass Hit-Hat Conga Loop by RutgerMuller  
  Wav: http://www.freesound.org/people/RutgerMuller/sounds/51257/  
  SVGs:
  * 33 RPM  
    * Sampling	Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kZzI4Q2ZqSnhEV1k/edit?usp=sharing  
    * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32keEgtQ1IwdDBJNTA/edit?usp=sharing  
    * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kMTlpTG4wZ1Nmd1k/edit?usp=sharing    
  * 45 RPM  
    * Sampling Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kaDdLVVRsUmdvdUU/edit?usp=sharing  
    * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32kdjhfRUVlaGRTck0/edit?usp=sharing  
    * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kZjVBaXptTGE3WWc/edit?usp=sharing  
  
  
3. 8-bit ElectroHouse by RutgerMuller  
  Wav: http://www.freesound.org/people/RutgerMuller/sounds/51239/  
  SVGs:
  * 33 RPM  
    * Sampling Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kLVBUZ1d0bS1yZjA/edit?usp=sharing  
    * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32kRFBLeEI4S29LVHc/edit?usp=sharing  
    * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kV3haUmJTcjJBcDQ/edit?usp=sharing  
  * 45 RPM  
    * Sampling Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kUnN3djJvMUF3cjQ/edit?usp=sharing  
    * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32kQ0Nad1E0OGMtbXc/edit?usp=sharing  
    * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kZks3SmJ0cHcwZ0k/edit?usp=sharing  
  
  
4. Roadrunner loop by zagi2  
  Wav: http://www.freesound.org/people/zagi2/sounds/185558/  
  SVGs:
  * 33 RPM  
    * Sampling Rate: 44100Hz |	https://docs.google.com/file/d/0B2E9z6xmj32kc01rV29VMHN5N1k/edit?usp=sharing  
    * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32kMVZPYVNFYXdYOXM/edit?usp=sharing  
    * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kUGR1cHhqZ3ZreHc/edit?usp=sharing  
  * 45 RPM  
    * Sampling Rate: 44100Hz | https://docs.google.com/file/d/0B2E9z6xmj32kX1pFY2gtUlQ2SWM/edit?usp=sharing  
    * Sampling Rate: 16000Hz | https://docs.google.com/file/d/0B2E9z6xmj32kUVhBak9yYXUwczQ/edit?usp=sharing  
    * Sampling Rate: 8000Hz  | https://docs.google.com/file/d/0B2E9z6xmj32kTmRWcDVLMWVkcXM/edit?usp=sharing  
  
  
mitsuhito.ando@gmail.com  
