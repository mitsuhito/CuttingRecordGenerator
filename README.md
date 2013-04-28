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
  After drawing animation, sin_440hz_124sec_wav.svg will be created in data directory.  

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

 Drum n Bass Hit-Hat Conga Loop by RutgerMuller  
  Wav: http://www.freesound.org/people/RutgerMuller/sounds/51257/  
  SVG: https://github.com/mitsuhito/CuttingRecordGenerator/raw/master/examples/rutgermuller_drum_n_bass_hi_hat_conga_loop_44100hz.svg  

 8-bit ElectroHouse by RutgerMuller  
  Wav: http://www.freesound.org/people/RutgerMuller/sounds/51239/  
  SVG: https://github.com/mitsuhito/CuttingRecordGenerator/raw/master/examples/rutgermuller_8_bit_electrohouse_44100hz.svg  

 Roadrunner loop by zagi2  
  Wav: http://www.freesound.org/people/zagi2/sounds/185558/  
  SVG: https://github.com/mitsuhito/CuttingRecordGenerator/raw/master/examples/zagi2_roadrunner_loop_44100hz.svg  
  
  
  
mitsuhito.ando@gmail.com  
