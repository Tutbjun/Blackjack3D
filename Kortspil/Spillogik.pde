boolean[] aiPaaHaand = new boolean[52];
boolean[] paaHaand = new boolean[52];
int vaerdiPaaHaand = 0;
int aiVaerdiPaaHaand = 0;
boolean foersteKort = false;

import processing.sound.*;
SoundFile aiWon;
SoundFile start;
SoundFile daisy;

void Summering() {
  vaerdiPaaHaand = 0;
  aiVaerdiPaaHaand = 0;


   for(int i = 0; i < 52; i++){
    if(paaHaand[i]){
      if(13 > indlaestKort[i]){
        vaerdiPaaHaand += indlaestKort[i]+1;
      }
      else if(26 > indlaestKort[i]){
        vaerdiPaaHaand += indlaestKort[i]-13+1;
      }
      else if(39 > indlaestKort[i]){
        vaerdiPaaHaand += indlaestKort[i]-26+1;
      }
      else if(52 > indlaestKort[i]){
        vaerdiPaaHaand += indlaestKort[i]-39+1;
      }
    }
    if(aiPaaHaand[i]){
      if(13 > indlaestKort[i]){
        aiVaerdiPaaHaand += indlaestKort[i]+1;
      }
      else if(26 > indlaestKort[i]){
        aiVaerdiPaaHaand += indlaestKort[i]-13+1;
      }
      else if(39 > indlaestKort[i]){
        aiVaerdiPaaHaand += indlaestKort[i]-26+1;
      }
      else if(52 > indlaestKort[i]){
        aiVaerdiPaaHaand += indlaestKort[i]-39+1;
      }
    }
    println(aiVaerdiPaaHaand);
  }
}

boolean spilStop;

void tjekSejr(){
  if(spilStop){
    if(vaerdiPaaHaand > 21){
      sejr("dealer");
    }
    else if(aiVaerdiPaaHaand > 21){
      sejr("spiller");
    }
    else if(vaerdiPaaHaand > aiVaerdiPaaHaand){
      sejr("spiller");
    }
    else if(aiVaerdiPaaHaand >= vaerdiPaaHaand){
      sejr("dealer");
    }
    //INDSÆT SEJRSBETINGELSER
    else{
      for(int i = 0; i < 1000; i++){
        println("error");
      }
    }
  }
}

boolean bleh2 = true;
boolean bleh = true;
boolean sejr = false;
void sejr(String hvem){
  sejr = true;
  if(hvem == "spiller"){
    
      println("noice");
      clear();
      fill(255);
      pushMatrix();
      rotate(0.2);
      image(hit_,50,50);
      popMatrix();
      pushMatrix();
      rotate(0.1);
      image(hit_,500,30);
      popMatrix();
      pushMatrix();
      rotate(-0.1);
      image(hit_,230,450);
      popMatrix();
      pushMatrix();
      translate(1000,500);
      rotate(0.3);
      image(hit_,0,0);
      popMatrix();
      rotate(0.3);
      text("ja... du vandt vist", width/2,height/2);
      if(bleh2){
        start.pause();
        daisy.play();
        bleh2 = false;
      }
  }
  if(hvem == "dealer"){
    if(bleh){
      start.pause();
      aiWon.play();
      bleh = false;
      clear();
      imageMode(CENTER);
        pushMatrix();
    translate(0,-600,-2000);
    scale(10);
    image(ai,0,0);
  popMatrix();
    }
    
    println("uff");
    println("ja");

  
  }
}
