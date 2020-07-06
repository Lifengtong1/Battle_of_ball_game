# Appears with mouse click
void setup() {
  size(1280,720);
  drawPig(0, 0);
  
}
void draw(){
  if (mousePressed){
    drawPig(mouseX,mouseY);
  }
}
 void drawPig(int x,int y){
 
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
 //line(x+80,y+235,x+80,y+250);
 //line(x+140,y+235,x+140,y+250);
 endShape(CLOSE);

 //right shoes(yellow)
 /***
 fill(#fff766);
 stroke(#e1ce4d);
 strokeWeight(5);
 beginShape();
 vertex(x+71,y+250);
 bezierVertex(x+71,y+250,x+82,y+250,x+90,y+250);
 bezierVertex(x+90,y+250,x+92,y+263,x+90,y+274);
 bezierVertex(x+90,y+274,x+53,y+274,x+54,y+274);
 bezierVertex(x+54,y+274,x+46,y+256,x+70,y+256);
 endShape(CLOSE);
 ***/
 
 // Right leg (move)
  pushMatrix();
  translate(x + 80, y + 235);
  rotate(PI/5.0);

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
 
 
 //left shoes(yellow)
 /***
 fill(#fff766);
 stroke(#e1ce4d);
 strokeWeight(5);
 beginShape();
 vertex(x+130,y+250);
 bezierVertex(x+130,y+250,x+144,y+250,x+150,y+250);
 bezierVertex(x+150,y+250,x+153,y+263,x+150,y+274);
 bezierVertex(x+150,y+274,x+114,y+274,x+115,y+274);
 bezierVertex(x+115,y+274,x+107,y+256,x+129,y+256);
 endShape(CLOSE);
 ***/
 //left leg (move)
   pushMatrix();
  translate(x + 140,y + 235);
  rotate(PI/-5.0);
  
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
 
}
