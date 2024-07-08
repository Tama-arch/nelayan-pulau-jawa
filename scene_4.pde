color[] clothesColors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255)};
color eyeColor = color(255); // Warna mata tetap (putih)
color skinColor = color(255, 224, 189); // Warna kulit cerah
float boatSpeed = 1.5; // Kecepatan gerak kapal
float boat1X = -100, boat2X = -500, boat3X = -650; // Posisi awal kapal

void setup() {
  size(800, 600);
  frameRate(30); // Atur kecepatan frame
  background(135, 206, 235); // Langit biru
}

void draw() {
  background(135, 206, 235); // Langit biru
  drawOceanAndBeach();
  moveBoats();
  drawRaflyAndVillagers();
  drawTextBubble(400, height / 2 - 170, "Kita harus melakukan sesuatu!");
}

void drawOceanAndBeach() {
  // Warna laut
  fill(0, 105, 148);
  beginShape();
  vertex(0, height / 2 + 30);
  vertex(100, height / 2 + 20);
  vertex(200, height / 2 + 40);
  vertex(300, height / 2 + 10);
  vertex(400, height / 2 + 30);
  vertex(500, height / 2 + 20);
  vertex(600, height / 2 + 40);
  vertex(700, height / 2 + 10);
  vertex(width, height / 2 + 30);
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  // Warna pasir
  fill(255, 228, 181);
  beginShape();
  vertex(0, height / 2);
  vertex(100, height / 2 - 10);
  vertex(200, height / 2 + 10);
  vertex(300, height / 2 - 20);
  vertex(400, height / 2);
  vertex(500, height / 2 - 10);
  vertex(600, height / 2 + 10);
  vertex(700, height / 2 - 20);
  vertex(width, height / 2);
  vertex(width, 0);
  vertex(0, 0);
  endShape(CLOSE);
}

void drawRaflyAndVillagers() {
  // Rafly
  drawStickman(400, height / 2 - 120, skinColor, color(0, 255, 255), false);

  // Warga desa menghadap Rafly dengan jarak yang cukup
  drawStickman(200, height / 2 - 150, skinColor, clothesColors[0], true);
  drawStickman(300, height / 2 - 150, skinColor, clothesColors[1], true);
  drawStickman(500, height / 2 - 150, skinColor, clothesColors[2], true);
  drawStickman(600, height / 2 - 150, skinColor, clothesColors[3], true);
}

void drawStickman(float x, float y, color headColor, color clothesColor, boolean facingLeft) {
  // Kepala
  fill(headColor);
  ellipse(x, y, 50, 50);
  
  // Mata
  fill(eyeColor); // Warna mata tetap
  if (facingLeft) {
    ellipse(x - 10, y - 10, 10, 10); // Mata kiri
    ellipse(x + 10, y - 10, 10, 10); // Mata kanan
  } else {
    ellipse(x + 10, y - 10, 10, 10); // Mata kiri
    ellipse(x - 10, y - 10, 10, 10); // Mata kanan
  }
  
  // Pupil
  fill(0);
  if (facingLeft) {
    ellipse(x - 10, y - 10, 5, 5); // Pupil kiri
    ellipse(x + 10, y - 10, 5, 5); // Pupil kanan
  } else {
    ellipse(x + 10, y - 10, 5, 5); // Pupil kiri
    ellipse(x - 10, y - 10, 5, 5); // Pupil kanan
  }
  
  // Mulut
  noFill();
  arc(x, y + 10, 20, 10, 0, PI); // Mulut tertutup
  
  // Badan
  fill(clothesColor);
  rect(x - 20, y + 25, 40, 50);
  
  // Tangan
  stroke(0);
  if (facingLeft) {
    line(x - 20, y + 30, x - 50, y + 50); // Tangan kiri
    line(x + 20, y + 30, x + 50, y + 50); // Tangan kanan
  } else {
    line(x - 20, y + 30, x - 50, y + 50); // Tangan kanan
    line(x + 20, y + 30, x + 50, y + 50); // Tangan kiri
  }
  
  // Kaki
  line(x - 10, y + 75, x - 10, y + 100);
  line(x + 10, y + 75, x + 10, y + 100);
}

void moveBoats() {
  // Gerakkan kapal dari kiri ke kanan
  boat1X += boatSpeed;
  if (boat1X > width + 150) { // Lebar kapal lebih besar
    boat1X = -150;
  }
  drawBoat(boat1X, height / 2 + 40, 150, 50); // Ukuran kapal lebih besar

  boat2X += boatSpeed * 0.8;
  if (boat2X > width + 200) { // Lebar kapal lebih besar
    boat2X = -200;
  }
  drawBoat(boat2X, height / 2 + 20, 200, 60); // Ukuran kapal lebih besar

  boat3X += boatSpeed * 0.7;
  if (boat3X > width + 180) { // Lebar kapal lebih besar
    boat3X = -180;
  }
  drawBoat(boat3X, height / 2 + 50, 180, 55); // Ukuran kapal lebih besar
}

void drawBoat(float x, float y, float w, float h) {
  fill(139, 69, 19); // Warna kapal
  beginShape();
  vertex(x, y);
  vertex(x + w, y);
  vertex(x + w - 10, y + h);
  vertex(x + 10, y + h);
  endShape(CLOSE);
  
  fill(255);
  rect(x + w / 4, y - h / 2, w / 2, h / 2); // Layar kapal
}

void drawTextBubble(float x, float y, String text) {
  textSize(20);
  float textWidth = textWidth(text) + 20;
  float textHeight = textAscent() + textDescent() + 10;

  // Menggambar bubble putih
  fill(255);
  rect(x - textWidth / 2, y - textHeight, textWidth, textHeight, 10); // Teks di atas Rafly dengan rounded corners

  // Menggambar teks
  fill(0);
  textAlign(CENTER, CENTER);
  text(text, x, y - textHeight / 2);
}
