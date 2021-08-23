void setup(){
  background(200,200,200);
  size(1000,700);
}

void draw(){
  fill(300,0,0);
  noStroke();
  triangle(420,460,480,460,450,530);//head
  triangle(400,400,500,400,450,500);//snout
  stroke(2);
  triangle(400,380,400,400,430,400);//leftear
  triangle(500,380,500,400,470,400);//rightear
    fill(500,500,500);
  ellipse(430,430,20,10);//lefteye
  ellipse(470,430,20,10);//righteye

  fill(70,50,50);
  ellipse(430,430,10,10);//leftpupil
  ellipse(470,430,10,10);//rightpupil
  ellipse(430,470,7,10);
  ellipse(470,470,7,10);
}
