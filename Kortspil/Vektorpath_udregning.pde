float[] vektoralpha = new float[3];
float[][] vektorsum = new float[52][3];
float[] roteralpha = new float[3];
float[][] rotersum = new float[52][3];
float[] s = new float[52];
boolean[] finished = new boolean[52];
boolean debug = true;


void resetAnimation(int kort){
  s[kort] = 1;
  finished[kort] = false;
  roteralpha = new float[3];
  vektoralpha = new float[3];
}


void udregnvektorsti(float h, int kort) {

  
  if(s[kort] > 10){
    finished[kort] = true;
    return;
  }
  
  int n = floor(s[kort]); 
  //udregn tau
  float[] vektortau = new float[3]; //resterende af nuværende vektor
  for(int i = 0; i < 52; i++){
    if(debug)
      println("s:" + s[i]);
  }
  for(int i = 0; i < 3; i++){ 
    vektortau[i] = ((n+1)-s[kort])*(k[kort].Animation.Draw.Path[n+1][i]); //n+1 fordi første vektor er 1
    if(debug)
      println("vektortau" + i + "  " + vektortau[i]);
  }
  
  //udregn omega (hvor stor en del af den nuværende vektor, som den skal bevæge sig)
  float laengdetau = abs(sqrt(pow(vektortau[0],2)+pow(vektortau[1],2)+pow(vektortau[2],2)));
  float omega = h/k[kort].Animation.Draw.PathLength;
  println(k[kort].Animation.Draw.PathLength);
  if(debug){
    println("laengdetau " + laengdetau);
    println("omega " + omega);
  }
  for(int i = 0; i < 3; i++)
    vektoralpha[i] = 0;
  
  int whileCycles = 0;
  s[kort] += omega;
  while(omega > 0){ //få Simon til at tjekke logikken
    whileCycles++;
    if(whileCycles == 1){
      if(laengdetau/k[kort].Animation.Draw.PathLength < omega){ //ÆNDRET FRA laengdetau > laengdetau * omega
        for(int i = 0; i < 3; i++){
          vektoralpha[i] += k[kort].Animation.Draw.Path[n+1][i] * omega;
        }
        omega -= omega;
      }    
      else if(laengdetau <= laengdetau * omega){
        for(int i = 0; i < 3; i++){
          vektoralpha[i] += vektortau[i];
        }
        omega -= k[kort].Animation.Draw.PathLength/laengdetau;
      }
    }

    int vektorStiIndex = 0;
    if(omega >= 1){
      vektorStiIndex = n + whileCycles - 1;
      for(int i = 0; i < 3; i++)
        vektoralpha[i] += k[kort].Animation.Draw.Path[vektorStiIndex][i];
      omega--;
    }
    if(omega < 1){
      vektorStiIndex = n + whileCycles - 1;
      for(int i = 0; i < 3; i++){
        vektoralpha[i] += k[kort].Animation.Draw.Path[vektorStiIndex][i] * omega;
      }
      omega -= omega;
    }
    if(debug){
      println("omega " + omega);
      println("vektoralpha " + vektoralpha[0] + "," + vektoralpha[1] + "," + vektoralpha[2]);
    }
  }
  for(int i = 0; i < 3; i++){
    vektorsum[kort][i] += vektoralpha[i];
  }
}
