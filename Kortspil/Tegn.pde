PImage bord;
PImage ai;
PImage casino;
PImage foul;
PImage hit_;
void indlaesAssets(){
  bord = loadImage("bord.png");
  ai = loadImage("ai.png");
  casino = loadImage("casino.png");
  foul = loadImage("foul.png");
  hit_ = loadImage("hit.png");
  
  aiWon = new SoundFile(this, "aiwon.mp3");
  start = new SoundFile(this, "start.mp3");
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
  imageMode(CORNER);
  pushMatrix();
    translate(400,125,0);
    scale(0.35);
    image(foul,0,0);
  popMatrix();
  pushMatrix();
    translate(ulfX,ulfY,0);
    scale(ulfScale);
    image(hit_,0,0);
  popMatrix();
}


int ulfX = -525;
int ulfY = 100;
float ulfScale = 1;
boolean hit;
boolean check;
void assetsHitbox(){
  int posX = 400;
  int posY = 125;
  int sizeX = int(447*0.35);
  int sizeY = int(449*0.35);
  
  if(mouseX > posX+width/2 && mouseX < posX+sizeX+width/2 && mouseY > posY+height/2 && mouseY < posY + sizeY+height/2){
    check = true;
    if(debugBleh)
      rect(posX,posY,sizeX,sizeY);
  }
  if(foersteKort && mouseX-width/2 > ulfX && mouseX-width/2 < ulfX+130*ulfScale  &&  mouseY-height/2 > ulfY && mouseY-height/2 < ulfY+158*ulfScale && trukketKort <= 52){
    if(debugBleh)
      rect(ulfX,ulfY,(ulfX+130*ulfScale)-(ulfX),(ulfY+158*ulfScale)-(ulfY));
    hit = true;
  }
  println(check);
}

int kortx;
int korty;
int kortz;
void kortBunke(int kort){
  kortx = 50;
  korty = 48;
  kortz = -250;
  rotersum[kort][0] = 1.3;
  float bleh = 0;
  rotersum[kort][1] = bleh;
  rotersum[kort][2] = 0;
  vektorsum[kort][0] = kortx;
  vektorsum[kort][1] = korty;
  vektorsum[kort][2] = kortz;   
}
