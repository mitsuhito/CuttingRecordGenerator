/**
 * CuttingRecordGenerator.pde - Mitsuhito Ando, 2013
 * mitsuhito.ando@gmail.com
 *
 * Create "Record" as svg image from audio file.
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial 3.0 Unported License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/3.0/.
 *
 */

import java.io.*;
import krister.Ess.*; // http://www.tree-axis.com/Ess

//
// Parameters for svg output
//
float recordDiameterMillimeter = 170; // 170mm
float outputSamplingRate = 44100; // 44.1kHz
float rpm = 33; // 33rmp
float amplitudeMax = 0.2; // 0.2pt
float spaceOfEachLine = 2; // 2pt
float rInnerMarginMillimeter = 100; // 100mm
float rOuterMarginMillimeter = 5; // 5mm
float centerHoleDaiameterMillimeter = 7.24; // 7.24mm
float svgPathStrokeWidth = 0.01; // 0.01pt

// 
// Audio file path
//
String audioFilePath = "sin_440hz_30sec.wav";
//String audioFilePath = "rutgermuller_8_bit_electrohouse.wav";
//String audioFilePath = "rutgermuller_drum_n_bass_hi_hat_conga_loop.wav";
//String audioFilePath = "zagi2_roadrunner_loop.wav";


// For drawing animation
SpiralwaveformGeneratorThread generatorThread = new SpiralwaveformGeneratorThread();

// Thread class for drawing animation
class SpiralwaveformGeneratorThread extends Thread {
  boolean running;
  int wait;
  File file;
  SVG svg;
  boolean svgCompression = false;
  float x = 0;
  float y = 0;
  float previousX = 0;
  float previousY = 0;

  SpiralwaveformGeneratorThread() {
    System.out.println("SpiralwaveformGeneratorThread is created.");
  }

  // Generate spiral waveform from audio file (wav,aif,mp3)
  void run() {
    while (running) {
      generate(file);
      running = false;
    }
    System.out.println("SpiralwaveformGeneratorThread::run() is done.");
  }

  void quit() {
    System.out.println("Quitting.");
    running = false;
    interrupt();
    super.stop();
  }

  void start(File f) {
    System.out.println("SpiralwaveformGeneratorThread::start(File f) is called.");
    file = f;
    running = true;
    super.start();
  }

  // Generate spiral waveform from audio file (wav,aif,mp3) @16bit.
  // TODO: Support multi channel.
  void generate(File f) {
    float a = 360 / (outputSamplingRate * (60/rpm));
    println("generate():: a:" + a);
    float aRad = a*((float)Math.PI/180);
    float r = 0;
    float theta = 0;
  
    float x = 0;
    float y = 0;
  
    long i = 0;
  
    String svgOutputPath = f.getParent()+"/"+(f.getName().replace(".", "_"));
    svg = new SVG(600, 600);
    svg.open(svgOutputPath+".svg");
  
    // Convert from millimeter to point 
    r = (recordDiameterMillimeter/2) / 0.3527777;
  
    r = r - (rOuterMarginMillimeter / 0.3527777);
  
    x = r*cos(theta) + width/2;
    y = r*sin(theta) + height/2;
  
    svg.write("<circle fill='none' stroke='#ff0000' stroke-width='"+svgPathStrokeWidth+"pt' cx='"+width/2+"' cy='"+height/2+"' r='"+recordDiameterMillimeter/2+"mm'/>\n");
    svg.write("<circle fill='none' stroke='#ff0000' stroke-width='"+svgPathStrokeWidth+"pt' cx='"+width/2+"' cy='"+height/2+"' r='"+centerHoleDaiameterMillimeter/2+"mm'/>\n");  
    svg.write("<g>\n");
    svg.write("<path fill='none' ");
    svg.write("stroke='#0000ff' stroke-width='"+svgPathStrokeWidth+"pt' ");
    svg.write("d='M"+ x +","+ y +" L"+x+","+y +" ");
  
  
    AudioStream audioStream;
    AudioFile audioFile;
  
    audioFile = new AudioFile(f.getAbsolutePath(), 0, Ess.READ);
    println("Imported Audio File Sampling Rate: " + audioFile.sampleRate);
    println("Output Sampling Rate: " + outputSamplingRate);
    
    audioStream = new AudioStream(20);
    audioStream.sampleRate(outputSamplingRate);

    float amp = 0.0;
    int samplesRead;
    int totalSamples = 0;
    int lastPosMs = 0;

    do
    {
      strokeWeight(0.1);
      stroke(0, 0, 0);
      noFill();

      // Read frames into buffer
      samplesRead = audioFile.read(audioStream);
      totalSamples += samplesRead;
      
      for (int s=0; s<audioStream.size; s++)
      {
        if (r > centerHoleDaiameterMillimeter + rInnerMarginMillimeter) {
          previousX = x;
          previousY = y;
          amp = map(audioStream.buffer[s], -1, 1, amplitudeMax*-1, amplitudeMax);
          x = (r + amp)*cos(theta) + width/2;
          y = (r + amp)*sin(theta) + height/2;          
          // Write out a point
          svg.write(x + "," + y + " ");

          // Draw preview line
          if (i%5 == 0) {
            //point(x, y); // Draw point on window
            line(previousX, previousY, x, y);
          }

          int currentPosMs = audioStream.ms(totalSamples)/1000;
          if (currentPosMs != lastPosMs) {
            fill(255);
            noStroke();
            float _r = centerHoleDaiameterMillimeter + rInnerMarginMillimeter;
            rect(width/2 - sqrt(_r*_r + _r*_r)/2, height/2 - sqrt(_r*_r + _r*_r)/2, sqrt(_r*_r + _r*_r), sqrt(_r*_r + _r*_r));
            fill(0);
            textAlign(CENTER);
            text(currentPosMs +"sec", width/2  - sqrt(_r*_r + _r*_r)/2, height/2, sqrt(_r*_r + _r*_r), sqrt(_r*_r + _r*_r));
            lastPosMs = currentPosMs;
          }
        }
        else {
          samplesRead = 0;
          break;
        }

        // Separate <path> tag each 30000 points
        if (i >= 30000 && i % 30000 == 0) {
          svg.write("'/>\n"); 
          svg.write("<path fill='none' ");
          svg.write("stroke='#0000ff' stroke-width='"+svgPathStrokeWidth+"pt' ");
          svg.write("d='M"+x+","+y+" L"+x+","+y + " ");
        }

        i++;
        theta -= aRad;
        r -= spaceOfEachLine/(outputSamplingRate * (60/rpm));
      }
    }
    while (samplesRead != 0);
  
    // Close svg tag
    svg.write("'/>\n");
    svg.write("</g>\n");
    svg.close();
    
    if(svgCompression)
      svg.compress(false); // Create svgz, not replacing original svg.
    
    // Close audio file
    audioFile.close();
  }

}

void setup() {
  System.out.println("CuttingRecordGenerator");
  size(600, 600);
  smooth();

  Ess.start(this);
  
  // (Optional) if you want to make svgz, set svgCompression = true; .
  //generatorThread.svgCompression = true;
}

void draw() {
  if (audioFilePath != null) {
    background(255);
    fill(0);
    
    if (generatorThread.running)
      generatorThread.quit();

    generatorThread.start(new File(dataPath(audioFilePath)));
    audioFilePath = null;
  }
}

void stop() {
  Ess.stop();
  generatorThread.quit();
  super.stop();
}
