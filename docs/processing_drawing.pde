boolean[] weathersunny = new boolean[365];
boolean mouse = false;

float time = 0;
float timespeed = 0.2;
int day = 0;

PVector pos_p1;
PVector pos_p2;
float p_rot;
float[] pd_p1 = new float[365];
float[] pd_p2 = new float[365];
float[] pb_p1 = new float[365];
float[] pb_p2 = new float[365];

void setup() {
  // Initialize
  size(1280, 720);
  
  // Draw Function
  rainInit(true);
  smokeInit();
  
  pos_p1 = new PVector(450, height - 230);
  pos_p2 = new PVector(200, height - 130);
  
  for(int i = 0; i < 365; i++) {
    int r = int(random(4));
    if(r == 2) {
      weathersunny[i] = false;
    } else {
      weathersunny[i] = true;
    }
    pd_p1[i] = random(-50, 50);
    pd_p2[i] = random(-50, 50);
    
    pb_p1[i] = random(350, 450) + pd_p1[i];
    pb_p2[i] = random(150, 250) + pd_p2[i];
  }
}

void draw() {
  // Time
  time += timespeed;
  if(time > 24) {
    time = 0;
    day ++;
  }
  if(day > 365) {
    day = 0;
  }
  surface.setTitle(str(time));

  // Draw Function
  drawBackground();

  for(int i = 0; i < height; i += 30){
    drawGrass(height / 2 + i);
  }
  
  if(weathersunny[day] == false) {
    drawSun(100, 100, false);
  }

  for(int i = 0; i < 7; i++){
    int w = int(random(width));
    int h = int(random(30, height / 3.5));
    drawCloud(w, h);
  }

  if(weathersunny[day] == true) {
    drawSun(100, 100, true);
  }
  
  //p_rot = 0;
  
  if(mouse == true) {
    int div = 30;
    float pos_p1d = (mouseX - pos_p1.x) / div;
    if((pos_p1.x - mouseX) > 15 || (mouseX - pos_p1.x) > 15) {
      pos_p1.set((pos_p1.x + pos_p1d), pos_p1.y + 3 * sin(frameCount));
      if(p_rot >= 0.3) {
        p_rot--;
      } else {
        p_rot++;
      }
    } else {
      mouse = false;
    };
    float pos_p2d = (mouseX - pos_p2.x) / div;
    if((pos_p2.x - mouseX) > 15 || (mouseX - pos_p2.x) > 15) {
      pos_p2.set((pos_p2.x + pos_p2d), pos_p2.y + 3 * sin(frameCount));
    } else {
      mouse = false;
    };
  };
  
  
  if(weathersunny[day] == false) {
    int div = 10;
    int homex = 1000;
    float pos_p1d = (homex - pos_p1.x) / div;
    if((pos_p1.x - homex) > 15 || (homex - pos_p1.x) > 15) {
      pos_p1.set((pos_p1.x + pos_p1d), pos_p1.y + 4 * sin(frameCount));
      if(p_rot >= 0.3) {
        p_rot--;
      } else {
        p_rot++;
      }
    } else {
      mouse = false;
    };
    float pos_p2d = (homex - pos_p2.x) / div;
    if((pos_p2.x - homex) > 15 || (homex - pos_p2.x) > 15) {
      pos_p2.set((pos_p2.x + pos_p2d), pos_p2.y + 4 * sin(frameCount));
    } else {
      mouse = false;
    };
  };
  
  if(day != 0) {
    if(weathersunny[day - 1] == false) {
      int div = 60;
      float pos_p1d = (pb_p1[day] - pos_p1.x) / div;
      if((pos_p1.x - pb_p1[day]) > 15 || (pb_p1[day] - pos_p1.x) > 15) {
        pos_p1.set((pos_p1.x + pos_p1d), pos_p1.y);
        
      } else {
        mouse = false;
      };
      float pos_p2d = (pb_p2[day] - pos_p2.x) / div;
      if((pos_p2.x - pb_p2[day]) > 15 || (pb_p2[day] - pos_p2.x) > 15) {
        pos_p2.set((pos_p2.x + pos_p2d), pos_p2.y);
      } else {
        mouse = false;
      };
    };
  }
  
  if(weathersunny[day] == true) {
    int div = 80;
    float dest1 = pos_p1.x + pd_p1[day];
    float dest2 = pos_p2.x + pd_p2[day];
    float pos_p1d = (dest1 - pos_p1.x) / div;
    if((pos_p1.x - dest1) > 5 || (dest1 - pos_p1.x) > 5) {
      pos_p1.set((pos_p1.x + pos_p1d), pos_p1.y);
    }
    float pos_p2d = (dest2 - pos_p2.x) / div;
    if((pos_p2.x - dest2) > 5 || (dest2 - pos_p2.x) > 5) {
      pos_p2.set((pos_p2.x + pos_p2d), pos_p2.y);
    }
  };
  
  drawPig1(pos_p1.x, pos_p1.y, p_rot);
  drawPig2(pos_p2.x, pos_p2.y, p_rot);
  
  if(time >= 6 && time < 15){
   drawSmoke();
 }
 
 drawHouse(width - 450, height - 25);
  
  if(mouse == true) {
    drawCarrot(mouseX, mouseY);
  };
  
  drawFence(height - 50);
  
  if(weathersunny[day] == false) {
    drawRain(rainInit(false));
  }
  
  drawTimeShader();
  
}

