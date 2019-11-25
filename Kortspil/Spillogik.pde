boolean[] aiPaaHaand = new boolean[52];
boolean[] paaHaand = new boolean[52];
int vaerdiPaaHaand = 0;
int aiVaerdiPaaHaand = 0;
boolean foersteKort = false;

import processing.sound.*;
SoundFile aiWon;
SoundFile start;

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

boolean bleh = true;
void sejr(String hvem){
  if(hvem == "spiller"){
    
      println("noice");
      setup();
      delay(1000);
    
  }
  if(hvem == "dealer"){
    if(bleh){
      start.pause();
      aiWon.play();
      bleh = false;
    }
    
    println("uff");
    println("ja");

  
  }
}
