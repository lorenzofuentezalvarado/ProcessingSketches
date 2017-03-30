PImage backgroundImage;
boolean gameOver=false;

int score=0;
int xposition=(int)random(width);
int yposition=(int)random(height);
int xballspeed=50;
int yballspeed=50;

void setup(){
  fullScreen();
  frameRate(60);
  backgroundImage = loadImage("stars.jpg");
}
void draw(){
 if(!gameOver){
   
 image(backgroundImage, 0, 0, width, height);
  // background(81, 81, 81);
 
 fill(255, 200, 0);
 textSize(50);
 text("Score: " + score, 10, 40);
 stroke(0,0,0);
 ellipse(xposition, yposition, 40, 40);
 xposition+= xballspeed;
 if(xposition>width){
   xballspeed=-xballspeed;
 }
 if(xposition<=0){
   xballspeed=-xballspeed;
 }
 yposition+= yballspeed;
 if(intersects(xposition, yposition, mouseX, height-30, 250)){
   yballspeed=-yballspeed;
   yposition+= yballspeed;
   score++;
 }
 if(yposition<=0){
   yballspeed=-yballspeed;
 }
 
 fill(255, 200, 0);
 rect(mouseX-125, height-30, 250, 20);
 }
 
 if(yposition>height){
   gameOver=true;
   image(backgroundImage, 0, 0, width, height);
   fill(255, 255, 255);
   textSize(95);
   text("Game over! You scored "+score, 2, height/2);
   text("Click to restart!", ((width/2)/2)-20, (height/2)+100);
   if(mousePressed){
     gameOver=false;
   }
 }
}
boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
    if (ballY > paddleY && ballX > paddleX && ballX < paddleX + paddleLength)
  return true;
    else 
  return false;
}