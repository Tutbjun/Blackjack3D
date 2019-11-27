

int aiDrawTime;
int deltaTime;
int lastTime;
void AI(){
  aiDrawTime += deltaTime;
  if(aiDrawTime > 2000){
    aiDraw();
    println("Draw");
    aiDrawTime -= 2000;
    
    
  }
  
  println(aiDrawTime);
}

int endDelay = 3000;
int aiDrawForskydning;
boolean tingting = true;
void aiDraw(){
  if(tingting){
    aiDrawForskydning = trukketKort * 10;
    tingting = false;
  }
  if(aiVaerdiPaaHaand < vaerdiPaaHaand){
    resetAnimation(52-trukketKort, pressedAni);
    rotersum[52-trukketKort][0] = 1.3+PI;;
    vektorsum[52-trukketKort][1] += 00;
    vektorsum[52-trukketKort][2] += 100;
    vektorsum[52-trukketKort][0] = -50+trukketKort*10-aiDrawForskydning;
    aiPaaHaand[52-trukketKort] = true;
    trukketKort++;
  }
  else{
    endDelay -= aiDrawTime;
    if(endDelay < 0){
      spilStop = true;
    }
  }
}
