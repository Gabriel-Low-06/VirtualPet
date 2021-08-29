
void setup() {
  background(200, 200, 200);
  size(1000, 700);
}

int firetracker = 400;
int[] smokeX = new int[40];
int[] smokeY = new int[40];
int button=0;
  void mouseClicked(){
     button=1;
  }
void draw() {
  int y = mouseY;

  background(200, 200, 200);
  noStroke();
  for (int i=1; i<141; i++) {
    fill(i*30/14, i*30/14, 300);
    rect(0, i*5, 1000, 5);
  }

  fill(300, 0, 0);
  noStroke();
  triangle(420, 460, 480, 460, 450, 530);//snout
  triangle(400, 400, 500, 400, 450, 500);//head
  stroke(2);
  triangle(400, 380, 400, 400, 430, 400);//leftear
  triangle(500, 380, 500, 400, 470, 400);//rightear
  fill(500, 500, 500);
  ellipse(430, 430, 20, 10);//lefteye
  ellipse(470, 430, 20, 10);//righteye

  fill(70, 50, 50);
  ellipse(430, 430, 10, 10);//leftpupil
  ellipse(470, 430, 10, 10);//rightpupil
  ellipse(430, 470, 7, 10);//leftnostril
  ellipse(470, 470, 7, 10);//right nostril

  fill(500, 0, 0);
  triangle(400, 400, 200, y+150, 230, y+250);//wingleft
  triangle(500, 400, 700, y+150, 670, y+250);//wingright

  fill(100, 100, 100);
  triangle(mouseX, mouseY, mouseX+45, mouseY+50, mouseX+50, mouseY+45);//drawsword;

  if (button>0) { 
    firetracker = 0;//reset fire
    for (int i=0; i<40; i++) { 
      smokeX[i] = 470;
      smokeY[i] = 470;
    }
  }
  if (firetracker<100) {
    fill(500, 200, 0);
    noStroke();
    triangle(450, 530, 350, firetracker*3+550, 550, firetracker*3+550);//drawfire
    fill(200, 200, 250);
    triangle(450, 550, 400, firetracker*3+550, 500, firetracker*3+550);//drawfire
  }
  if (firetracker<300) {
    smokeX[39] = 470+firetracker;
    smokeY[39] = 470-(firetracker*firetracker/20);
    for (int i=0; i<39; i++) {
      smokeX[i]= smokeX[i+1];
      smokeY[i]= smokeY[i+1];
      noStroke();
      fill(100, 100, 100, i*2.2);//smokecolor&transparency
      ellipse(smokeX[i], smokeY[i], 10, 10);//drawsmoke
      ellipse(((smokeX[i]-470)*-1)+430, smokeY[i], 10, 10);
    }
  }

  firetracker += 1;//firetime
  button--;
}
