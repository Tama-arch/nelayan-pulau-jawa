import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float Xawn1 = 0;
float Xawn2 = 0;
float Xobk1 = 0;
float Xobk2 = 0;
float Xobk3 = 0;
float Xobk4 = 0;
float Xobk5 = 0;
float Xobk6 = 0;
float Xobk7 = 0;
float Xobk8 = 0;
float[] XsmallBoats;
int numSmallBoats = 5; // Jumlah kapal kecil
PImage gambar;

// Array untuk warna baju yang berbeda-beda
color[] shirtColors = {
  color(255, 0, 0),   // Merah
  color(0, 255, 0),   // Hijau
  color(0, 0, 255),   // Biru
  color(255, 255, 0), // Kuning
  color(255, 165, 0), // Oranye
  color(75, 0, 130),  // Ungu
  color(255, 192, 203), // Merah Muda
  color(0, 255, 255), // Cyan
  color(128, 0, 128), // Magenta
  color(255, 255, 255)  // Putih
};

color bodyColor = color(255, 224, 189); // Warna default badan
color pantsColor = color(0, 0, 255); // Warna default celana
color legColor = bodyColor; // Warna default kaki

boolean orangMuncul = false;
int orangTimer = 0;
ArrayList<Orang> orangs = new ArrayList<Orang>();

class Orang {
  float posX;
  float posY;
  int shirtColorIndex;
  float creationTime;

  Orang(float x, float y, int colorIndex, float time) {
    posX = x;
    posY = y;
    shirtColorIndex = colorIndex;
    creationTime = time;
  }

