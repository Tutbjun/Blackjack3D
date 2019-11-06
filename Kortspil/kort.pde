void tegnKort(float rX, float rY, float rZ, float dX, float dY, float dZ, float frX, float frY, float frZ, float fdX, float fdY, float fdZ, PImage image){
  pushMatrix();
    //translate
    translate(dX, dY, dZ);
    //roter
    rotateX(rX+frX);
    rotateY(rY+frY);
    rotateZ(rZ+frZ);
    
    translate(fdX, fdY, fdZ);
    scale(2);
    image(image,0,0);
    translate(0,0,0.01);
    image(bagside,0,0);
  popMatrix();  
}

void coordinateOrigo(int pos){
  if(pos == CENTER)
    translate(width/2,height/2);
}

PImage bagside;
PImage[] spillekort = new PImage[52];
void indlaesKort(){
  
  bagside = loadImage("bagside.png");
  
  
  for(int i = 0; i < 13; i++){
    spillekort[i] = loadImage("spar" + (i+1) + ".png");
  }
  for(int i = 0; i < 13; i++){
    spillekort[i+13] = loadImage("hjerte" + (i+1) + ".png");
  }
  for(int i = 0; i < 13; i++){
    spillekort[i+26] = loadImage("ruder" + (i+1) + ".png");
  }
  for(int i = 0; i < 13; i++){
    spillekort[i+39] = loadImage("kloer" + (i+1) + ".png");
  }

}
