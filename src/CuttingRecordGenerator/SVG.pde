import java.io.*;
import java.util.zip.*;

class SVG {
  private FileWriter fw;
  private BufferedWriter bw;
  private PrintWriter pw;
  private String filePath;
  private boolean isOpened;
  private int width;
  private int height;

  public SVG(int w, int h) {
    //println("SVG::()");
    isOpened = false;
    width = w;
    height = h;
  }
  public boolean open(String path) {
    filePath = path;
    if (pw != null)
      pw.close();
    if (bw != null) {
      try {
        bw.close();
      }
      catch(IOException exception) {
        println("bww.close():: " + exception);
      }
    }
    if (fw != null) {
      try {
        fw.close();
      }
      catch(IOException exception) {
        println("fw.close():: " + exception);
      }
    }


    if (filePath != null) {
      try {
        fw = new FileWriter(filePath);
        bw = new BufferedWriter(fw);
        pw = new PrintWriter(bw);

        pw.println("<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>\n");
        pw.println("<svg xmlns='http://www.w3.org/2000/svg' version='1.1' xmlns:xlink='http://www.w3.org/1999/xlink' width='"+width+"' height='"+height+"' viewBox='0 0 "+width+" "+height+"' enable-background='new 0 0 "+width+" "+height+"' xml:space='preserve'>");
        pw.println("<title>Laser Record ["+ filePath +"]</title>");

        isOpened = true;
      }
      catch(IOException exception) {
        println(exception);
      }
    }
    return isOpened;
  }

  public void write(String data) {
    if (isOpened) {
      pw.print(data);
      pw.flush();
    }
  }

  public void close() {
    if (isOpened) {
      isOpened = false;
      pw.println("</svg>");
      pw.close();
    }
  }

  public void compress(boolean replace) {
    if (isOpened) {
      println("Error: svg is still opened.");
      return;
    }
    if (filePath == null) {
      println("Error: svg output file path is not setted.");
      return;
    }
    File src = new File(filePath);

    String dstPath = null;
    int lastDotPos = src.getName().lastIndexOf(".");
    if (lastDotPos != -1) {
      dstPath = src.getParent() + File.separator + src.getName().substring(0, lastDotPos) + ".svgz";
    }

    File dst = new File(dstPath);

    try {
      FileInputStream fileInputStream = new FileInputStream(src);
      BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
      FileOutputStream fileOutputStream = new FileOutputStream(dst);
      GZIPOutputStream gzipOutputStream = new GZIPOutputStream(fileOutputStream);
      
      println("Start gzip compression...");      
      int d;
      while( (d = bufferedInputStream.read()) != -1 ) {
        gzipOutputStream.write( (byte)d );
      }
      
      bufferedInputStream.close();
      fileInputStream.close();
      gzipOutputStream.close();
      fileOutputStream.close();
      
      if(replace) {
        print("Deleting source svg file...");
        src.delete();
      }
      
      println("Gzip compression is done.");
    }
    catch(IOException exception) {
      println(exception);
    }
  }
  
  public int getWidth() {
    return width;
  }
  
  public int getHeight() {
    return height;
  }
}

