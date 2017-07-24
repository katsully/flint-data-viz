import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

boolean levelsOne = false;
boolean levelsTwo = false;
boolean percentage = false;

int levelCounter1;
int levelCounter2;
int levelCounter3;
int levelCounter4;
int levelCounter5;
int levelCounter6;

int speed = 5;

float percentOne = 0.0;
float percentTwo = 0.0;
float percentThree = 0.0;

void settings() {
  size(1920, 1080, P3D);
  PJOGL.profile = 1;
}

void setup() {
  //size(1000,1000);
  //fullScreen(P3D);
  canvas = createGraphics(width, height, P3D);
  canvas.beginDraw();
  canvas.background(125);

  PFont font;
  font = createFont("Gotham/Originals/Rounded/GothamRnd-Bold.otf", 42);
  canvas.textFont(font, 42);

  canvas.stroke(255);
  canvas.fill(255);

  canvas.textSize(42);
  canvas.text("% of all children under 5 with ELEVATED BLOOD LEAD LEVELS\nin Genesee County, MI", 100, 75, width*.4, 400);

  canvas.textSize(32);
  canvas.text("Flint", width*.1, height*.9);
  canvas.text("High Risk Flint", width*.4, height*.9);
  //text("High Risk Flint (zip codes 48503 & 43504)", width*.4, height*.9, 275, 150);
  canvas.text("Non Flint", width*.7, height*.9);

  canvas.textSize(32);
  canvas.text("Children under 5 with ELEVATED BLOOD LEAD LEVELS: 374", width*.7, height*.25, width*.25, height*.3);

  levelCounter1 = int(height*.85);
  levelCounter2 = int(height*.85);
  levelCounter3 = int(height*.85);
  levelCounter4 = int(height*.85);
  levelCounter5 = int(height*.85);
  levelCounter6 = int(height*.85);
  
  canvas.endDraw(); 

  // Create syphon server to send frames out
  server = new SyphonServer(this, "Processing Syphon");
}

void draw() {
  //background(0);
  canvas.beginDraw();
  stroke(255);
  fill(255);

  // levels 0 to 630
  // height *.85 to height *.22
  if (levelsOne) {
    canvas.fill(0, 0, 255);
    canvas.noStroke();
    canvas.rect(width*.1, levelCounter1-speed, width*.1, speed);
    canvas.rect(width*.4, levelCounter2-speed, width*.1, speed);
    canvas.rect(width*.7, levelCounter3-speed, width*.1, speed);

    // 2.1%
    if (levelCounter1 > height*.64) {
      levelCounter1-=speed;
    }
    // 2.5%
    if (levelCounter2 > height*.61) {
      levelCounter2-=speed;
    }
    // 0.6%
    if (levelCounter3 > height*.79) {
      levelCounter3-=speed;
    }
  }

  if (levelsTwo) {
    //stroke(255, 0, 0);
    canvas.noStroke();
    canvas.fill(255, 0, 0);
    canvas.rect(width*.2, levelCounter4-speed, width*.1, speed);
    canvas.rect(width*.5, levelCounter5-speed, width*.1, speed);
    canvas.rect(width*.8, levelCounter6-speed, width*.1, speed);

    // 4.0%
    if (levelCounter4 > height*.45) {
      levelCounter4-=speed;
    }
    // 6.3%
    if (levelCounter5 > height*.22) {
      levelCounter5-=speed;
    }
    // 1.0%
    if (levelCounter6 > height*.75) {
      levelCounter6-=speed;
    }
  }

  if (percentage) {
    if (percentOne < 45.3) {
      percentOne+=0.9;
      if (percentOne > 45.3) {
        percentOne = 45.3;
      }
    } 
    if (percentTwo < 58.0) {
      percentTwo+=0.9;
      if (percentTwo > 58.0) {
        percentTwo = 58.0;
        percentage = false;
      }
    }
    if (percentThree < 32.5) {
      percentThree+=0.9;
      if (percentThree > 32.5) {
        percentThree = 32.5;
      }
    }
    canvas.fill(125);
    canvas.noStroke();
    canvas.rect(width*.15, height*.9-25, 130, 30);
    canvas.rect(width*.5+75, height*.9-25, 110, 35);
    canvas.rect(width*.8, height*.9-25, 110, 35);
    canvas.stroke(0);
    canvas.fill(0);
    canvas.text(nf(percentOne, 2, 1)+"%", width*.15+20, height*.9);
    canvas.text(nf(percentTwo, 2, 1)+"%", width*.5+75, height*.9);
    canvas.text(nf(percentThree, 2, 1)+"%", width*.8, height*.9);
  }
  //saveFrame("frame-######.png");
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void drawLabels1() {
  canvas.beginDraw();
  canvas.fill(255);
  canvas.stroke(255);
  canvas.text("2.1%", width*.1, height*.64-20);
  canvas.text("2.5%", width*.4, height*.61-20);
  canvas.text("0.6%", width*.7, height*.79-20);
  canvas.endDraw();
}

void drawLabels2() {
  canvas.beginDraw();
  canvas.fill(255);
  canvas.stroke(255);
  canvas.text("4.0%", width*.2, height*.45-20);
  canvas.text("6.3%", width*.5, height*.22-20);
  canvas.text("1.0%", width*.8, height*.75-20);
  canvas.endDraw();
}

void keyPressed() {
  canvas.beginDraw();
  if (key == 'a') {
    levelsOne = true;
    canvas.fill(0, 0, 255);
    canvas.text("Pre-switch", width*.7, height*.4);
  } else if (key == 'b') {
    levelsTwo = true;
    canvas.fill(255, 0, 0);
    canvas.text("Post-switch", width*.7, height*.45);
  } else if (key=='c') {
    percentage = true;
    canvas.fill(0);
    canvas.text("Percent of African American residents", width*.1, height*.9+30, width*.6, height*.2);
  } else if (key=='d') {
    drawLabels1();
  } else if (key=='e') {
    drawLabels2();
  }
  canvas.endDraw();
} 


// source for population - https://factfinder.census.gov/faces/nav/jsf/pages/community_facts.xhtml#
// source for ebl - http://flintwaterstudy.org/2015/09/pediatric-lead-exposure-presentation-from-hurley-medical-center-doctors-concerning-flint-mi/  