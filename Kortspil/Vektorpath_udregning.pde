float[] vektoralpha = new float[3];
float[][] vektorsum = new float[52][3];
float[] roteralpha = new float[3];
float[][] rotersum = new float[52][3];
float[] s = new float[52];

boolean debug = true;


void resetAnimation(int kort, String aniType) {
  s[kort] = 1;
  roteralpha = new float[3];
  vektoralpha = new float[3];
  if(aniType == "Demo") 
    k[kort].Animation.Demo.finished[kort] = false;
  if(aniType == "Draw") 
    k[kort].Animation.Draw.finished[kort] = false;
  if(aniType == "aiDraw") 
    k[kort].Animation.aiDraw.finished[kort] = false;
}

int antalArrayTingTing(String aniType, int kort){
  if(aniType == "Demo")
    return k[kort].Animation.Demo.antalArrayTingTing;
  else if(aniType == "Draw")
    return k[kort].Animation.Draw.antalArrayTingTing;
  else if(aniType == "aiDraw")
    return k[kort].Animation.aiDraw.antalArrayTingTing;
  else{
    for(int i = 0; i< 100; i++)
      println("bigoof");
    return 0;
  }
}
float paths(String aniType, int kort, int i1, int i2){
  if(aniType == "Demo"){
    return k[kort].Animation.Demo.Path[i1+1][i2];
  }
  else if(aniType == "Draw")
    return k[kort].Animation.Draw.Path[i1+1][i2];
  else if(aniType == "aiDraw")
    return k[kort].Animation.aiDraw.Path[i1+1][i2];
  else{
    for(int i = 0; i< 100; i++)
      println("bigoof");
    return 0;
  }
}
float pathLength(String aniType, int kort){
  if(aniType == "Demo"){
    return k[kort].Animation.Demo.PathLength;
  }
  else if(aniType == "Draw")
    return k[kort].Animation.Draw.PathLength;
  else if(aniType == "aiDraw")
    return k[kort].Animation.aiDraw.PathLength;
  else{
    for(int i = 0; i< 100; i++)
      println("bigoof");
    return 0;
  }
}




void udregnvektorsti(float h, int kort, String aniType) {
  int antalPaths = antalArrayTingTing(aniType, kort) - 1;
  println(antalPaths);
  float[][] Paths = new float[antalPaths+1][3];
  for(int i1 = 0; i1 < antalPaths - 1; i1++){
    for(int i2 = 0; i2 < 3; i2++){
      Paths[i1+1][i2] = paths(aniType, kort, i1, i2);
    }
  }
  float pathsLength = pathLength(aniType, kort);  
  println(s[kort]);
  if (s[kort] > antalPaths) {
    if(aniType == "Demo")
      k[kort].Animation.Demo.finished[kort] = true;
    if(aniType == "Draw")
      k[kort].Animation.Draw.finished[kort] = true;
    if(aniType == "aiDraw")
      k[kort].Animation.aiDraw.finished[kort] = true;
    println(aniType);
    return;
  }


  int n = floor(s[kort]); 
  //udregn tau
  float[] vektortau = new float[3]; //resterende af nuværende vektor
  for (int i = 0; i < 52; i++) {
    if (debug)
      println("s:" + s[i]);
  }
  for (int i = 0; i < 3; i++) { 
    vektortau[i] = ((n+1)-s[kort])*(Paths[n+1][i]); //n+1 fordi første vektor er 1
    if (debug)
      println("vektortau" + i + "  " + vektortau[i]);
  }

  //udregn omega (hvor stor en del af den nuværende vektor, som den skal bevæge sig)
  float laengdetau = abs(sqrt(pow(vektortau[0], 2)+pow(vektortau[1], 2)+pow(vektortau[2], 2)));
  float omega = h/pathsLength;
  println(pathsLength);
  if (debug) {
    println("laengdetau " + laengdetau);
    println("omega " + omega);
  }
  for (int i = 0; i < 3; i++)
    vektoralpha[i] = 0;

  int whileCycles = 0;
  s[kort] += omega;
  while (omega > 0) { //få Simon til at tjekke logikken
    whileCycles++;
    if (whileCycles == 1) {
      if (laengdetau/pathsLength < omega) { //ÆNDRET FRA laengdetau > laengdetau * omega
        for (int i = 0; i < 3; i++) {
          vektoralpha[i] += Paths[n+1][i] * omega;
        }
        omega -= omega;
      } else if (laengdetau <= laengdetau * omega) {
        for (int i = 0; i < 3; i++) {
          vektoralpha[i] += vektortau[i];
        }
        omega -= pathsLength/laengdetau;
      }
    }
    int vektorStiIndex = 0;
    if (omega >= 1) {
      vektorStiIndex = n + whileCycles - 1;
      for (int i = 0; i < 3; i++)
        vektoralpha[i] += Paths[vektorStiIndex][i];
      omega--;
    }
    if (omega < 1) {
      vektorStiIndex = n + whileCycles - 1;
      for (int i = 0; i < 3; i++) {
        vektoralpha[i] += Paths[vektorStiIndex][i] * omega;
      }
      omega -= omega;
    }
    if (debug) {
      println("omega " + omega);
      println("vektoralpha " + vektoralpha[0] + "," + vektoralpha[1] + "," + vektoralpha[2]);
    }
  }
  for (int i = 0; i < 3; i++) {
    vektorsum[kort][i] += vektoralpha[i];
  }
}
