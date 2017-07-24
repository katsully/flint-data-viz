import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

boolean levelsOne = false;
boolean levelsTwo = false;
boolean percentage = false;

int levelCounter1 = 700;
int levelCounter2 = 700;
int levelCounter3 = 700;
int levelCounter4 = 700;
int levelCounter5 = 700;
int levelCounter6 = 700;

int speed = 5;

float percentOne = 0.0;
float percentTwo = 0.0;
float percentThree = 0.0;

void settings() {
  fullScreen(P3D);
  PJOGL.profile = 1;
}

void setup() {
  //size(1000,1000);
  //fullScreen(P3D);
  canvas = createGraphics(width, height, P3D);
  canvas.beginDraw();
  canvas.background(125);

  PFont font;
  font = createFont("Gotham/Originals/Rounded/GothamRnd-Bold.otf", 32);
  textFont(font, 32);

  stroke(255);
  fill(255);

  textSize(32);
  canvas.text("% of all children under 5 with ELEVATED BLOOD LEAD LEVELS\nin Genesee County, MI", 100, 75, width*.4, 400);

  textSize(24);
  canvas.text("Flint", width*.1, height*.9+25);
  canvas.text("High Risk Flint", width*.4, height*.9+25);
  //text("High Risk Flint (zip codes 48503 & 43504)", width*.4, height*.9, 275, 150);
  canvas.text("Non Flint", width*.7, height*.9+25);

  textSize(28);
  canvas.text("Children under 5 with ELEVATED BLOOD LEAD LEVELS: 374", width*.7, height*.25, width*.25, height*.3);
  
  // Create syphon server to send frames out
  server = new SyphonServer(this, "Processing Syphon");
  //canvas.endDraw();
}

void draw() {
  //background(0);
  canvas.beginDraw();
  stroke(255);
  fill(255);

  // levels 0 to 630
  // 750 to 120
  if (levelsOne) {
    fill(0, 0, 255);
    noStroke();
    canvas.rect(width*.1, levelCounter1-speed, width*.1, speed);
    canvas.rect(width*.4, levelCounter2-speed, width*.1, speed);
    canvas.rect(width*.7, levelCounter3-speed, width*.1, speed);

    if (levelCounter1 > 490+speed) {
      levelCounter1-=speed;
    }
    if (levelCounter2 > 460) {
      levelCounter2-=speed;
    }
    if (levelCounter3 > 650) {
      levelCounter3-=speed;
    }
  }

  if (levelsTwo) {
    //stroke(255, 0, 0);
    noStroke();
    fill(255, 0, 0);
    canvas.rect(width*.2, levelCounter4-speed, width*.1, speed);
    canvas.rect(width*.5, levelCounter5-speed, width*.1, speed);
    canvas.rect(width*.8, levelCounter6-speed, width*.1, speed);

    if (levelCounter4 > 310) {
      levelCounter4-=speed;
    }
    if (levelCounter5 > 80) {
      levelCounter5-=speed;
    }
    if (levelCounter6 > 610) {
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
    fill(125);
    noStroke();
    canvas.rect(width*.15, height*.9, 110, 30);
    canvas.rect(width*.5+75, height*.9, 100, 35);
    canvas.rect(width*.8, height*.9, 110, 35);
    stroke(0);
    fill(0);
    canvas.text(nf(percentOne, 2, 1)+"%", width*.15, height*.9+25);
    canvas.text(nf(percentTwo, 2, 1)+"%", width*.5+75, height*.9+25);
    canvas.text(nf(percentThree, 2, 1)+"%", width*.8, height*.9+25);
  }
  //saveFrame("frame-######.png");
  canvas.endDraw();
  server.sendImage(canvas);
}

void drawLabels1() {
  fill(255);
  stroke(255);
  canvas.text("2.1%", width*.1, 480);
  canvas.text("2.5%", width*.4, 440);
  canvas.text("0.6%", width*.7, 630);
}

void drawLabels2() {
  fill(255);
  stroke(255);
  canvas.text("4.0%", width*.2, 290);
  canvas.text("6.3%", width*.5, 60);
  canvas.text("1.0%", width*.8, 590);
}

void keyPressed() {
  if (key == 'a') {
    levelsOne = true;
    fill(0, 0, 255);
    canvas.text("Pre-switch", width*.7, height*.45);
  } else if (key == 'b') {
    levelsTwo = true;
    fill(255, 0, 0);
    canvas.text("Post-switch", width*.7, height*.5);
  } else if (key=='c') {
    percentage = true;
    fill(0);
    canvas.text("Percent of African American residents", width*.1, height*.9+30, width*.6, height*.2);
  } else if (key=='d') {
    drawLabels1();
  } else if (key=='e') {
    drawLabels2();
  }
} 


// source for population - https://factfinder.census.gov/faces/nav/jsf/pages/community_facts.xhtml#
// source for ebl - http://flintwaterstudy.org/2015/09/pediatric-lead-exposure-presentation-from-hurley-medical-center-doctors-concerning-flint-mi/  