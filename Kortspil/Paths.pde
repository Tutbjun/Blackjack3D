Kort[] k = new Kort[52];

class Kort{
  Animation Animation = new Animation();
  class Animation{
    Demo Demo = new Demo();
    Draw Draw = new Draw();
    aiDraw aiDraw = new aiDraw();
    class Demo{
      int antalArrayTingTing = 11;
      float[][] Path = new float[antalArrayTingTing][3];
      float PathLength;
      boolean[] finished = new boolean[52];
      
      Demo(){    
        Path[1][0] = 50;
        Path[1][1] = -50;
        Path[1][2] = 0;
        
        PathLength = abs(sqrt(pow(Path[1][0],2)+pow(Path[1][1],2)+pow(Path[1][2],2)));
        
        Path[2][0] = -50;
        Path[2][1] = 0;
        Path[2][2] = 0;
        
        Path[3][0] = -50;
        Path[3][1] = 0;
        Path[3][2] = 0;
        
        Path[4][0] = 0;
        Path[4][1] = 50;
        Path[4][2] = 0;
        
        Path[5][0] = 50;
        Path[5][1] = 0;
        Path[5][2] = 0;
        
        Path[6][0] = 0;
        Path[6][1] = 0;
        Path[6][2] = 50;
        
        Path[7][0] = 0;
        Path[7][1] = 0;
        Path[7][2] = -50;
        
        Path[8][0] = 0;
        Path[8][1] = 0;
        Path[8][2] = -50;
        
        Path[9][0] = 0;
        Path[9][1] = 0;
        Path[9][2] = 50;
        
        Path[10][0] = 0;
        Path[10][1] = 0; //nonsenslinje til at få de til slutpositionen
        Path[10][2] = 1;
        
      }
      //rotation();
    }
    
    //float[][] Rotation = new float[antalArrayTingTing][3];
    /*void rotation(){ ja...
      for(int i1 = antalArrayTingTing; i1 > 0; i1--){
        for(int i2 = 0; i2 < 3; i2++){
          CardDrawRotation[i1][i2] = 
        }
      }
      
      
    }*/
    
  
    class Draw{
      int antalArrayTingTing = 4;
      float[][] Path = new float[antalArrayTingTing][3];
      float[] Rotation = new float[3];
      float PathLength;
      boolean[] finished = new boolean[52];
      
      Draw(){
        
        Path[1][0] = -500;
        Path[1][1] = -50;
        Path[1][2] = 200;
        
        PathLength = abs(sqrt(pow(Path[1][0],2)+pow(Path[1][1],2)+pow(Path[1][2],2)));
        
        Path[2][0] = 0;
        Path[2][1] = 0; //nonsenslinje til at få de til slutpositionen
        Path[2][2] = 1;
        
        Path[3][0] = 0;
        Path[3][1] = 0; //nonsenslinje til at få de til slutpositionen
        Path[3][2] = 1;
        
        Rotation[0] = 0;
        Rotation[1] = 0;
        Rotation[2] = 0;
        
        //rotation();
      }
      
      
    }
    
    class aiDraw{
      int antalArrayTingTing = 4;
      float[][] Path = new float[antalArrayTingTing][3];
      float[] Rotation = new float[3];
      float PathLength;
      boolean[] finished = new boolean[52];
      
      aiDraw(){
        
        Path[1][0] = -500;
        Path[1][1] = -50;
        Path[1][2] = 200;
        
        PathLength = abs(sqrt(pow(Path[1][0],2)+pow(Path[1][1],2)+pow(Path[1][2],2)));
        
        Path[2][0] = 0;
        Path[2][1] = 0; //nonsenslinje til at få de til slutpositionen
        Path[2][2] = 1;
        
        Path[3][0] = 0;
        Path[3][1] = 0; //nonsenslinje til at få de til slutpositionen
        Path[3][2] = 1;
        
        Rotation[0] = 0;
        Rotation[1] = 0;
        Rotation[2] = 0;
        
        //rotation();
      }
      
      
    }
  }
}
