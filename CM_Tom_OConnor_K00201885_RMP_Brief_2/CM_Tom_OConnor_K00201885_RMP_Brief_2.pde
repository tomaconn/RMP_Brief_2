//RMP_Brief_2

import processing.video.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PFont billabong;
Minim minim;
AudioPlayer player;
PImage img;
Capture video;
boolean liked = false;

void setup(){
  size (740,700);
  video = new Capture(this,640,480,30);
  video.start();
  minim = new Minim(this);
  player = minim.loadFile("data/camera.wav"); 
}

void keyPressed(){
  if(keyCode == DOWN && keyPressed){
  video.read();
  //saveFrame();
  player.play();
  
  }
}
void draw() {
  if(video.available()) {
     video.read();
  }
  if(liked == true){
    fill(255,0,0);
  }
  fill(18,86,136);
  rect(50,10,640,60);
  fill(255);
  stroke(0);
  rect(50,550,640,120);
  fill(255);
  textSize(32);
  text("InstaCam", 310, 50);
  billabong = createFont("data/Billabong.ttf",100);
  textFont(billabong);
  image(video,50,70);
  fill(0); 
  
  if(mouseButton == LEFT){
    fill(255,0,0);
    noStroke();
    liked = true;
    textSize(25);
    text("You like this", 110,590); 
  }
    ellipse(69.8,570,25,25);
    ellipse(88.4,570,25,25);
    triangle(58,575,80,600,100,575); 
  }