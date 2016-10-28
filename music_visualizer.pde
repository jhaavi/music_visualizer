import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer mySound;
float x = 0;
 
void setup()
{
  fullScreen();
  minim = new Minim(this);
  mySound = minim.loadFile("kid.mp3");
  mySound.play();
  frameRate(60);  
}

void draw()
{
  int bufferSize = mySound.bufferSize();
  //background(0,0,0);
  fill(0,0,0,90);
  rect(-width/2 , - height/2 , width * 4 , height *4);
  
  stroke(255,0,0);
  strokeWeight(5);  
  for (int i=0; i<bufferSize-1; i=i+5)
  {  
   float x1 = map(i, 0, bufferSize, 0, width);
   float x2 = map(i, 0, bufferSize, 0, width);    
   line(x1, height - mySound.right.get(i)*800, x2, width - mySound.right.get(i)*800);
  }
   
  noStroke();
  translate(width/2, height/2); 
  //translate(mouseX, mouseY);
  fill(255,0,0);
  
  for(int i = 0; i < mySound.bufferSize() - 50; i=i+50)
  {          
    ellipse(0,0,mySound.left.get(i)*300,mySound.left.get(i)*300);    
  }

  fill(255,255,255);
  for(int i = 0; i < mySound.bufferSize() - 1; i=i+1) 
  {    
    rotate(x);    
    ellipse(i,i, mySound.left.get(i)*60,mySound.left.get(i)*60);
    x = x + 0.000001;    
  }
}
 