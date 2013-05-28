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
  File file;
  SVG svg;
  boolean svgCompression = false;
  double x = 0;
  double y = 0;
  double previousX = 0;
  double previousY = 0;
  static final double MM_PER_PT = 0.3527777; // 0.3527777mm per 1pt
  static final double MM_PER_INCH = 25.4; // 25.4mm per 1inch
  
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
    double a = 360 / (outputSamplingRate * (60/rpm));
    println("generate():: a:" + a);
    //println(spaceOfEachLine/(outputSamplingRate * (60/rpm)));
    double aRad = a*((double)Math.PI/180);
    double r = 0;
    double theta = 0;
  
    double x = 0;
    double y = 0;
  
    long i = 0;

    String svgOutputPath = f.getParent()+"/"+(f.getName().replace(".", "_"));
    // Create SVG file with canvas size
    svg = new SVG((int)(recordDiameterMillimeter/MM_PER_PT), (int)(recordDiameterMillimeter/MM_PER_PT));
    svg.open(svgOutputPath+"_"+(int)rpm+"rpm_"+dpi+"dpi.svg");
  
    // Convert from millimeter to point 
    r = (recordDiameterMillimeter/2) / MM_PER_PT;
    
    r = r - (rOuterMarginMillimeter / MM_PER_PT);

    // Calculate starting point
    x = r*cos((float)theta) + svg.getWidth()/2;
    y = r*sin((float)theta) + svg.getHeight()/2;
    previousX = x;
    previousY = y;
    
    // Draw outer circle
    svg.write("<circle fill='none' stroke='#ff0000' stroke-width='"+svgPathStrokeWidth+"pt' cx='"+svg.getWidth()/2+"' cy='"+svg.getHeight()/2+"' r='"+recordDiameterMillimeter/2+"mm'/>\n");
    // Draw center hole 
    svg.write("<circle fill='none' stroke='#ff0000' stroke-width='"+svgPathStrokeWidth+"pt' cx='"+svg.getWidth()/2+"' cy='"+svg.getHeight()/2+"' r='"+centerHoleDaiameterMillimeter/2+"mm'/>\n");  
    
    // Starting draw groove
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
    audioStream.sampleRate((float)outputSamplingRate);

    double amp = 0.0;
    int samplesRead;
    int totalSamples = 0;
    int lastPosMs = 0;

    //line(0,0, width, height);
    //line(map(0, 0, svg.getWidth(), 0, width), map(0, 0, svg.getHeight(), 0, height), map(svg.getWidth(), 0, svg.getWidth(), 0, width), map(svg.getHeight(), 0, svg.getHeight(), 0, height));
    //line(map(0, 0, svg.getWidth(), 0, width), map(0, 0, svg.getHeight(), 0, height), map(width/2, 0, svg.getWidth(), 0, width), map(height/2, 0, svg.getHeight(), 0, height));

    // Keep drawing
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
          amp = map(audioStream.buffer[s], -1, 1, (float)amplitudeMax*-1, (float)amplitudeMax);
          x = (r + amp)*cos((float)theta) + svg.getWidth()/2;
          y = (r + amp)*sin((float)theta) + svg.getHeight()/2;

          // Check the distance between last point and new point for limitation of output dpi          
          double dist = sqrt(abs((float)previousX - (float)x)*abs((float)previousX - (float)x) + abs((float)previousY - (float)y)*abs((float)previousY - (float)y)); // pt
          if(dist >= ((MM_PER_INCH / dpi) / MM_PER_PT)) {          
            // Write out a point
            svg.write(x + "," + y + " ");
            previousX = x;
            previousY = y;
          }
          
          // Fast draw preview line
          if (i%5 == 0) {
            // Draw point on window
            //point(map((float)x, 0, svg.getWidth(), 0, width), map((float)y, 0, svg.getHeight(), 0, height));
            
            // Draw line on window
            line(
              map((float)previousX, 0, svg.getWidth(), 0, width),
              map((float)previousY, 0, svg.getHeight(), 0, height),
              map((float)x, 0, svg.getWidth(), 0, width),
              map((float)y, 0, svg.getHeight(), 0, height)
            );
          }
          
          // Draw current audio head position 
          int currentPosMs = audioStream.ms(totalSamples)/1000;
          if (currentPosMs != lastPosMs) {
            fill(255);
            noStroke();
            float _r = map((float)(centerHoleDaiameterMillimeter/2 + rInnerMarginMillimeter), 0, svg.getWidth(), 0, width);
            ellipse(width/2, height/2, _r*2, _r*2); 
            fill(0);
            textAlign(CENTER, CENTER);
            text(currentPosMs +"sec", width/2, height/2);
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
          svg.write("d='M"+previousX+","+previousY+" L"+x+","+y + " ");
        }

        i++;
        theta -= aRad;
        r -= (amplitudeMax + spaceOfEachLine) / (outputSamplingRate * (60/rpm));
      }
    }
    while (samplesRead != 0);
  
    // Close groove path
    svg.write("'/>\n");
    svg.write("</g>\n");

    // Draw run-out groove
    svg.write("<path fill='none' ");
    svg.write("stroke='#0000ff' stroke-width='"+svgPathStrokeWidth+"pt' ");
    svg.write("d='M"+ x +","+ y +" L"+x+","+y +" ");
    for(double d = 0; d<TWO_PI*2; d+=TWO_PI/dpi) {
      x = (r)*cos((float)theta) + svg.getWidth()/2;
      y = (r)*sin((float)theta) + svg.getHeight()/2;
      svg.write(x + "," + y + " ");
      theta -= TWO_PI/dpi;
      r -= 1.0/dpi; // Descrease 1pt while this loop
    }
    for(double d = 0; d<TWO_PI; d+=TWO_PI/dpi) {
      x = (r)*cos((float)theta) + svg.getWidth()/2;
      y = (r)*sin((float)theta) + svg.getHeight()/2;
      svg.write(x + "," + y + " "); // Draw closed circle
      theta -= TWO_PI/dpi;
    }
    // Close run-out groove path
    svg.write("'/>\n");
    
    // Close svg tags
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
    
    //if (generatorThread.running)
    //  generatorThread.quit();

    generatorThread.start(new File(dataPath(audioFilePath)));
    audioFilePath = null;
  }
}

void stop() {
  Ess.stop();
  generatorThread.quit();
  super.stop();
}
