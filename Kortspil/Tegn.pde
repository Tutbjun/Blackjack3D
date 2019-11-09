PImage bord;
PImage ai;
PImage casino;
void indlaesAssets(){
  bord = loadImage("bord.png");
  ai = loadImage("ai.png");
  casino = loadImage("casino.png");
}

void assets(){
  imageMode(CENTER);
  pushMatrix();
    translate(0,390,-1000);
    rotateX(1.3);
    scale(4);
    image(bord,0,0);
  popMatrix();
  pushMatrix();
    translate(0,-1250,-3000);
    rotateX(-0.2);
    scale(7);
    image(casino,0,0);
  popMatrix();
  pushMatrix();
    translate(0,-600,-2000);
    scale(3);
    image(ai,0,0);
  popMatrix();
  
}

int kortx;
int korty;
int kortz;
void kortBunke(int kort){
  kortx = 250;
  korty = 48;
  kortz = -250;
  rotersum[kort][0] = 1.3;
  float bleh = 0;
  if(flipKort)
    bleh = PI;
  rotersum[kort][1] = bleh;
  rotersum[kort][2] = 0;
  vektorsum[kort][0] = kortx;
  vektorsum[kort][1] = korty;
  vektorsum[kort][2] = kortz;   
}
