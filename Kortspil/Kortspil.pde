//Nu er der en kommentar


void setup(){
  size(690,690,P3D);
}

void draw(){
  background(0);
  fill(255);
  coordinateOrigo(CENTER);
  udregnvektorsti();
  box(250,350,1);
}

void coordinateOrigo(int s){
  if(s == CENTER)
    translate(width/2,height/2);
}
