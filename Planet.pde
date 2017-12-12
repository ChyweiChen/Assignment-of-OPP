class Planet{

  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitspeed;
  PVector v;
  
  PShape ball;
  
  Planet(float r, float d, float o, PImage map){
    v = PVector.random3D();
    
    radius = r;
    distance = d;
    v.mult(distance);
    orbitspeed = o;
    angle = random(TWO_PI);
    
    noStroke();
    noFill();
    ball = createShape(SPHERE, radius);
    ball.setTexture(map);
  }
  
  void orbit()
  {
    angle = angle + orbitspeed;
     if(planets !=null)
     {
        for(int i=0; i < planets.length; i++)
        {
          planets[i].orbit();
        }
     }
  }
  
  void spawnMoons(int t, int level, float s)
  {
    planets=new Planet[t];
    for(int i=0; i <planets.length; i++)
    {
      float r = radius/(level*2);
      float d = random((radius + r),(radius +r)*4);
      float o = random(-s, s);
      num=leve=1;
  
      int index = int(random(0, img.length));
      planets[i]= new Planet(r,d,o,img[index]);
      if(level < 3 )
      {
        int num = int(random(0,4));
        planets[i].spawnMoons(num, level + 1,s);
      }
    }
  }
  void show(){
    pushMatrix();
     PVector v2 = new PVector(0,0,1);
     PVector p = v.cross(v2);
     rotate( angle, p.x, p.y, p.z);
     
    translate(v.x, v.y, v.z);
   noStroke();
   fill(255);
    shape(ball);
    if(planets !=null)
   {
      for(int i=0; i < planets.length; i++)
      {
        planets[i].show();
      }
   }
   popMatrix();
  }
}