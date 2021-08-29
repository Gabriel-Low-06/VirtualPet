
void setup() {
  background(200, 200, 200);
  size(1000, 700);
}
int button = 0;
void mouseClicked() {
  button=1;
}

public class dragon {
  int firetracker = 400;
  float[] smokeX = new float[40];
  float[] smokeY = new float[40];
  float XA = 0;
  float XM = 1;
  float YA = 0;
  float YM = 1;
  int WingY = 150;
  int WingTrack = 1;
  float distance = 25;
  float xmove = 0;
  float ymove = 0;

  void generate(float xa, float ya, float scale, String tone, String movement, float random) {
    if(movement=="Incoming"){ 
    scale = scale*distance;
    }
    xa += xmove;
    ya += ymove;
    XA = xa-(scale-1)*500;
    XM = scale;
    YA = ya-(scale-1)*500;
    YM = scale;
    if (tone == "red") {
      fill(300, 0, 0);
    } else if (tone == "blue") {
      fill(0, 0, 300);
    } else if (tone == "green") {
      fill(0, 300, 0);
    } else if (tone == "gold") {
      fill(250, 211, 0);
    }
    if (movement == "Robot" || movement == "Incoming") {
      if (WingTrack == 1) { //movewingsdown
        WingY+=YM*6;
        if (WingY>150+(YM*50)) {
          WingTrack = 0;
        }
      } else { //movewingsup
        WingY-=YM*6;
        if (WingY<150-(YM*10)) {
          WingTrack = 1;
        }
      }
      WingTrack=constrain(WingTrack, 0, 100); //Keep Wing Movement within reason

      if (firetracker>random) { //spawn fire
        firetracker = 0;
        for (int i=0; i<40; i++) {
          smokeX[i] = 470+xa-((scale-1)*25);
          smokeY[i] = 470+ya-((scale-1)*35);
        }
      }
    }

    if (movement == "Incoming") {
      distance=distance*1.02;
      ymove = ymove*1.015;
      xmove = xmove*1.015;
      if (distance>random/50) {
        distance = 0.1;
        if (random(-1, 1)>0) { // pick random respawn point outside of center
          xmove=random(-200, -50);
        } else {
          xmove=random(200, 50);
        }
        if (random(-1, 1)>0) {
          ymove=random(-200, -50);
        } else {
          ymove=random(200, 50);
        }
      }
    }

    if (movement == "Control" || movement=="Perch-Control") {

      WingY = mouseY;
      if (button==1) {
        firetracker = 0;
        for (int i=0; i<40; i++) {
          smokeX[i] = 470+xa-((scale-1)*25);
          smokeY[i] = 470+ya-((scale-1)*35);
        }
        button = 0;
      }
    }

    noStroke();
    triangle(420*XM+XA, 460*YM+YA, 480*XM+XA, 460*YM+YA, 450*XM+XA, 530*YM+YA);//snout
    triangle(400*XM+XA, 400*YM+YA, 500*XM+XA, 400*YM+YA, 450*XM+XA, 500*YM+YA);//head
    stroke(2);
    triangle(400*XM+XA, 380*YM+YA, 400*XM+XA, 400*YM+YA, 430*XM+XA, 400*YM+YA);//leftear
    triangle (500*XM+XA, 380*YM+YA, 500*XM+XA, 400*YM+YA, 470*XM+XA, 400*YM+YA);//rightear
    if (movement=="Perch-Control") {
      YA = YA+120;
      triangle(420*XM+XA, 400*YM+YA, 200*XM+XA, (WingY+150)*YM+YA, 230*XM+XA, (WingY+250)*YM+YA);//wingleft
      triangle(460*XM+XA, 400*YM+YA, 700*XM+XA, (WingY+150)*YM+YA, 670*XM+XA, (WingY+250)*YM+YA);//wingright
      YA = ya-(scale-1)*500;
    } else {
      triangle(400*XM+XA, 400*YM+YA, 200*XM+XA, (WingY+150)*YM+YA, 230*XM+XA, (WingY+250)*YM+YA);//wingleft
      triangle(500*XM+XA, 400*YM+YA, 700*XM+XA, (WingY+150)*YM+YA, 670*XM+XA, (WingY+250)*YM+YA);//wingright
    }
    if (firetracker<100) {
      fill(500, 200, 0);
      noStroke();
      triangle(450*XM+XA, 530*YM+YA, 350*XM+XA, firetracker*3+(550*YM+YA), 550*XM+XA, firetracker*3+(550*YM+YA));//drawfire
      fill(200, 200, 250);
      triangle(450*XM+XA, 550*YM+YA, 400*XM+XA, firetracker*3+550*YM+YA, 500*XM+XA, firetracker*3+550*YM+YA);//drawfire
    }

    stroke(2);
    YA = ya-((scale-1)*80);
    XA = xa-((scale-1)*75);
    fill(500, 500, 500);
    ellipse(430+XA, 430+YA, 20*XM, 10*YM);//lefteye
    fill(70, 50, 50);
    ellipse(430+XA, 430+YA, 10*XM, 10*YM);//leftpupil
    YA = ya-((scale-1)*35);
    ellipse(430+XA, 470+YA, 7*XM, 10*YM);//leftnostril
    XA = xa-((scale-1)*25);
    YA = ya-((scale-1)*80);
    fill(500, 500, 500);
    ellipse(470+XA, 430+YA, 20*XM, 10*YM);//righteye
    fill(70, 50, 50);
    ellipse(470+XA, 430+YA, 10*XM, 10*YM);//rightpupil
    YA = ya-((scale-1)*35);
    ellipse(470+XA, 470+YA, 7*XM, 10*YM);//right nostril

    if (firetracker<300) {
      smokeX[39] = 470+XA+firetracker;
      smokeY[39] = 470+YA-(firetracker*firetracker/20);
      for (int i=0; i<39; i++) {
        smokeX[i]= smokeX[i+1];
        smokeY[i]= smokeY[i+1];
        noStroke();
        fill(100, 100, 100, i*2.2);//smokecolor&transparency
        ellipse(smokeX[i], smokeY[i], 10*XM, 10*YM);//drawsmoke
        XA = xa-((scale-1)*50);
        ellipse(((smokeX[i]-(470+XA))*-1)+(430+XA), smokeY[i], 10*XM, 10*YM);
      }
    }
    firetracker+=1;
  }
}

dragon firenze = new dragon();
dragon bob = new dragon();
dragon jeremy = new dragon();
dragon frankenstein = new dragon();

void draw() {

  background(200, 200, 200);
  noStroke();
  for (int i=1; i<141; i++) {
    fill(i*30/14, i*30/14, 300);
    rect(0, i*5, 1000, 5);
  }

  bob.generate(0, 0, 1, "green", "Incoming", random(300, 1100));
  jeremy.generate(0, 0, 1, "gold", "Incoming", random(350, 1050));
  frankenstein.generate(0, 0, 1, "blue", "Incoming", random(200, 900));

  fill(200, 50, 0); //drawing the rest of the main body
  ellipse(480, 480, 70, 30);
  fill(300, 0, 0);
  ellipse(450, 580, 100, 200);
  fill(100, 100, 100);
  ellipse(540, 690, 200, 350);
  fill(300, 0, 0);
  rect(480, 500, 100, 20);
  ellipse(500, 515, 40, 40);
  rect(425, 650, 20, 100);

  firenze.generate(50, -50, 1, "red", "Perch-Control", random(200, 1000));
}


