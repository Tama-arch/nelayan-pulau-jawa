
float boatX = 200;  // Posisi awal X kapal
float boatY = height +200;  // Posisi awal Y kapal
float boatSpeed = 0.2;  // Kecepatan kapal yang lebih lambat
float sunY = 100;  // Posisi Y matahari
float[] personX = {200, 400, 600, 700};  // Posisi X orang
color[] shirtColors = {color(0, 255, 0), color(0, 0, 255), color(255, 0, 0), color(255, 255, 0)};  // Warna baju orang

boolean showVillageScene = false;
int transitionStartTime;

void setup() {
  size(800, 600);  // Ukuran kanvas
  transitionStartTime = millis();  // Catat waktu awal transisi
}

void draw() {
  background(255, 140, 0);  // Warna langit sore
  
  // Menggambar matahari terbenam
  fill(255, 69, 0);
  ellipse(700, sunY, 80, 80);
  
  // Menggambar awan
  drawClouds();
  
  if (!showVillageScene) {
    // Menggerakkan kapal naik-turun
    boatY += boatSpeed; // Menggerakkan kapal ke atas
    
    // Jika kapal mencapai ketinggian tertentu, reset ke posisi awal
    if (boatY >= height - 110) {
      boatY = height - 110;
      boatSpeed = 0; // Menghentikan pergerakan kapal
      transitionStartTime = millis();  // Catat waktu awal transisi scene
      showVillageScene = true;  // Aktifkan scene desa
    }
  
    // Menggambar laut
    drawSea();
  
    // Menggambar pantai
    fill(255, 223, 186);
    rect(0, height - 100, width, 100);
  
    // Menggambar kapal
    drawBoat(boatX, boatY);
  
    // Menggambar orang-orang yang membawa ikan
    for (int i = 0; i < 4; i++) {
      drawPersonWithFish(personX[i], height - 120, shirtColors[i]);
    }
  } else {
    // Scene desa di pinggir pantai
    drawVillageScene();
    
    // Transisi setelah 5 detik
    int elapsedTime = millis() - transitionStartTime;
    if (elapsedTime > 5000) {
      // Reset ke awal atau lakukan tindakan setelah transisi selesai
      // Misalnya, kembali ke scene sebelumnya atau lanjutkan ke aksi berikutnya
    }
  }
}

void drawBoat(float x, float y) {
  // Badan kapal
  fill(139, 69, 19);
  beginShape();
  vertex(x + 0, y + 20);
  vertex(x + 30, y);
  vertex(x - 30, y);
  endShape(CLOSE);
  
  // Dek kapal
  fill(165, 42, 42);
  rect(x - 30, y - 30, 60, 30);
  
  // Tiang layar
  stroke(0);
  strokeWeight(3);
  line(x, y - 30, x, y - 80);
  
  // Layar kapal
  fill(255);
  triangle(x, y - 80, x, y - 30, x + 30, y - 55);
  triangle(x, y - 80, x, y - 30, x - 30, y - 55);
  
  // Kapal bagian atas
  fill(139, 69, 19);
  rect(x - 15, y - 40, 30, 10);
}

void drawPersonWithFish(float x, int y, color shirtColor) {
  fill(255, 200, 200);
  ellipse(x, y, 20, 20);  // Kepala
  
  fill(shirtColor);
  rect(x - 10, y + 10, 20, 30);  // Badan
  
  fill(0);
  rect(x - 10, y + 40, 5, 30);  // Kaki kiri
  rect(x + 5, y + 40, 5, 30);  // Kaki kanan
  
  line(x - 10, y + 25, x - 30, y + 15);  // Tangan kiri
  line(x + 10, y + 25, x + 30, y + 15);  // Tangan kanan
  
  // Menggambar ikan
  fill(100, 100, 255);
  ellipse(x + 30, y + 15, 15, 5);  // Badan ikan
  triangle(x + 35, y + 15, x + 45, y + 10, x + 45, y + 20);  // Ekor ikan
}

