boolean flipKort = false;




float hastighed = 5;

int[] kortIBunkePos = new int[52];

void randomizePos(){
  
}

void setup(){
  size(1227,690,P3D);
  for(int i = 0; i < 52; i++){
    kortBunke(i);//Lav/bland kortbunke
    s[i] = 9.9999;
  }
  indlaesKort();
  indlaesAssets();
  
  for(int i = 0; i < 52; i++)
    k[i] = new Kort();
}

void draw(){
  background(0);
  
  coordinateOrigo(CENTER);
  
  
  
  for(int i = 0; i < 52; i++){
    if(!k[i].Animation.Demo.finished[i])
      udregnvektorsti(hastighed, i, "Draw");
    if(!k[i].Animation.Draw.finished[i])
      udregnvektorsti(hastighed, i, "Flip");
  }
  
  assets();
  
  //tegn alle kort
  for(int i = 0; i < 52; i++){
    tegnKort(rotersum[i][0], rotersum[i][1], rotersum[i][2], vektorsum[i][0]*5, vektorsum[i][1]*5, vektorsum[i][2]*5, 0, 0, 0, 0, 0, i*2, spillekort[i], k[i].Animation.Draw.Rotation[0], k[i].Animation.Draw.Rotation[1], k[i].Animation.Draw.Rotation[2]);//rotate, position, rotationforskydning, positionforskydning,kort
  }
  
  
  
}

int trukketKort = 0;
void mousePressed(){
  trukketKort++;
  int xforskydning = 163;
  int yforskydning = 17;
  if(mouseX-width/2-xforskydning > kortx-70 && mouseX-width/2-xforskydning < kortx+70  &&  mouseY-height/2-yforskydning > korty-38 && mouseY-height/2-yforskydning < korty+38 && trukketKort <= 52){
    resetAnimation(52-trukketKort, "Flip");
    rotersum[52-trukketKort][0] = PI;
    vektorsum[52-trukketKort][0] = 230+trukketKort*10;
  }
  
}
