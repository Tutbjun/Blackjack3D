StringList ikkeIndlaestKort = new StringList();
int[] indlaestKort = new int[52];
PImage bagside;
PImage[] spillekort = new PImage[52];

void indlaesKort(){
  for(int i = 0; i < 52; i++){
    ikkeIndlaestKort.set(i , "" + i);
  }

  for(int i = 0; i < 52; i++){
    int aflaesIndex = int(random(ikkeIndlaestKort.size()));
    String kort = ikkeIndlaestKort.get(aflaesIndex);
    int kortint = Integer.parseInt(kort);
    indlaestKort[i] = kortint;
    ikkeIndlaestKort.remove(aflaesIndex);
    println(kort);
  }
  
  for(int i = 0; i < 52; i++){
    if(13 > indlaestKort[i]){
      spillekort[i] = loadImage("spar" + (indlaestKort[i]+1) + ".png");      
    }
    else if(26 > indlaestKort[i]){
      spillekort[i] = loadImage("hjerte" + (indlaestKort[i]+1-13) + ".png");      
    }
    else if(39 > indlaestKort[i]){
      spillekort[i] = loadImage("ruder" + (indlaestKort[i]+1-26) + ".png");      
    }
    else if(52 > indlaestKort[i]){
      spillekort[i] = loadImage("kloer" + (indlaestKort[i]+1-39) + ".png");      
    }
  }
  
  bagside = loadImage("bagside.png");
}


void tegnKort(float rX, float rY, float rZ, float dX, float dY, float dZ, float frX, float frY, float frZ, float fdX, float fdY, float fdZ, PImage image, float rOfsetX, float rOfsetY, float rOfsetZ){
  pushMatrix();
    
    rotateX(rOfsetX);
    rotateY(rOfsetY);
    rotateZ(rOfsetZ);
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