  void display() {
    pushMatrix();
    translate(posX, posY); // Posisi acak
    scale(0.3); // Skala orang

    // Kepala
    fill(#FDF5E6);
    ellipse(400, 200, 60, 80);

    // Rambut
    fill(100, 50, 0);
    for (int j = 0; j < 6; j++) {
      for (int k = 0; k < 10; k++) {
        ellipse(380 + k*4 + j*2, 150 + k*2 + j*2, 6, 25); // Membuat rambut lebih kecil
      }
    }

    // Mata
    fill(255);
    ellipse(390, 190, 15, 10);
    ellipse(410, 190, 15, 10);
    fill(0);
    ellipse(390, 190, 5, 5);
    ellipse(410, 190, 5, 5);

    // Hidung
    fill(255, 224, 189);
    triangle(400, 200, 395, 210, 405, 210);

    // Mulut
    fill(255, 0, 0);
    arc(400, 220, 20, 10, 0, PI);

    // Badan
    fill(bodyColor);
    rect(370, 240, 60, 100);

    // Baju
    fill(shirtColors[shirtColorIndex]);
    rect(370, 240, 60, 100);

    // Lengan Kanan
    pushMatrix();
    translate(370, 240);
    rotate(radians(30));
    fill(bodyColor);
    rect(0, 0, 20, 80);
    popMatrix();

    // Lengan Kiri
    pushMatrix();
    translate(430, 240);
    rotate(radians(-30));
    fill(bodyColor);
    rect(0, 0, 20, 80);
    popMatrix();

    // Kaki Kanan
    fill(bodyColor);
    rect(380, 340, 20, 80);

    // Kaki Kiri
    rect(400, 340, 20, 80);

    // Celana
    fill(pantsColor);
    rect(380, 340, 20, 80);
    rect(400, 340, 20, 80);

    // Ikan
    fill(100, 200, 100);
    ellipse(470, 290, 60, 30); // Badan ikan
    triangle(500, 290, 520, 280, 520, 300); // Ekor ikan
    fill(0);
    ellipse(460, 285, 5, 5); // Mata ikan

    // Menggambar tangan yang memegang ikan (warna baju yang memegang ikan)
    pushMatrix();
    translate(430, 240);
    rotate(radians(-30));
    fill(shirtColors[shirtColorIndex]);
    rect(0, 70, 20, 10); // Tangan yang memegang ikan
    popMatrix();

    popMatrix(); // Pop matrix untuk mengembalikan koordinat ke posisi sebelumnya
  }

  boolean isExpired() {
    return millis() - creationTime > 10000; // Mengembalikan true jika sudah lebih dari 10 detik
  }
}

void setup() {
  size(800, 600);
  background(100, 200, 255);
  
  XsmallBoats = new float[numSmallBoats];
  for (int i = 0; i < numSmallBoats; i++) {
    XsmallBoats[i] = 800 + i * 150; // Menyesuaikan jarak antar kapal kecil
  }
}

void draw() {
  background(100, 200, 255);
  
  // Gerakan awan
  Xawn1 += 1.5;
  Xawn2 += 3;
  if (Xawn1 >= 800) {
    Xawn1 = -250;
  }
  if (Xawn2 >= 800) {
    Xawn2 = -250;
  }
  
  fill(255, 255, 255);
  ellipse(124 + Xawn1, 132, 60, 40);
  ellipse(156 + Xawn1, 110, 70, 60);
  ellipse(200 + Xawn1, 130, 90, 50);
  
  fill(255, 255, 255);
  ellipse(24 + Xawn2, 302, 60, 40);
  ellipse(56 + Xawn2, 280, 70, 60);
  ellipse(100 + Xawn2, 285, 70, 40);
  ellipse(130 + Xawn2, 300, 60, 30);
  
  // Laut
  fill(#00BFFF);
  noStroke();
  rect(0, 395, 800, 205);
  
  // Kapal besar
  fill(#FFEFD5);
  noStroke();
  quad(350, 350, 700, 350, 650, 400, 420, 400);
  
  fill(#FFF5EE);
  rect(420, 250, 6, 100);
  ellipse(423, 250, 10, 10);
  rect(500, 150, 6, 200);
  ellipse(503, 150, 10, 10);
  
  fill(#DB7093); // Bendera
  triangle(423, 250, 480, 320, 423, 320);
  triangle(503, 150, 580, 320, 503, 320);
  
  fill(#E6E6FA); // Rumah kapal
  rect(605, 310, 60, 40);
  fill(#FFC0CB);
  triangle(595, 310, 635, 290, 675, 310);
  
  // Kapal kecil berlawanan arah
  for (int i = 0; i < numSmallBoats; i++) {
    XsmallBoats[i] -= 2;
    if (XsmallBoats[i] <= -250) {
      XsmallBoats[i] = 800;
    }
    
    pushMatrix();
    translate(XsmallBoats[i], 300);
    scale(0.5);
    
    fill(#8B4513); // Badan kapal kecil
    quad(0, 0, 100, 0, 80, 30, 20, 30);
    
    fill(#FFF5EE); // Tiang kapal kecil
    rect(45, -40, 3, 40);
    ellipse(47, -40, 6, 6);
    
    fill(#FF6347); // Bendera kapal kecil
    triangle(47, -40, 67, -20, 47, -20);
    
    popMatrix();
  }
  
  // Ombak
  Xobk1 += 4;
  Xobk2 += 4;
  Xobk3 += 4;
  Xobk4 += 4;
  Xobk5 += 4;
  Xobk6 += 4;
  Xobk7 += 4;
  Xobk8 += 4;
  
  if (Xobk1 >= 800) Xobk1 = -800;
  if (Xobk2 >= 800) Xobk2 = -700;
  if (Xobk3 >= 800) Xobk3 = -600;
  if (Xobk4 >= 800) Xobk4 = -500;
  if (Xobk5 >= 800) Xobk5 = -400;
  if (Xobk6 >= 800) Xobk6 = -300;
  if (Xobk7 >= 800) Xobk7 = -200;
  if (Xobk8 >= 800) Xobk8 = -100;
  
  fill(#1170B7);
  ellipse(Xobk1, 400, 100, 30);
  ellipse(Xobk2, 400, 100, 30);
  ellipse(Xobk3, 400, 100, 30);
  ellipse(Xobk4, 400, 100, 30);
  ellipse(Xobk5, 400, 100, 30);
  ellipse(Xobk6, 400, 100, 30);
  ellipse(Xobk7, 400, 100, 30);
  ellipse(Xobk8, 400, 100, 30);
  
  // Munculkan orang setelah 10 detik
  if (!orangMuncul && millis() > 10000) {
    int numOrang = 10; // Jumlah orang yang akan muncul
    for (int i = 0; i < numOrang; i++) {
      float posX = random(100, 700); // Posisi x acak antara 100 dan 700
      float posY = random(250, 350); // Posisi y acak antara 250 dan 350
      int colorIndex = i % shirtColors.length; // Ambil warna baju dari array shirtColors
      orangs.add(new Orang(posX, posY, colorIndex, millis())); // Tambahkan orang baru ke ArrayList
    }
    orangMuncul = true; // Menandakan bahwa orang sudah muncul
  }
  
  // Tampilkan dan hapus orang yang sudah lebih dari 10 detik
  for (int i = orangs.size()-1; i >= 0; i--) {
    Orang orang = orangs.get(i);
    orang.display();
    if (orang.isExpired()) {
      orangs.remove(i);
    }
  }
}
