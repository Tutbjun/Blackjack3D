boolean flipKort = false;




float hastighed = 1;

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
    if(!finished[i])
      udregnvektorsti(hastighed, i, "Draw");
  }
  
  assets();
  
  //tegn alle kort
  for(int i = 0; i < 52; i++){
    tegnKort(rotersum[i][0], rotersum[i][1], rotersum[i][2], vektorsum[i][0]*5, vektorsum[i][1]*5, vektorsum[i][2]*5, 0, 0, 0, 0, 0, i*2, spillekort[i]);//rotate, position, rotationforskydning, positionforskydning,kort
  }
  
  
  
}

void mousePressed(){
  int xforskydning = 163;
  int yforskydning = 17;
  if(mouseX-width/2-xforskydning > kortx-70 && mouseX-width/2-xforskydning < kortx+70  &&  mouseY-height/2-yforskydning > korty-38 && mouseY-height/2-yforskydning < korty+38)
    resetAnimation(int(random(-0.5,51.4999999999)));
}
