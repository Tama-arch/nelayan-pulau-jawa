float mov;

void setup(){
  size (500,500);
  background(255);
  mov = 1;
}

void draw(){
  mov = mov + 1;
  
  fill(60 + mouseY/2, 180 - mouseY, 210 - mouseY); // Langit
  rect(0, 0, 500, 250);
  
  noStroke(); // Matahari
  fill(255, 255 - mouseY/2, 0);
  ellipse(250, mouseY, 120, 120);
  
  laut();
  kapal();
  awan();
  pantai();

  fill(60 + mouseY/2, 180 - mouseY, 210 - mouseY, mov - 2800); 
  rect(420, 165, 100, 40);
  
  fill(0, 0, 0, mouseY-100); // Malam
  rect(0, 0, 500, 500);
}

void laut(){
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
}

void kapal(){
  fill(255);
  triangle(30 + mov/6, 241, 90 + mov/6 - mouseX/40, 220, 28 + mov/6, 150); 
  triangle(30 + mov/6, 241, 10 + mov/6 - mouseX/40, 248 + mouseX/400, 25 + mov/6, 150); 
  
  fill(120, 90, 70);
  quad(-20 + mov/6, 250, 90 + mov/6, 250, 120 + mov/6, 215, -30 + mov/6, 220); 
  
  // Membuat orang di atas kapal
  fill(255, 224, 189); // Warna kulit
  ellipse(50 + mov/6, 205, 15, 15); // Kepala
  
  fill(0, 0, 255); 
  rect(42 + mov/6, 220, 10, 20); // Badan
  
  fill(255, 224, 189); //tangan
  rect(35 + mov/6, 220, 5, 15);
  rect(55 + mov/6, 220, 5, 15);
  
  fill(0, 0, 255); //kaki
  rect(45 + mov/6, 240, 5, 10);
  rect(50 + mov/6, 240, 5, 10);
  
  fill(139, 69, 19); //caping
  triangle(50 + mov/6, 185, 40 + mov/6, 205, 60 + mov/6, 205);
 
  stroke(0);  //pancing
  strokeWeight(2);
  line(55 + mov/6, 225, 85 + mov/6, 170);
  
  strokeWeight(1); 
  line(85 + mov/6, 170, 95 + mov/6, 250);
  
  fill(255, 0, 0); 
  ellipse(95 + mov/6, 250, 15, 7); 
  triangle(100 + mov/6, 250, 105 + mov/6, 245, 105 + mov/6, 255); 
}

void awan(){
  fill(255);
  
  ellipse(340 + 125 - mov/10, 100, 40, 40);
  ellipse(450 + 125 - mov/10, 90, 60, 60);
  ellipse(390 + 125 - mov/10, 80, 80, 80);
  rect(340 + 125 - mov/10, 100, 110, 20);
  
  ellipse(110 + 125 - mov/10, 110, 80, 80);
  ellipse(50 + 125 - mov/10, 120, 60, 60);
  ellipse(160 + 125 - mov/10, 130, 40, 40);
  rect(46 + 125 - mov/10, 130, 110, 20);
}

void pantai(){
  fill(255, 228, 196); 
  rect(0, height/2 + 100, width, height/2 - 100);
}
