//RMP_Brief_2
import processing.video.*;

Capture video;

void setup(){
  size (640,540);
  video = new Capture(this,640,480,30);
  video.start();
}

void mousePressed(){
  video.read();
  //saveFrame();
}

void draw() {
  if(video.available()) {
  //video.read();
  }
  background(0);
  image(video,0,0);
}
   