void drawSea() {
  // Menggambar ombak
  fill(0, 119, 190);
  noStroke();
  beginShape();
  vertex(0, height/2);
  for (int x = 0; x <= width; x += 20) {
    float y = height/2 + 20 * sin(radians(x + frameCount));
    vertex(x, y);
  }
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}

void drawClouds2() {
  // Menggambar awan-awan
  fill(255);
  noStroke();
  
  // Awan 1
  ellipse(100, 150, 80, 50);
  ellipse(140, 150, 60, 40);
  ellipse(180, 150, 80, 50);
  
  // Awan 2
  ellipse(500, 120, 100, 60);
  ellipse(550, 120, 80, 50);
  ellipse(600, 120, 100, 60);
}
void drawVillageScene() {
  // Background warna langit orange
  background(255, 140, 0);
  
  // Matahari terbenam di ujung
  fill(255, 69, 0);
  ellipse(width - 100, sunY, 80, 80);
  
  // Tanah lebih tinggi
  fill(255, 223, 186);
  rect(0, height - 200, width, 250);
  
  // Rerumputan di tanah
  drawGrass();
  
  // Rumah-rumah di pinggir pantai
  drawHouse(150, height - 180);
  drawHouse(370, height - 200);
  drawHouse(580, height - 160);
  
  // Pohon di dekat rumah
  drawTree(100, height - 180);
  drawTree(300, height - 200);
  drawTree(500, height - 160);
  
  // Orang-orang 
  drawPerson(180, height - 170, color(0, 255, 0)); // Orang pertama
  drawPerson(380, height - 190, color(0, 0, 255)); // Orang kedua
  drawPerson(580, height - 150, color(255, 0, 0)); // Orang ketiga
  
  // Menggambar awan
  drawClouds();
}

void drawHouse(int x, int y) {
  // Atap rumah
  fill(139, 69, 19);
  triangle(x, y - 80, x + 60, y - 80, x + 30, y - 120);
  
  // Badan rumah
  fill(255);
  rect(x, y - 80, 60, 80);
  
  // Pintu rumah
  fill(165, 42, 42);
  rect(x + 25, y - 20, 10, 20);
  
  // Jendela rumah
  fill(200);
  rect(x + 5, y - 60, 20, 20);
}

void drawTree(int x, int y) {
  // Batang pohon
  fill(139, 69, 19);
  rect(x, y - 100, 20, 100);
  
  // Daun pohon
  fill(34, 139, 34);
  ellipse(x + 10, y - 120, 80, 80);
  ellipse(x - 20, y - 100, 60, 60);
  ellipse(x + 30, y - 90, 60, 60);
}
void drawPerson(float x, int y, color shirtColor) {
  fill(255, 200, 200);
  ellipse(x, y, 20, 20);  // Kepala
  
  fill(shirtColor);
  rect(x - 10, y + 10, 20, 30);  // Badan
  
  fill(0);
  rect(x - 10, y + 40, 5, 30);  // Kaki kiri
  rect(x + 5, y + 40, 5, 30);  // Kaki kanan
  
  line(x - 10, y + 25, x - 30, y + 15);  // Tangan kiri
  line(x + 10, y + 25, x + 30, y + 15);  // Tangan kanan
}
void drawGrass() {
  // Rerumputan di tanah
  fill(154, 205, 50);
  rect(0, height - 200, width, 150);
}

void drawClouds() {
  // Menggambar awan-awan
  fill(255);
  noStroke();
  
  // Awan 1
  ellipse(100, 80, 120, 60);
  ellipse(160, 80, 100, 50);
  ellipse(220, 80, 120, 60);
  
  // Awan 2
  ellipse(500, 100, 140, 70);
  ellipse(580, 100, 120, 60);
  ellipse(660, 100, 140, 70);
}
