import 
ddf.minim.*;
Minim minim;
AudioPlayer button,playmusic;

float x;
float y; 
float followspeed = 0.015;//マウスにコントロールさせるボールのフォロースピード
int r = 10;//マウスによるボールの半径
int gameScreen = 0; 
float[] x_ = new float [20]; 
float[] y_ = new float [20]; 
int[] r_ = new int [20]; 
float[] speedx = new float [20]; 
float[] speedy = new float [20]; 
float a = 0.05;//ほかのボールの移動速度
PImage img;


void setup() { 
  size (800, 600); 
  
  minim = new Minim(this);
  button = minim.loadFile("button.mp3");


  img = loadImage("moon.png");
  
  x = (width/2); 
  y = (height/2);
  
 //最初マウスによるボールは真ん中から動く
  
  for (int i=5; i<20; i++) { 
   x_[i] = random (0, width); 
   y_[i] = random (0, height); 
   r_[i] = int (random (0, 30));
   
 //ほかのボールは20以内ランダムで半径、位置を決まる
   
  } 
} 

void draw () {

  if (gameScreen == 0) {

    startgameScreen();
    
  } else if (gameScreen == 1) {

     gameplayScreen();
     
    
  } else if (gameScreen == 2) {
    
     gameoverScreen();
    
  } else if (gameScreen == 3) {
    
      winScreen();
      
   }
}


void mouseClicked() {

  if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height/1.3-25 && mouseY<height/1.3+25 ) {
     //マウスは指定範囲でクリック 
    button.play();
    gameScreen = 1;
    
  }
} 
 
 
void startgameScreen() {

  background(#d686fa);//紫色
  
  fill(#fadf86);//黄色
  textAlign(CENTER);//横位置を指定する関数
  textSize(60);//文字の大きさ
  text("Battle of Game", width/2, height/3);

  image(img, width/2.7, height/2.5, width/4, height/4);

  fill(#5ca7b6);//水色
  noStroke();
  rectMode(CENTER);//中心による長方形を書く
  rect(width/2, height/1.3, 150, 50, 6);// '6' 長方形の丸角度
  fill(236, 240, 241);
  textSize(28);                       
  text("start", width/2, height/1.28);
}


void gameplayScreen () {

  background (#497db2); //青色
  noStroke();
  smooth();
  ellipseMode (CENTER);
  
  fill (#d686fa); //移动球的颜色
  for (int i=0; i<20; i++) { 
    ellipse (x_[i], y_[i], r_[i]*2, r_[i]*2);//ほかのボールをランダムで中心点や半径を決める、rx2は大きなボールもあるために
  } 
  
  fill (254, 252, 150);//控制球的颜色 
  ellipse (x, y, r*2, r*2); 
  for (int i=0; i<20; i++) {
    
   float z=(x_[i]-x)*(x_[i]-x) + (y_[i]-y)*(y_[i]-y) - (r_[i]+r)*(r_[i]+r); 
    
    if (z<0 && r_[i]>r) {  
    //もしぶつかったボールは自分より大きいなら、gameover
      gameScreen = 2;
   
  }
} 

  float targetX = mouseX; 
  float targetY = mouseY; 
  x = x + (targetX - x) * followspeed; 
  y = y + (targetY - y) * followspeed; 
  //ボールをマウスに連れて移動
  
  for (int i=0; i<20; i++) { 
     move (i);
  } 
  for (int i=0; i<20; i++) { 
    if ((x_[i]-x)*(x_[i]-x)+(y_[i]-y)*(y_[i]-y)-(r_[i]+r)*(r_[i]+r)<0 && r_[i]<r) { 
      r = int (sqrt (r*r + r_[i]*r_[i])); //sqrt 平方根を計算する関数 面積
      r_[i] = 0;
     //もしボールは自分より小さいなら、それを食べて大きくなる
    }
  } 
  int sum = 100; 
  for (int i=0; i<20; i++) { 
    sum = sum + r_[i];
  } 
  if (sum == 100) {
    
    winScreen();

  }
}


void move (int i) { 
  speedx[i] += random (-a, a); 
  speedy[i] += random (-a, a); //ほかのボールの速度を-a~aまでランダムで決める
  x_[i] += speedx[i]; 
  y_[i] += speedy[i]; 
  if (x_[i]<-10) { 
    x_[i] += width;
  } 
  if (x_[i] > width+10) { 
    x_[i] -= width;
  } 
  if (y_[i] < -10) { 
    y_[i] += height;
  } 
  if (y_[i] > height+10) { 
    y_[i] -= height;
  }
} 


void gameoverScreen() { 
  fill (#f02828); 
  textSize (65); 
  textAlign(CENTER); 
  text ("Game Over", width/2, height/2);
}


void winScreen() { 
  fill (255); 
  textSize (65); 
  textAlign(CENTER); 
  text ("Congratulation!", width/2, height/2); 
  textSize (30); 
  text ("Bacterial Cleared!", width/2, height/2+50);
}
