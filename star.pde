import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Planet sun;

PeasyCam cam;

PImage sunImg;
PImage[] img = new PImage[4];

int cx, cy ,n,num,leve;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
float time;
int a=2,b=2;
float s=0.05;
  void setup()
  {
    size(1000,1000, P3D);
   
    sunImg = loadImage("sun.jpg");
    img [0]= loadImage("earth.jpg");
    img [1]= loadImage("jupiter.jpg");
    img [2]= loadImage("neptune.jpg");
    img [3]= loadImage("venus.jpg");
    cam = new PeasyCam(this ,500);
    sun = new Planet(100,0,0, sunImg);     
    sun.spawnMoons(a,b,s);
    
  }
  
  int timeSpeed=1;
  
  void draw(){
  
     background(0);
    lights();
    pointLight(255,255,255,122,0,0);
    sun.show();
    sun.orbit();
    night_star();

      if( a>0 && a< 10 && keyCode==UP)
   {
      a+=1;
     sun.spawnMoons(a,b,s);
    }else if(a>1 && a<11 && keyCode==DOWN)
   {
      a-=1;
     sun.spawnMoons(a,b,s);
   }else if(timeSpeed>1 && timeSpeed<11 && keyCode==LEFT)
   {
      s-=0.015;
      timeSpeed-=1;
     sun.spawnMoons(a,b,s);
   }else if(timeSpeed>0 && timeSpeed<10 &&  keyCode==RIGHT)
   {
      s+=0.015;
      timeSpeed+=1;
     sun.spawnMoons(a,b,s);
   }
   
       //clock(timeSpeed);
  }
  
  void night_star()
  {
     stroke(255,255,255);
    for(int i=0; i<250;i++)
    {
      strokeWeight(random(0,5));
      point(random(-1000,1000),random(-1000,1000),random(-1000,1000));
    }
  }
  

  
  void clock(int n)
  {
    int radius = min(width, height) / 10;
    secondsRadius = radius * 0.72;
    minutesRadius = radius * 0.60;
    hoursRadius = radius * 0.50;
    clockDiameter = radius * 1.8;
    
    cx = 500;
    cy = 400;
     fill(0);
     stroke(0,255,0);
    ellipse(cx, cy, clockDiameter, clockDiameter);
    
   
    time=second()*n;
    float s = map(time, 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute() + norm(time, 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
    float h = map(hour() + norm(time, 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
    
    // Draw the hands of the clock
    stroke(122,122,0);
    strokeWeight(1);
    line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    stroke(255);
    strokeWeight(2);
    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
    stroke(255,0,0);
    strokeWeight(4);
    line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
    
    // Draw the minute ticks
    strokeWeight(2);
    beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * secondsRadius;
      float y = cy + sin(angle) * secondsRadius;
      vertex(x, y);
    }
    endShape();
  }  
  
 