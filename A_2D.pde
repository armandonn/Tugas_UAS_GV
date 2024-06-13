PShape arif;
PShape ariff;

float posX = 0;
float posY = 0;
float angle = 0;
float scaleArif = 1.0;
boolean mirrorX = false;
boolean mirrorY = false;

void setup() {
  size(1800,1000);
  arif = createShape();
  arif.beginShape();
  arif.fill(0,0,205);
  arif.vertex(350, 800);
  arif.vertex(250, 800);
  arif.vertex(550, 100);
  arif.vertex(900, 800);
  arif.vertex(800, 800);
  arif.vertex(650, 500);
  arif.vertex(470, 500);
  arif.endShape(CLOSE);
  
  ariff = createShape();
  ariff.beginShape();
  ariff.fill(255,255,255);
  ariff.vertex(500, 400);
  ariff.vertex(550, 280);
  ariff.vertex(600, 400);
  ariff.endShape(CLOSE);
}  

void draw() {
  background(255);
  translate( width /2 + posX, height /2 + posY);
  rotate(radians(angle));
  scale(scaleArif);
  scale(mirrorX ? -1 : 1, mirrorY ? -1 : 1);
  
  shape(arif, -550, -500);
  shape(ariff, -550, -500);
}


void keyPressed(){
  if (keyCode == UP){
    posY -=5;
  }else if (keyCode == DOWN){
    posY +=5;
  }else if (keyCode == LEFT){
    posX -=5;
  }else if (keyCode == RIGHT){
    posX +=5;
  }else if(key == 'W') {
    angle +=5;
  }else if (key == 'C') {
    angle -=5;
  }else if(key == '+') {
    scaleArif += 0.1;
  }else if(key == '-') {
    scaleArif -= 0.1;
  }else if(key == '>'){
    mirrorX = !mirrorX;
  }else if(key == '<'){
    mirrorY = !mirrorY; 
  }
}
