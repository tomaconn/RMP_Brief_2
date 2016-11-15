//RMP_Brief_2
import processing.video.*;

Capture video;

void setup(){
  size (640,360);
  video = new Capture(this,640,360,30);
  video.start();
}

void draw() {
  if(video.available()) {
  video.read();
  }
  background(0);
  image(video,0,0);
}
 