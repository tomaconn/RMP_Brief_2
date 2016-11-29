//RMP_Brief_2

import processing.video.*;                      // Importing Video, Minim and JOptionPane libraries for live video capture, audio and XML capabilities
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import javax.swing.JOptionPane;

PFont myFont;                                  // Declaring variables for PFont, PImage, Minim, AudioPlayer, Capture, boolean, XML, Movie and int
PImage buttonInstructions;
PImage header;
Minim minim;
AudioPlayer player;
AudioPlayer like;
Capture video;
boolean liked = false;
XML myInstructions;
Movie movie;
int counter = 0;

void setup() {
  myInstructions = loadXML ("instructions.xml");          // Loading my XML file thats located in the data folder
  XML[]boxes = myInstructions.getChildren("box");         // The box items from the boxes object are parsed
  for (int i=0; i<boxes.length; i++) {                    // Looping through the boxes object to get the the string in box with the id text
    String box = boxes[i].getString("text");
    JOptionPane.showMessageDialog(null, box);             // The strings are displayed in pop-up message boxes
  }
  size (740, 700);
  video = new Capture(this, 640, 480, 30);
  video.start();
  buttonInstructions=loadImage("data/buttonInstructions.png");   // The instructions are loaded from the data folder
  header = loadImage("data/headerBox.png");                      // The headerBox is loaded
  minim = new Minim(this);
  player = minim.loadFile("data/camera.wav");                    // The audio for the camera is loaded
  like = minim.loadFile("data/like.mp3");                        // The audio for the like is loaded
  myFont = createFont("Arial Bold", 32);                         // Created a font for the footer
}

void keyPressed() {
  if (keyCode == DOWN) {                                  // When the DOWN key is pressed, a snapshot of the live video is taken, the camera audio plays and rewinds to be used again
    video.read();
    player.play();
    player.rewind();
    save("Gallery/photo" + counter + ".tiff");            // The photos are saved in the Gallery folder and saved with different numbers by incrementing the counter variable 
    counter++;
  }
}
void draw() {
  background(120);
  if (video.available()) {
    video.read();                                      // If the video is available when you run the sketch it is read at its current frame
  }

  image(video, 50, 70);                                // The video is displayed and positioned on the sketch

  if (keyCode == 75) {                                // Press K Key for Circle Blur
    for (int y = 0; y < video.height; y+=10 ) {
      for (int x = 0; x < video.width; x+=10 ) {      // Looping through for the space between the ellipses

        int vidloc = x + y*video.width;               // Picking up the RGB in the pixels
        float r = red(video.pixels[vidloc]);
        float g = green(video.pixels[vidloc]);
        float b = blue(video.pixels[vidloc]);

        fill(r, g, b, 255);
        noStroke();

        int shapeX, shapeY;
        shapeX = x + (760 - video.width)/2;          // Declaring the size of the Circle Blur - keeping it to the same size as the live video window
        shapeY = y + (610 - video.height)/2;

        shapeX += random(-5, 5);
        shapeY += random(-5, 5);
        ellipse(shapeX, shapeY, 25, 25);            // Random movement of ellipses and the x and y of each ellipse
      }
    }
  }
  if (keyCode == 74) {                               // Press J Key for Square Blur - Same As Circle Blur
    for (int y = 0; y < video.height; y+=5 ) {
      for (int x = 0; x < video.width; x+=5 ) {

        int vidloc = x + y*video.width;
        float r = red(video.pixels[vidloc]);
        float g = green(video.pixels[vidloc]);
        float b = blue(video.pixels[vidloc]);

        fill(r, g, b, 255);
        noStroke();

        int shapeX, shapeY;
        shapeX = x + (735 - video.width)/2;
        shapeY = y + (600 - video.height)/2;

        shapeX += random(-5, 5);
        shapeY += random(-5, 5);
        rect(shapeX, shapeY, 20, 20);
      }
    }
  }
  noStroke();
  image(header,50,10,640,75);  // Header Box
  fill(255);
  rect(50, 550, 640, 120);   // Footer Box
  fill(0); 
  
  if (keyCode == 76) {        //  When the L key is pressed, the heart shape turns red, the text 'You like this' appears next to it and the 'like' audio plays
    fill(255, 0, 0);
    noStroke();
    liked = true;
    textSize(25);
    text("You like this", 110, 590);
    like.play();
  }
  if (liked == true) {
    fill(255, 0, 0);
  }
  
  ellipse(69.8, 570, 25, 25);                // Two ellipses and a triangle positioned in the shape of a heart
  ellipse(88.4, 570, 25, 25);
  triangle(58, 575, 80, 600, 100, 575); 
  fill(255, 0, 0);
  textSize(20);
  text("#Selfie", 200, 650);                // Hashtagged text similar to Instagram
  fill(0, 255, 0);
  text("#Processing", 290, 650);
  fill(255, 200, 0);
  text("#NoFilter", 430, 650);
  fill(0, 255, 255);
  text("#NotInstagram", 530, 650);
  
   if (keyCode == 32) {                          // If the space-bar is pressed, the instructions PNG appears infront of the InstaCam
    image(buttonInstructions,50,10,640,660);
  }
}