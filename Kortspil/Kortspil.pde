boolean debugBleh = false;

float hastighed = 5;

int[] kortIBunkePos = new int[52];


void setup(){

  indlaesAssets();
  start.play();
  
  size(1227,690,P3D);
  for(int i = 0; i < 52; i++){
    kortBunke(i);//Lav/bland kortbunke
    s[i] = 9.9999;
  }
  indlaesKort();
  
  
  for(int i = 0; i < 52; i++)
    k[i] = new Kort();
  
  //kortIBunkePos = new int[52];
}

void draw(){
  deltaTime = millis() - lastTime;
  lastTime = millis();
  if(lastTime > 5000 && !foersteKort){
    traekKort();
    foersteKort = true;
  }
  
  Summering();
  if(check)
    AI();
  background(0);
  
  coordinateOrigo(CENTER);
  
  
  
  for(int i = 0; i < 52; i++){
    if(!k[i].Animation.Demo.finished[i])
      udregnvektorsti(hastighed, i, "Demo");
    if(!k[i].Animation.Draw.finished[i])
      udregnvektorsti(hastighed, i, "Draw");
    if(!k[i].Animation.aiDraw.finished[i])
      udregnvektorsti(hastighed, i, "aiDraw");      
  }
  
  assets();
  
  //tegn alle kort
  for(int i = 0; i < 52; i++){
    tegnKort(rotersum[i][0], rotersum[i][1], rotersum[i][2], vektorsum[i][0]*5, vektorsum[i][1]*5, vektorsum[i][2]*5, 0, 0, 0, 0, 0, i*2, spillekort[i], k[i].Animation.Draw.Rotation[0], k[i].Animation.Draw.Rotation[1], k[i].Animation.Draw.Rotation[2]);//rotate, position, rotationforskydning, positionforskydning,kort
  }
  
  tjekSejr();
  
  
}

int trukketKort = 1;
String pressedAni = "Demo";
void mousePressed(){
  assetsHitbox();
  if(!check){
    if(hit && vaerdiPaaHaand < 21){
      traekKort();
    }
  }
}

void traekKort(){
  resetAnimation(52-trukketKort, pressedAni);
  rotersum[52-trukketKort][0] = 1.3+PI;
  vektorsum[52-trukketKort][0] = trukketKort*10-50;
  vektorsum[52-trukketKort][1] += 20;
  vektorsum[52-trukketKort][2] += 200;
  paaHaand[52-trukketKort] = true;
  trukketKort++;
}
