//RMP_Brief_2
import processing.video.*;

PImage img;
Capture video;

void setup(){
  size (740,680);
  video = new Capture(this,640,480,30);
  video.start();
  img = loadImage("insta.jpg");
}

void mousePressed(){
  video.read();
  saveFrame();
}

void draw() {
  if(video.available()) {
  //video.read();
  }
  image(img,0,0,740,680);
  image(video,50,70);
}