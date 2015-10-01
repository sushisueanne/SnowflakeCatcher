
Snowflake [] marcus= new Snowflake [25];

void setup(){
    background(0);

  size(400,400);
  for (int i=0; i<25; i++){
    marcus [i]= new Snowflake(); 
  }
}

void draw(){
  for (int i=0; i<25; i++){
    if (marcus[i].isMoving==false){
       marcus[i]= new Snowflake();
    }
  }
  for (int i=0; i<25; i++){
    marcus[i].erase();
    marcus[i].lookDown();
    marcus[i].move();
    marcus[i].wrap();
    marcus[i].show();
  }

}

void mouseDragged()
{
  noStroke();
  fill(153,30,20);
  ellipse(mouseX,mouseY,10,10);
}

class Snowflake{
  int x;
  int y;
  boolean isMoving;

  Snowflake()
  {
   x= (int)(Math.random()*401);
   y= (int)(Math.random()*401)-400;
   isMoving= true;
  }

  void show(){
    fill(255);
    ellipse(x,y,5,5);
  }
  
  void lookDown(){

    if (y>0 && y<400 && (get(x,y+3)==color(153,30,20) || get (x,y+3)==color(255) ) ){
      isMoving=false;
    }
    else{
      isMoving=true;
    }

  }
  void erase(){
   fill(0);
   ellipse(x,y,6,6);
  }

  void move(){

    if (isMoving==true){
      y=y+1;
    }

  }
  void wrap(){

   if(y>398){
    y=0;
    x=(int)(Math.random()*401);
   }

  }

}


