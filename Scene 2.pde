int numDrops = 500;
float[] dropX = new float[numDrops];
float[] dropY = new float[numDrops];
float[] dropSpeed = new float[numDrops];
float mov;
float waveOffset = 0;

void setup() {
  size(500, 500);
  background(255);
  mov = 1;

  for (int i = 0; i < numDrops; i++) {
    dropX[i] = random(width);
    dropY[i] = random(height);
    dropSpeed[i] = random(2, 5);
  }
}

void draw() {
  mov = mov + 1;
  
  fill(60); // langit
  rect(0, 0, 500, 250);
  
  laut();
  kapal();
  awan();
  hujan();
  
  fill(60 + mouseY / 2, 180 - mouseY, 210 - mouseY, mov - 2800);
  rect(420, 165, 100, 40);
}

void laut() {
  fill(0, 65, 130);
  rect(0, 250, 500, 5);

  fill(0, 50, 100);
  rect(0, 255, 500, 10);
  
  fill(0, 40, 80);
  rect(0, 265, 500, 20);

  fill(0, 30, 60);
  rect(0, 285, 500, 35);

  fill(0, 22, 45);
  rect(0, 320, 500, 70);

  fill(0, 15, 30);
  rect(0, 390, 500, 110);
  
  // Drawing the waves
  stroke(255);
  noFill();
  strokeWeight(2);
  for (int i = 0; i < width; i++) {
    float waveHeight = sin((i * 0.1) + waveOffset) * 10;
    line(i, 285 + waveHeight, i, 285 + waveHeight + 5);
  }
  
  // ombak
  stroke(255, 255, 255, 150); // warna putih ombak
  strokeWeight(4);
  for (int i = 0; i < width; i += 10) {
    float bigWaveHeight = sin((i * 0.1) + waveOffset * 0.5) * 20; 
    line(i, 285 + bigWaveHeight - 10, i, 285 + bigWaveHeight + 15);
  }
  
  waveOffset += 0.05;
}

void kapal() {
  fill(255);
  triangle(30 + mov / 6, 241, 90 + mov / 6 - mouseX / 40, 240, 28 + mov / 6, 150); 
  triangle(30 + mov / 6, 241, -10 + mov / 6 - mouseX / 40, 242 + mouseX / 400, 25 + mov / 6, 150); 

  fill(120, 90, 70);
  quad(-20 + mov / 6, 250, 90 + mov / 6, 250, 98 + mov / 6, 210, -30 + mov / 6, 215); 

  // membuat orang di atas kapal
  fill(255, 224, 189); // warna kulit
  ellipse(35 + mov / 6, 215, 15, 15); // kepala

  fill(0, 0, 255);
  rect(30 + mov / 6, 225, 10, 20); // badan

  // tangan
  fill(255, 224, 189);
  rect(25 + mov / 6, 225, 5, 15);
  rect(40 + mov / 6, 225, 5, 15);

  // kaki
  fill(0, 0, 255);
  rect(30 + mov / 6, 245, 5, 15);
  rect(35 + mov / 6, 245, 5, 15);

  // caping
  fill(139, 69, 19);
  triangle(35 + mov / 6, 200, 25 + mov / 6, 215, 45 + mov / 6, 215);

  // pancingan
  stroke(0);
  strokeWeight(2);
  line(40 + mov / 6, 225, 70 + mov / 6, 180);

  strokeWeight(1);
  line(70 + mov / 6, 180, 80 + mov / 6, 250);

  fill(255, 0, 0);
  ellipse(80 + mov / 6, 250, 10, 5);
  triangle(85 + mov / 6, 250, 90 + mov / 6, 245, 90 + mov / 6, 255);
}

void awan() {
  fill(255);

  ellipse(340 + 125 - mov / 10, 100, 40, 40);
  ellipse(450 + 125 - mov / 10, 90, 60, 60);
  ellipse(390 + 125 - mov / 10, 80, 80, 80);
  rect(340 + 125 - mov / 10, 100, 110, 20);

  ellipse(110 + 125 - mov / 10, 110, 80, 80);
  ellipse(50 + 125 - mov / 10, 120, 60, 60);
  ellipse(160 + 125 - mov / 10, 130, 40, 40);
  rect(46 + 125 - mov / 10, 130, 110, 20);
}

void hujan() {
  stroke(0, 0, 255);
  for (int i = 0; i < numDrops; i++) {
    line(dropX[i], dropY[i], dropX[i], dropY[i] + 10);
    dropY[i] += dropSpeed[i];
    if (dropY[i] > height) {
      dropY[i] = 0;
      dropX[i] = random(width);
    }
  }
}
