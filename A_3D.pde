PShape A;
float posX = 0;
float posY = 0;
float pitch = 0;
float yaw = 0;
float roll = 0;
float scaleA = 1.0;
boolean mirrorX = false;
boolean mirrorY = false;
boolean upPressed, downPressed, leftPressed, rightPressed, ltPressed, gtPressed;

void setup() {
  size(1000, 800, P3D);
  A = createShape(GROUP);

  // Huruf A bagian depan
  PShape Adepan = createShape();
  Adepan.beginShape();
  Adepan.vertex(100, 0, 0);
  Adepan.vertex(0, 300, 0);  
  Adepan.vertex(60, 300, 0);  
  Adepan.vertex(130, 70, 0);
  Adepan.vertex(200, 300, 0);
  Adepan.vertex(260, 300, 0);
  Adepan.vertex(160, 0, 0);
  Adepan.endShape(CLOSE);
  
  PShape Ahorizontaldepan = createShape();
  Ahorizontaldepan.beginShape();
  Ahorizontaldepan.vertex(100, 170, 0);
  Ahorizontaldepan.vertex(81, 230, 0);
  Ahorizontaldepan.vertex(179, 230, 0);
  Ahorizontaldepan.vertex(160, 170, 0);
  Ahorizontaldepan.endShape(CLOSE);

  // Huruf A bagian belakang
  PShape Abelakang = createShape();
  Abelakang.beginShape();
  Abelakang.vertex(100, 0, -50);
  Abelakang.vertex(0, 300, -50);  
  Abelakang.vertex(60, 300, -50);  
  Abelakang.vertex(130, 70, -50);
  Abelakang.vertex(200, 300, -50);
  Abelakang.vertex(260, 300, -50);
  Abelakang.vertex(160, 0, -50);
  Abelakang.endShape(CLOSE);
  
  PShape Ahorizontalbelakang = createShape();
  Ahorizontalbelakang.beginShape();
  Ahorizontalbelakang.vertex(100, 170, -50);
  Ahorizontalbelakang.vertex(81, 230, -50);
  Ahorizontalbelakang.vertex(179, 230, -50);
  Ahorizontalbelakang.vertex(160, 170, -50);
  Ahorizontalbelakang.endShape(CLOSE);

  // Mengatur ketebalan atau lebar dari huruf 3D
  PShape A1 = createShape();
  A1.beginShape();
  addDepth(A1, 100, 0, 0, 0, 300, 0, 0, 300, -50, 100, 0, -50);
  A1.endShape(CLOSE);

  PShape A2 = createShape();
  A2.beginShape();
  addDepth(A2, 0, 300, 0, 60, 300, 0, 60, 300, -50, 0, 300, -50);
  A2.endShape(CLOSE);

  PShape A3 = createShape();
  A3.beginShape();
  addDepth(A3, 60, 300, 0, 130, 70, 0, 130, 70, -50, 60, 300, -50);
  A3.endShape(CLOSE);

  PShape A4 = createShape();
  A4.beginShape();
  addDepth(A4, 130, 70, 0, 200, 300, 0, 200, 300, -50, 130, 70, -50);
  A4.endShape(CLOSE);

  PShape A5 = createShape();
  A5.beginShape();
  addDepth(A5, 200, 300, 0, 260, 300, 0, 260, 300, -50, 200, 300, -50);
  A5.endShape(CLOSE);

  PShape A6 = createShape();
  A6.beginShape();
  addDepth(A6, 260, 300, 0, 160, 0, 0, 160, 0, -50, 260, 300, -50);
  A6.endShape(CLOSE);

  PShape A7 = createShape();
  A7.beginShape();
  addDepth(A7, 160, 0, 0, 100, 0, 0, 100, 0, -50, 160, 0, -50);
  A7.endShape(CLOSE);

  PShape A8 = createShape();
  A8.beginShape();
  addDepth(A8, 100, 170, 0, 160, 170, 0, 160, 170, -50, 100, 170, -50);
  A8.endShape(CLOSE);

  PShape A9 = createShape();
  A9.beginShape();
  addDepth(A9, 81, 230, 0, 179, 230, 0, 179, 230, -50, 81, 230, -50);
  A9.endShape(CLOSE);

  A.addChild(Adepan);
  A.addChild(Ahorizontaldepan);
  A.addChild(Abelakang);
  A.addChild(Ahorizontalbelakang);
  A.addChild(A1);
  A.addChild(A2);
  A.addChild(A3);
  A.addChild(A4);
  A.addChild(A5);
  A.addChild(A6);
  A.addChild(A7);
  A.addChild(A8);
  A.addChild(A9);

  centerObject(A);
}

void draw() {
  background(220);
  translate(width / 2 + posX, height / 2 + posY, 0);
  noStroke();

  if (upPressed) pitch -= radians(1);
  if (downPressed) pitch += radians(1);
  if (leftPressed) yaw -= radians(1);
  if (rightPressed) yaw += radians(1);
  if (ltPressed) roll -= radians(1);
  if (gtPressed) roll += radians(1);

  rotateX(pitch);
  rotateY(yaw);
  rotateZ(roll);
  scale(mirrorX ? -1 * scaleA : scaleA, mirrorY ? -1 * scaleA : scaleA, scaleA);
  shape(A);
}

void keyPressed() {
  if (key == 'w') upPressed = true;
  if (key == 's') downPressed = true;
  if (key == 'a') leftPressed = true;
  if (key == 'd') rightPressed = true;
  if (key == 'q') ltPressed = true;
  if (key == 'e') gtPressed = true;
  if (key == '+') scaleA += 0.1;
  if (key == '-') scaleA -= 0.1;
  if (key == '>') mirrorX = !mirrorX;
  if (key == '<') mirrorY = !mirrorY;
}

void keyReleased() {
  if (key == 'w') upPressed = false;
  if (key == 's') downPressed = false;
  if (key == 'a') leftPressed = false;
  if (key == 'd') rightPressed = false;
  if (key == 'q') ltPressed = false;
  if (key == 'e') gtPressed = false;
}

void addDepth(PShape AN, float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x4, float y4, float z4){
  AN.vertex(x1, y1, z1);
  AN.vertex(x2, y2, z2);
  AN.vertex(x3, y3, z3);
  AN.vertex(x4, y4, z4);
  AN.vertex(x1, y1, z1);
}

void centerObject(PShape obj) {
  float minX = Float.MAX_VALUE;
  float minY = Float.MAX_VALUE;
  float minZ = Float.MAX_VALUE;
  float maxX = Float.MIN_VALUE;
  float maxY = Float.MIN_VALUE;
  float maxZ = Float.MIN_VALUE;

  for (int i = 0; i < obj.getChildCount(); i++) {
    PShape child = obj.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++) {
      PVector v = child.getVertex(j);
      minX = min(minX, v.x);
      minY = min(minY, v.y);
      minZ = min(minZ, v.z);
      maxX = max(maxX, v.x);
      maxY = max(maxY, v.y);
      maxZ = max(maxZ, v.z);
    }
  }

  float centerX = (minX + maxX) / 2;
  float centerY = (minY + maxY) / 2;
  float centerZ = (minZ + maxZ) / 2;

  obj.resetMatrix();
  obj.translate(-centerX, -centerY, -centerZ);
}
