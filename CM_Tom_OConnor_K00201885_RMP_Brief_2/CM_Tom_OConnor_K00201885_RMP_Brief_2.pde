//RMP_Brief_2

import processing.video.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import javax.swing.JOptionPane;

PFont myFont;
PFont billabong;
Minim minim;
AudioPlayer player;
PImage img;
Capture video;
boolean liked = false;
XML myInstructions;

void setup() {
  myInstructions = loadXML ("instructions.xml");
  XML[]boxes = myInstructions.getChildren("box");
  for (int i=0; i<boxes.length; i++) {
    String box = boxes[i].getString("text");
    JOptionPane.showMessageDialog(null, box);
  }
  size (740, 700);
  video = new Capture(this, 640, 480, 30);
  video.start();
  minim = new Minim(this);
  player = minim.loadFile("data/camera.wav");
  myFont = createFont("Arial Bold", 32);
}

void keyPressed() {
  if (keyCode == DOWN && keyPressed) {
    video.read();
    saveFrame();
    player.play();
    player.rewind();
  }

}
void draw() {
  background(120);
  if (video.available()) {
    video.read();
    video.loadPixels();
  }
  if (liked == true) {
    fill(255, 0, 0);
  }
  noStroke();
  fill(18, 86, 136);
  rect(50, 10, 640, 60);
  fill(255);
  rect(50, 550, 640, 120);
  fill(255);
  textFont(myFont);
  text("InstaCam", 310, 50);
  //billabong = createFont("data/Billabong.ttf", 100);
  //textFont(billabong);
  image(video, 50, 70);
  fill(0); 



  if (keyCode == 76) {
    fill(255, 0, 0);
    noStroke();
    liked = true;
    textSize(25);
    text("You like this", 110, 590);
  }
  ellipse(69.8, 570, 25, 25);
  ellipse(88.4, 570, 25, 25);
  triangle(58, 575, 80, 600, 100, 575); 
  fill(255, 0, 0);
  textSize(20);
  text("#Selfie", 200, 650);
  fill(0, 255, 0);
  text("#Processing", 290, 650);
  fill(255, 200, 0);
  text("#NoFilter", 430, 650);
  fill(0, 255, 255);
  text("#NotInstagram", 530, 650);
  
  if (keyCode == 75) {
    for (int y = 0; y < video.height; y+=10 ) {
      for (int x = 0; x < video.width; x+=10 ) {

        int vidloc = x + y*video.width;
        float r = red(video.pixels[vidloc]);
        float g = green(video.pixels[vidloc]);
        float b = blue(video.pixels[vidloc]);

        fill(r, g, b, 130);
        noStroke();

        int shapeX, shapeY;
        shapeX = x + (760 - video.width)/2;
        shapeY = y + (610 - video.height)/2;

        shapeX += random(-5, 5);
        shapeY += random(-5, 5);
        ellipse(shapeX, shapeY, 25, 25);
      }
    }
  }
}