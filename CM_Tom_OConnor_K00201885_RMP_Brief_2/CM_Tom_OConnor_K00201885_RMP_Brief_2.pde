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
boolean like = false;

void setup(){
  size (740,700);
  video = new Capture(this,640,480,30);
  video.start();
  //img = loadImage("data/insta.jpg");
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
  //image(img,0,0,740,700);
  image(video,50,70);
  
   noStroke();
   fill(0);
   ellipse(69.8,570,25,25);
   noStroke();
   fill(0);
   ellipse(88.4,570,25,25);
   noStroke();
   fill(0);
   triangle(58,575,80,600,100,575);
  
  if(mousePressed){
    noStroke();
    fill(255,0,0);
    ellipse(69.8,570,25,25);
    noStroke();
    fill(255,0,0);
    ellipse(88.4,570,25,25);
    noStroke();
    fill(255,0,0);
    triangle(58,575,80,600,100,575);
    textSize(30);
    text("You like this", 110,590);
    like = true;
  }
}