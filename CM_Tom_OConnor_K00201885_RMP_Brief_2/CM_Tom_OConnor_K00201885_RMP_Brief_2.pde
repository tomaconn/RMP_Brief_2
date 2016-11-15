//RMP_Brief_2

import processing.video.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
PImage img;
Capture video;

void setup(){
  size (740,680);
  video = new Capture(this,640,480,30);
  video.start();
  img = loadImage("data/insta.jpg");
  //player = minim.loadFile("data/camera.wav");
}

void mousePressed(){
  video.read();
  saveFrame();
  //player.play();
}

void draw() {
  if(video.available()) {
  //video.read();
  }
  image(img,0,0,740,680);
  image(video,50,70);
}