void mouseReleased() {
  if(mouse == false) {
    mouse = true;
  } else if(mouse == true) {
    mouse = false;
  }

}

void keyReleased() {
  if(key == 'r') {
    weathersunny[day+1] = false;
  }

}

// ---------------------------------------- Shogo ---------------------------------------- //
void drawBackground(){

  // (0, 0, 0) (93,162,162) (93,162,162)

 if(time >= 0 && time < 7){
   float time_a = (time - 5) / 2;
   background(93 * time_a, 162 * time_a, 162 * time_a);
 }

  //(93,162,162)(59,98,234)(-34,-64,72)

 if(time >= 7 && time < 8){
   float time_a = (time - 7) ;
   background(93 + (-34 * time_a), 162 + (-64 * time_a), 162 + (72 * time_a));
 }

 //(59,98,234)(82,255,245)(23,157,11)

 if(time >= 8 && time < 14){
   float time_a = (time - 8) / 6;
   background(59 + (23 * time_a), 98 + (157 * time_a), 234 + (11 * time_a));
 }

 //(82,255,245)(214,160,67)(132,-95,-178)

 if(time >= 14 && time < 16){
   float time_a = (time - 14) / 2;
   background(82 + (132 * time_a), 255 + (-95 * time_a), 245 + (-178 * time_a));
 }

 //(214,160,67)(0,0,0)(-214,-160,-67)

 if(time >= 16 && time < 24){
 float time_a = (time - 18) / 2;
 background(214 + (-214 * time_a),160 + (-160 * time_a),67 + (-67 * time_a));
 }
 
 fill(#A06800);
  //rect(0,0,1280,360);
  rect(0,height / 2,width,height / 2);
}


void drawGrass(int y){
  int[][] pos = new int[width / 2][2];

  // X
  for(int k = 0; k < pos.length; k++){
    pos[k][0] = k * 10;
  }

  // Y
  boolean name = false;
  for(int l = 0; l < pos.length; l++){
    if(name == true){
      pos[l][1] = 30 + y;
      name = false;
    } else if(name == false){
      pos[l][1] = 0 + y;
      name = true;
    }
  }

  // Draw
  for(int m = 0; m < pos.length - 1; m++){
    stroke(#39FA0F);
    line(pos[m][0], pos[m][1], pos[m + 1][0], pos[m + 1][1]);
  }
}
// ---------------------------------------- Subaru ---------------------------------------- //
void drawFence(int y) {
  fill(#58390B);
  noStroke();
  
  for(int i = 0; i <=14; i++){
    int x = width / 14 * i;
  
    beginShape();
    vertex(x,y);
    vertex(x + 20,y);
    vertex(x + 20,y - 75);
    vertex(x,y -100);
    vertex(x - 20,y - 75);
    vertex(x - 20,y);
    vertex(x,y);
    endShape(); 
  
  }

  rect(0,y - 50,1280,10);
  rect(0,y - 30,1280,10);

}

void drawCarrot(float xpos, float ypos) {
  
  pushMatrix();
  translate(xpos, ypos);
  
  fill(#FF4C00);
  
  int d = 20;
  int b1 = 25;
  int b2 = 2;
  
  int x = 0;
  int y1 = 0;
  int y2 = 2 * d;
  
  noStroke();
  beginShape();
  vertex(x, y2);
  bezierVertex(x + b2, y2, x + b1, y1, x, y1);
  bezierVertex(x - b1, y1, x - b2, y2, x, y2);
  endShape();
  
  beginShape();
  fill(#009900);
  vertex(x,y1);
  vertex(x + 5,y1);
  vertex(x + 10, y1 -10);
  vertex(x + 4, y1 -5);
  vertex(x , y1 - 10);
  vertex(x - 4, y1 -5);
  vertex(x - 10, y1 -10);
  vertex(x -5, y1 );
  endShape();
 
 strokeWeight(3);
 beginShape();
 stroke(#FFB793);
 line(x , y1 + 7, x + 7, y1 + 7);
 line(x , y1 + 12 ,x + 7, y1 + 12);
 line(x , y1 + 17, x + 7, y1 + 17);
 endShape();
 
 popMatrix();
 
}

// ---------------------------------------- Kyosuke ---------------------------------------- //
void drawCloud(int x, int y) {
  // Define variables
  PVector pos_center = new PVector(x, y);
  int num_vertex = 0;
  PVector[] pos_vertex = new PVector[0];
  
  // Initialize variables using random function
  num_vertex = int(random(7, 12));
  pos_vertex = new PVector[num_vertex];
  float rad = random(20,40); // Radius of circle
  for(int i = 0; i < num_vertex; i++) {
    float rand = 2.5;
    float posx = cos((2 * PI) / num_vertex * i) * rad * 1.8 + random(0 - rand, rand);
    float posy = sin((2 * PI) / num_vertex * i) * rad * 0.8 + random(0 - rand, rand);
    float csize = random(40, 80);
    pos_vertex[i] = new PVector(posx, posy, csize);
    boolean csize_error = true;
    for(int n = 0; n < 3; n++){
      csize_error = false;
      float pos_x1 = pos_center.x + pos_vertex[i].x;
      float pos_y1 = pos_center.y + pos_vertex[i].y;
      float rad_1 = pos_vertex[i].z / 2;
      float pos_x2 = 0;
      float pos_y2 = 0;
      float rad_2 = 0;
      if(i == 0){
        pos_x2 = pos_center.x + cos((2 * PI) / num_vertex * (i + 1)) * rad * 1.8;
        pos_y2 = pos_center.y + sin((2 * PI) / num_vertex * (i + 1)) * rad * 0.8;
        rad_2 = 20;
      } else {
        pos_x2 = pos_center.x + pos_vertex[i - 1].x;
        pos_y2 = pos_center.y + pos_vertex[i - 1].y;
        rad_2 = pos_vertex[i - 1].z / 2;
      }
      if(dist(pos_x1, pos_y1, pos_x2, pos_y2) > (rad_1 + rad_2 - 5)){
        csize = random(55, 90);
        csize_error = true;
        pos_vertex[i] = new PVector(posx, posy, csize);
      }
      if(csize_error == false){
        break;
      }
    }
  }
  
  // Draw Cloud
  noStroke();

  // Create Cloud: Stroke
  fill(128);
  for(int i = 0; i < num_vertex; i++) {
    float pos_x = pos_center.x + (pos_vertex[i].x * 1.025);
    float pos_y = pos_center.y + (pos_vertex[i].y * 1.025);
    float csize = pos_vertex[i].z * 1.025;
    circle(pos_x, pos_y, csize);
  }

  fill(255);
  // Create Cloud: Inside
  beginShape();
  for(int i = 0; i < num_vertex; i++) {
    float pos_x = pos_center.x + pos_vertex[i].x;
    float pos_y = pos_center.y + pos_vertex[i].y;
    vertex(pos_x, pos_y);
  }
  endShape();

  // Create Cloud: Outside
  for(int i = 0; i < num_vertex; i++) {
    float pos_x = pos_center.x + pos_vertex[i].x;
    float pos_y = pos_center.y + pos_vertex[i].y;
    float csize = pos_vertex[i].z;
    circle(pos_x, pos_y, csize);
  }

  // Create Cloud Shadow
  fill(240);
  for(int i = 0; i < num_vertex; i++) {
    if (pos_vertex[i].y > 0) {
      float pos_x = pos_center.x + (pos_vertex[i].x * 0.8);
      float pos_y = pos_center.y + (pos_vertex[i].y * 0.8);
      float csize = pos_vertex[i].z * 0.8;
      circle(pos_x, pos_y, csize);
    }
  }
}

void drawTimeShader() {
 
  int b = 200;
 
  if (time >= 0 && time < 17){
    float time_a = (time - 5) / 2;
    fill(0, 0, 0, (255 - b) - int((255 - b) * time_a));
  }
 
  if (time >= 17 && time < 24){
    float time_a = (time - 17) / 2;
    fill(0, 0, 0, int((255 - b) * time_a));
  }
  
  noStroke();
  rect(0, 0, width, height);

}

float[] drawRain_x = new float[1];
float[] drawRain_y = new float[1];
int rainInit(boolean setupmode) {
  int n = 400;
  if(setupmode == true) {
      drawRain_x = new float[n];
      drawRain_y = new float[n];
    for(int i = 0; i < n; i++) {
      drawRain_x[i] = random(0, width);
      drawRain_y[i] = random(0 - height, 0);
    }
  }
  return n;
}

void drawRain(int n) {
  for(int i = 0; i < n; i++) {
    pushMatrix();
    translate(drawRain_x[i], drawRain_y[i]);
      fill(#54E3F5, 128);
      int d = 7;
      int b1 = 7;
      int b2 = 2;
      int x = 0;
      int y1 = 2 * d;
      int y2 = 0;
      noStroke();
      beginShape();
      vertex(x, y2);
      bezierVertex(x + b2, y2, x + b1, y1, x, y1);
      bezierVertex(x - b1, y1, x - b2, y2, x, y2);
      endShape();
    popMatrix();
    drawRain_y[i] += 10 / timespeed;
    if(drawRain_y[i] > height) {
      drawRain_x[i] = random(0, width);
      drawRain_y[i] = drawRain_y[i] - height - 20;
    }
  }
}

// ---------------------------------------- Toshiki ---------------------------------------- //
void drawSun(int x, int y, boolean sunny) {
  
  if(sunny == true) {
    fill(#FF8103);
  } else {
    fill(#E06F05);
  }
  noStroke();
  circle(x, y, 100);

  if(sunny == true) {
    stroke(#FF8103);
  } else {
    stroke(#E06F05);
  }
  int num = 8;
  for(int i = 1; i <= num; i++){
    float x1 = x + 60 * cos(2 * PI / num * i);
    float y1 = y + 60 * sin(2 * PI / num * i);

    float x2 = x + 120 * cos(2 * PI / num * i);
    float y2 = y + 120 * sin(2 * PI / num * i);

    line(x1,y1,x2,y2);

  }

}

// ---------------------------------------- Kokuu ---------------------------------------- //
void drawHouse(int x, int y){
  
  x = x - 630;
  y = y - 690;

  float sc = 2.2;
  scale(sc);
  
  noStroke();

  fill(248,250,201);
  quad(x+325,y+300,x+356,y+300,x+356,y+175,x+325,y+175);

  beginShape();
  fill(244,245,180);
  vertex(x+325,y+300);
  vertex(x+200,y+300);
  vertex(x+200,y+175);
  vertex(x+266,y+100);  
  vertex(x+325,y+175);
   endShape(CLOSE);

   fill(246,147,114);
   quad(x+266,y+100,x+295,y+100,x+356,y+175,x+325,y+175);

   stroke(236,249,252);
   strokeWeight(3);
   fill(172,211,223);
   rect(x+223,y+250,28,28);
   rect(x+277,y+250,28,28);
   rect(x+277,y+178,28,28);
   rect(x+223,y+180,28,28);

   line(x+225,y+263,x+247,y+263);
   line(x+235,y+250,x+235,y+278);
   line(x+280,y+263,x+302,y+263);
   line(x+290,y+250,x+290,y+278);
   line(x+280,y+193,x+302,y+192);
   line(x+290,y+179,x+290,y+207);
   line(x+225,y+193,x+248,y+193);
   line(x+235,y+179,x+235,y+207);

   fill(249,249,125);
   stroke(0,0,0);
   strokeWeight(1);
   rect(x+333,y+255,12,45);

   point(x+336,y+283);

   strokeWeight(5);
   line(x+285,y+106,x+285,y+91);

  scale(1 / sc);

}


int smoke_sampling = 100;
float smoke_amplitude = 10;
float smoke_cycle = 5;
float smoke_wavelength = 750;
float smoke_offset_time;
float smoke_offset_time_velocity = TWO_PI/60/smoke_cycle;
PVector smoke_pos;
float smoke_offset_time_eachPoint;
float smoke_offset_time_currentPoint;
void smokeInit() {
 smoke_pos = new PVector();
 smoke_offset_time_eachPoint = TWO_PI / (smoke_wavelength/width * smoke_sampling);
}

void drawSmoke() {
 smoke_offset_time += timespeed / smoke_offset_time_velocity;
 stroke(206,206,206, 35);
 strokeWeight(15);
 for (int i = 0; i < smoke_sampling; i ++) {
   smoke_offset_time_currentPoint = i * smoke_offset_time_eachPoint;
   smoke_pos.x = i+112;
   smoke_pos.y = smoke_amplitude * sin(smoke_offset_time + smoke_offset_time_currentPoint)+1070;
   point(smoke_pos.y, smoke_pos.x);
 }
}

// ---------------------------------------- Fonton ---------------------------------------- //
void drawPig1(float x,float y, float rot){
  
  float sc = 1;
  scale(sc);
  
  x = x - 85;
  y = y - 105;

 //right hand(pink)
 noFill();
 beginShape();
 stroke(#fab7e1);
 strokeWeight(10);
 line(x+46,y+160,x+17,y+143);
 strokeWeight(7);
 line(x+15,y+131,x+17,y+143);
 strokeWeight(6);
 line(x+3,y+143,x+17,y+143);
 strokeWeight(7);
 line(x+11,y+153,x+17,y+143);
 endShape(CLOSE);
 
 
 //leg(pig)
 noFill();
 beginShape();
 stroke(#fdb7e2);
 strokeWeight(8);
 endShape(CLOSE);

 // Right leg (move)
  pushMatrix();
  translate(x + 80, y + 235);
  rotate(rot);
  int x_ = -76;
  int y_ = -231;
  noFill();
  beginShape();
  stroke(#fdb7e2);
  strokeWeight(8);
  line(x_+80, y_+235, x_+80, y_+250);
  endShape(CLOSE);
  
  fill(#fff766);
  stroke(#e1ce4d);
  strokeWeight(5);
  beginShape();
  vertex(x_+71, y_+250);
  bezierVertex(x_+71, y_+250, x_+82, y_+250, x_+90, y_+250);
  bezierVertex(x_+90, y_+250, x_+92, y_+263, x_+90, y_+274);
  bezierVertex(x_+90, y_+274, x_+53, y_+274, x_+54, y_+274);
  bezierVertex(x_+54, y_+274, x_+46, y_+256, x_+70, y_+256);
  endShape(CLOSE);
  
popMatrix();
  //left leg (move)
   pushMatrix();
  translate(x + 140,y + 235);
  rotate(-rot);
  
  int x_l = -137;
  int y_l = -231;
  
  noFill();
  beginShape();
  stroke(#fdb7e2);
  strokeWeight(8);
  line(x_l+140,y_l+235,x_l+140,y_l+250);
  endShape(CLOSE);
  
  fill(#fff766);
  stroke(#e1ce4d);
  strokeWeight(5);
  beginShape();
  vertex(x_l+130,y_l+250);
  bezierVertex(x_l+130,y_l+250,x_l+144,y_l+250,x_l+150,y_l+250);
  bezierVertex(x_l+150,y_l+250,x_l+153,y_l+263,x_l+150,y_l+274);
  bezierVertex(x_l+150,y_l+274,x_l+114,y_l+274,x_l+115,y_l+274);
  bezierVertex(x_l+115,y_l+274,x_l+107,y_l+256,x_l+129,y_l+256);
  endShape(CLOSE);

popMatrix();
 
 //tail(pink)
 beginShape();
 noFill();
 stroke(#fab7e1);
 strokeWeight(5);
 bezier(x+179,y+213,x+193,y+209,x+190,y+198,x+183,y+205);
 bezier(x+183,y+205,x+188,y+211,x+198,y+212,x+202,y+203);
 endShape(CLOSE);
 
 //skirt(red)
 fill(#e9565e);
 stroke(#e62d3f);
 strokeWeight(3);
 beginShape();
 vertex(x+62,y+140);
 bezierVertex(x+60,y+139,x+35,y+183,x+29,y+235);
 bezierVertex(x+29,y+235,x+112,y+235,x+182,y+235);
 bezierVertex(x+182,y+235,x+177,y+188,x+152,y+139);
 endShape(CLOSE);
 
 //left head(pink)
 noFill();
 beginShape();
 stroke(#fab7e1);
 strokeWeight(10);
 line(x+162,y+160,x+196,y+143);
 strokeWeight(7);
 line(x+197,y+132,x+196,y+143);
 strokeWeight(6);
 line(x+211,y+142,x+196,y+143);
 strokeWeight(7);
 line(x+205,y+153,x+196,y+143);
 
 //head(pink)
 stroke(#ec8dc5);
 strokeWeight(3);
 fill(#ffb0df);
 
 beginShape();
 vertex(x+53,y+23);
 bezierVertex(x+53,y+19,x+145,y+35,x+168,y+81);
 bezierVertex(x+168,y+81,x+178,y+104,x+163,y+130);
 bezierVertex(x+163,y+130,x+102,y+185,x+53,y+128);
 bezierVertex(x+53,y+128,x+45,y+111,x+60,y+85);
 bezierVertex(x+60,y+85,x+34,y+64,x+33,y+56);
 endShape(CLOSE);
 
  //nose(pink)
 fill(#ffb0df); 
 strokeWeight(3);
 stroke(#ec8dc5);
 beginShape();
 ellipse(x+41,y+41,39,43);
 fill(#e16da8);
 strokeWeight(8);
 point(x+46,y+39);
 point(x+33,y+36);
 endShape(CLOSE);
 
 //ear(pink)
 strokeWeight(3);
 stroke(#ec8dc5);
 fill(#ffb0df); 
 
 beginShape();
 vertex(x+108,y+33);
 bezierVertex(x+108,y+33,x+107,y+13,x+118,y+5);
 bezierVertex(x+118,y+5,x+135,y+2,x+133,y+17);
 bezierVertex(x+133,y+17,x+133,y+30,x+123,y+42);
 vertex(x+136,y+48);
 bezierVertex(x+136,y+48,x+140,y+29,x+154,y+25);
 bezierVertex(x+154,y+25,x+168,y+24,x+167,y+39);
 bezierVertex(x+167,y+39,x+162,y+50,x+148,y+56); 
 endShape(CLOSE);
 
 //eyes(white&black)
 strokeWeight(3);
 stroke(#ec8dc5);
 fill(#fcfcfd);
 
 beginShape();
 ellipse(x+86,y+45,21,21);
 ellipse(x+114,y+62,22,23);
 stroke(#050505);
 strokeWeight(9);
 point(x+86,y+46);
 strokeWeight(10);
 point(x+115,y+64);
 endShape(CLOSE);
 
 //face(pink)
 
 fill(#ff8cd1);
 strokeWeight(1);
 stroke(#ff8cd1);
 ellipse(x+144,y+102,29,35);
 endShape(CLOSE);
 
 //mouth(dark pink)
 noFill();
 beginShape();
 strokeWeight(4);
 stroke(#d5408b);
 bezier(x+69,y+102,x+73,y+120,x+91,y+127,x+111,y+116);
 endShape(CLOSE);
 //pig head over

  scale(1 / sc);
}

// ---------------------------------------- Naoya ---------------------------------------- //
void drawPig2(float X, float Y, float rot) {
  
  X = X - 80;
  Y = Y - 100;

  float sc = 1;
  scale(sc);

//pig face
 beginShape();
 fill(251, 178, 225, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(4);
 vertex(X+55, Y+39);
 bezierVertex(X+55, Y+39, X+112, Y+45, X+119, Y+65);
 bezierVertex(X+119, Y+65, X+130, Y+80, X+125, Y+99);
 bezierVertex(X+125, Y+99, X+120, Y+110, X+114, Y+113);
 bezierVertex(X+114, Y+113, X+102, Y+117, X+93, Y+117);
 bezierVertex(X+93, Y+117, X+82, Y+117, X+73, Y+113);
 bezierVertex(X+73, Y+113, X+65, Y+107, X+60, Y+102);
 bezierVertex(X+60, Y+102, X+59, Y+96, X+60, Y+89);
 bezierVertex(X+60, Y+89, X+60, Y+86, X+62, Y+84);
 bezierVertex(X+62, Y+84, X+57, Y+83, X+54, Y+82);
 bezierVertex(X+54, Y+82, X+50, Y+81, X+45, Y+71);
 bezierVertex(X+45, Y+71, X+42, Y+70, X+42, Y+70);
 endShape(CLOSE);
 //pig nose
 beginShape();
 fill(251, 178, 225, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(4);
 ellipse(X+47, Y+53, 25, 33);
 strokeWeight(4);
 fill(210, 104, 166, 255);
 point(X+42, Y+51);
 point(X+51, Y+53);
 endShape(CLOSE);
 //pig left ear
 beginShape();
 fill(255, 178, 227, 255);
 stroke(220, 145, 204, 255);
 strokeWeight(3);
 vertex(X+92, Y+46);
 bezierVertex(X+92, Y+46, X+92, Y+43, X+93, Y+41);
 bezierVertex(X+93, Y+41, X+94, Y+38, X+95, Y+37);
 bezierVertex(X+95, Y+37, X+96, Y+36, X+97, Y+35);
 bezierVertex(X+97, Y+35, X+99, Y+34, X+100, Y+34);
 bezierVertex(X+100, Y+34, X+101, Y+34, X+102, Y+36);
 bezierVertex(X+102, Y+36, X+104, Y+39, X+104, Y+41);
 bezierVertex(X+104, Y+41, X+104, Y+44, X+104, Y+48);
 bezierVertex(X+104, Y+48, X+103, Y+49, X+103, Y+51);
 endShape(CLOSE);
 //pig right ear
 beginShape();
 fill(255, 178, 227, 255);
 stroke(220, 145, 204, 255);
 strokeWeight(3);
 vertex(X+107, Y+53);
 bezierVertex(X+107, Y+53, X+108, Y+50, X+109, Y+48);
 bezierVertex(X+109, Y+48, X+110, Y+46, X+111, Y+45);
 bezierVertex(X+111, Y+45, X+113, Y+43, X+115, Y+42);
 bezierVertex(X+115, Y+42, X+117, Y+41, X+120, Y+41);
 bezierVertex(X+120, Y+41, X+122, Y+42, X+124, Y+44);
 bezierVertex(X+124, Y+44, X+125, Y+47, X+124, Y+50);
 bezierVertex(X+124, Y+50, X+123, Y+52, X+122, Y+55);
 bezierVertex(X+122, Y+55, X+120, Y+57, X+116, Y+60);
 endShape(CLOSE);
 //pig body
 beginShape();
 fill(101, 150, 217, 255);
 stroke(68, 123, 179, 255);
 strokeWeight(3);
 vertex(X+60, Y+106);
 bezierVertex(X+60, Y+106, X+59, Y+111, X+59, Y+120);
 bezierVertex(X+59, Y+120, X+59, Y+124, X+59, Y+129);
 bezierVertex(X+59, Y+129, X+61, Y+132, X+63, Y+136);
 bezierVertex(X+63, Y+136, X+65, Y+138, X+67, Y+141);
 bezierVertex(X+67, Y+141, X+69, Y+143, X+72, Y+144);
 bezierVertex(X+72, Y+144, X+76, Y+147, X+80, Y+148);
 bezierVertex(X+80, Y+148, X+83, Y+148, X+87, Y+149);
 bezierVertex(X+87, Y+149, X+90, Y+149, X+97, Y+149);
 bezierVertex(X+97, Y+149, X+101, Y+149, X+106, Y+148);
 bezierVertex(X+106, Y+148, X+110, Y+147, X+115, Y+146);
 bezierVertex(X+115, Y+146, X+118, Y+144, X+122, Y+142);
 bezierVertex(X+122, Y+142, X+125, Y+139, X+127, Y+137);
 bezierVertex(X+127, Y+137, X+130, Y+134, X+132, Y+130);
 bezierVertex(X+132, Y+130, X+133, Y+126, X+134, Y+121);
 bezierVertex(X+134, Y+121, X+133, Y+116, X+132, Y+112);
 bezierVertex(X+132, Y+112, X+128, Y+107, X+124, Y+102);
 endShape(CLOSE);
 //pig left arm
 beginShape();
 fill(255, 175, 234, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(3);
 vertex(X+58, Y+113);
 bezierVertex(X+58, Y+113, X+54, Y+114, X+51, Y+115);
 bezierVertex(X+51, Y+115, X+45, Y+117, X+43, Y+114);
 bezierVertex(X+43, Y+114, X+41, Y+113, X+38, Y+111);
 bezierVertex(X+38, Y+111, X+36, Y+112, X+35, Y+113);
 bezierVertex(X+35, Y+113, X+36, Y+115, X+38, Y+116);
 bezierVertex(X+38, Y+116, X+40, Y+118, X+38, Y+118);
 bezierVertex(X+38, Y+118, X+36, Y+118, X+34, Y+119);
 bezierVertex(X+34, Y+119, X+35, Y+121, X+36, Y+123);
 bezierVertex(X+36, Y+123, X+40, Y+124, X+41, Y+122);

bezierVertex(X+41, Y+122, X+40, Y+125, X+41, Y+128);
 bezierVertex(X+41, Y+128, X+42, Y+129, X+44, Y+130);
 bezierVertex(X+44, Y+130, X+46, Y+127, X+46, Y+121);
 bezierVertex(X+46, Y+121, X+51, Y+120, X+58, Y+118);
 endShape(CLOSE);
 //pig right arm
 beginShape();
 fill(255, 175, 234, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(3);
 vertex(X+123, Y+111);
 bezierVertex(X+123, Y+111, X+132, Y+114, X+141, Y+116);
 bezierVertex(X+141, Y+116, X+145, Y+113, X+149, Y+112);
 bezierVertex(X+149, Y+112, X+151, Y+112, X+150, Y+115);
 bezierVertex(X+150, Y+115, X+149, Y+116, X+146, Y+117);
 bezierVertex(X+146, Y+117, X+149, Y+120, X+152, Y+120);
 bezierVertex(X+152, Y+120, X+152, Y+122, X+149, Y+124);
 bezierVertex(X+149, Y+124, X+148, Y+124, X+145, Y+123);
 bezierVertex(X+145, Y+123, X+146, Y+127, X+144, Y+129);
 bezierVertex(X+144, Y+129, X+143, Y+130, X+141, Y+128);
 bezierVertex(X+141, Y+128, X+141, Y+128, X+140, Y+121);
 bezierVertex(X+140, Y+121, X+133, Y+119, X+124, Y+116);
 endShape(CLOSE);
 pushMatrix();
 translate(X + 78, Y + 146);
 rotate(rot);
 int x_r = -80;
 int y_r = -140;
 //pig right leg
 beginShape();
 fill(249, 178, 220, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(3);
 vertex(x_r+78, y_r+146);
 bezierVertex(x_r+78, y_r+146, x_r+79, y_r+154, x_r+82, y_r+154);
 bezierVertex(x_r+82, y_r+154, x_r+82, y_r+153, x_r+82, y_r+148);
 bezierVertex(x_r+82, y_r+148, x_r+81, y_r+147, x_r+81, y_r+146);
 bezierVertex(x_r+81, y_r+146,x_r+80,y_r+146,x_r+78, y_r+146);
 endShape(CLOSE);
 //pig right shoe
 beginShape();
 fill(4, 6, 5, 255);
 stroke(4, 6, 5, 255);
 strokeWeight(3);
 vertex(x_r+78, y_r+154);
 bezierVertex(x_r+78, y_r+154, x_r+71, y_r+153, x_r+68, y_r+153);
 bezierVertex(x_r+68, y_r+153, x_r+65, y_r+154, x_r+64, y_r+156);
 bezierVertex(x_r+64, y_r+156, x_r+67, y_r+159, x_r+73, y_r+159);
 bezierVertex(x_r+73, y_r+159, x_r+80, y_r+159, x_r+83, y_r+157);
 bezierVertex(x_r+83, y_r+157, x_r+84, y_r+155, x_r+81, y_r+154);
 endShape(CLOSE);
 popMatrix();
 pushMatrix();
 translate(X+106, Y+137);
 rotate(-rot);
 int x_l=-110;
 int y_l=-130;
 //pig left leg
 beginShape();
 fill(255, 175, 234, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(3);
 vertex(x_l+106, y_l+137);
 bezierVertex(x_l+106, y_l+137, x_l+106, y_l+145, x_l+107, y_l+154);
 bezierVertex(x_l+107, y_l+154, x_l+109, y_l+155, x_l+111, y_l+154);
 bezierVertex(x_l+111, y_l+154, x_l+111, y_l+149, x_l+111, y_l+137);
 endShape(CLOSE);
 //pig left shoe
 beginShape();
 fill(4, 6, 5, 255);
 stroke(4, 6, 5, 255);
 strokeWeight(3);
 vertex(x_l+107, y_l+153);
 bezierVertex(x_l+107, y_l+153, x_l+100, y_l+153, x_l+95, y_l+153);
 bezierVertex(x_l+95, y_l+153, x_l+94, y_l+156, x_l+95, y_l+157);
 bezierVertex(x_l+95, y_l+157, x_l+97, y_l+159, x_l+103, y_l+159);
 bezierVertex(x_l+103, y_l+159, x_l+111, y_l+158, x_l+113, y_l+158);
 bezierVertex(x_l+113, y_l+158, x_l+113, y_l+154, x_l+110, y_l+154);
 endShape(CLOSE);
 popMatrix();
 //pig left eyes
 beginShape();
 fill(225, 247, 255, 255);
 stroke(225, 147, 189, 255);
 strokeWeight(3);
 ellipse(X+79, Y+57, 15, 16);
 endShape(CLOSE);
 //pig left eye2
 beginShape();
 fill(6, 12, 12, 255);
 stroke(6, 12, 12, 255);
 strokeWeight(3);
 ellipse(X+79, Y+56, 5, 5);
 endShape(CLOSE);
 //pig right eye
 beginShape();
 fill(225, 247, 255, 255);
 stroke(225, 147, 189, 255);
 strokeWeight(3);
 ellipse(X+94, Y+67, 15, 16);
 endShape(CLOSE);
 //pig right eye2
 beginShape();
 fill(6, 12, 12, 255);
 stroke(6, 12, 12, 255);
 strokeWeight(3);
 ellipse(X+93, Y+66, 5, 5);
 endShape(CLOSE);
 //pig tail
 beginShape();
 fill(249, 190, 218, 255);
 stroke(252, 164, 216, 255);
 strokeWeight(3);
 vertex(X+125, Y+139);
 bezierVertex(X+129, Y+139, X+130, Y+143, X+134, Y+145);
 bezierVertex(X+134, Y+145, X+136, Y+146, X+139, Y+144);
 bezierVertex(X+139, Y+144, X+140, Y+146, X+144, Y+148);
bezierVertex(X+144, Y+148, X+149, Y+145, X+152, Y+142);
 bezierVertex(X+152, Y+142, X+153, Y+140, X+151, Y+139);
 bezierVertex(X+151, Y+139, X+147, Y+139, X+145, Y+143);
 bezierVertex(X+145, Y+143, X+142, Y+143, X+144, Y+140);
 bezierVertex(X+136, Y+134, X+133, Y+138, X+133, Y+140);
 bezierVertex(X+133, Y+140, X+141, Y+143, X+137, Y+141);
 bezierVertex(X+137, Y+141, X+131, Y+141, X+127, Y+136);
 endShape(CLOSE);
 //pig cheek
 beginShape();
 fill(255, 139, 209, 255);
 stroke(255, 139, 209, 255);
 strokeWeight(3);
 ellipse(X+106, Y+91, 16, 18);
 endShape(CLOSE);
 //pig mouse
 beginShape();
 fill(179, 83, 131, 255);
 stroke(179, 83, 131, 255);
 strokeWeight(3);
 vertex(X+64, Y+87);
 bezierVertex(X+64, Y+87, X+63, Y+91, X+64, Y+95);
 bezierVertex(X+64, Y+95, X+66, Y+99, X+69, Y+102);
 bezierVertex(X+69, Y+102, X+73, Y+102, X+76, Y+102);
 bezierVertex(X+76, Y+102, X+79, Y+101, X+83, Y+99);
 bezierVertex(X+83, Y+99, X+85, Y+96, X+86, Y+92);
 bezierVertex(X+86, Y+91, X+85, Y+88, X+81, Y+90);
 bezierVertex(X+81, Y+91, X+77, Y+91, X+73, Y+92);
 bezierVertex(X+73, Y+92, X+69, Y+90, X+67, Y+87);
 endShape(CLOSE);
 //pig mouse2
 beginShape();
 fill(234, 224, 233, 255);
 stroke(234, 224, 233, 255);
 strokeWeight(3);
 vertex(X+66, Y+92);
 bezierVertex(X+66, Y+92, X+66, Y+95, X+68, Y+97);
 bezierVertex(X+68, Y+97, X+72, Y+99, X+75, Y+99);
 bezierVertex(X+75, Y+99, X+79, Y+97, X+81, Y+94);
 bezierVertex(X+81, Y+94, X+76, Y+94, X+73, Y+94);
 bezierVertex(X+73, Y+94, X+68, Y+93, X+66, Y+92);
 endShape(CLOSE);

}
