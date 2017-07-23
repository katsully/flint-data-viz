boolean levelsOne = false;
boolean levelsTwo = false;
boolean percentage = false;

int levelCounter1 = 700;
int levelCounter2 = 700;
int levelCounter3 = 700;
int levelCounter4 = 700;
int levelCounter5 = 700;
int levelCounter6 = 700;

float percentOne = 0.0;
float percentTwo = 0.0;
float percentThree = 0.0;

void setup() {
  //size(1000,1000);
  fullScreen();
  background(125);

  stroke(255);
  fill(255);

  textSize(32);
  text("% of all children under 5 with ELEVATED BLOOD LEVEL\n in Genesee County", 100, 100, width*.4, 400);

  textSize(24);
  text("All Flint", width*.1, height*.9+25);
  text("High Risk Flint (zip codes 48503 & 43504)", width*.4, height*.9, 275, 150);
  text("Non Flint", width*.7, height*.9+25);
}

void draw() {
  //background(0);
  stroke(255);
  fill(255);

  // levels 0 to 630
  // 750 to 120
  if (levelsOne) {
    fill(0, 0, 255);
    noStroke();
    rect(width*.1, levelCounter1-3, width*.1, 3);
    rect(width*.4, levelCounter2-3, width*.1, 3);
    rect(width*.7, levelCounter3-3, width*.1, 3);

    if (levelCounter1 > 490) {
      levelCounter1-=3;
    }
    if (levelCounter2 > 450) {
      levelCounter2-=3;
    }
    if (levelCounter3 > 640) {
      levelCounter3-=3;
    }
  }

  if (levelsTwo) {
    //stroke(255, 0, 0);
    noStroke();
    fill(255, 0, 0);
    rect(width*.2, levelCounter4-3, width*.1, 3);
    rect(width*.5, levelCounter5-3, width*.1, 3);
    rect(width*.8, levelCounter6-3, width*.1, 3);

    if (levelCounter4 > 300) {
      levelCounter4-=3;
    }
    if (levelCounter5 > 70) {
      levelCounter5-=3;
    }
    if (levelCounter6 > 600) {
      levelCounter6-=3;
    }
  }

  if (percentage) {
    fill(125);
    noStroke();
    rect(width*.2, height*.9-15, 110, 55);
    rect(width*.5+125, height*.9-15, 100, 55);
    rect(width*.8, height*.9-15, 110, 55);
    stroke(255);
    fill(255);
    text(nf(percentOne, 2, 1)+"%", width*.2, height*.9+25);
    text(nf(percentTwo, 2, 1)+"%", width*.5+125, height*.9+25);
    text(nf(percentThree, 2, 1)+"%", width*.8, height*.9+25);

    if (percentOne < 45.3) {
      percentOne+=0.3;
    } else {
      percentage = false;
    }
    if (percentTwo < 58.0) {
      percentTwo+=0.5;
    }
    if (percentThree < 32.5) {
      percentThree+=0.5;
    }
  }
  saveFrame("frame-######.png");
}

void drawLabels1() {
  fill(255);
  stroke(255);
  text("2.1%", width*.1, 480);
  text("2.5%", width*.4, 440);
  text("0.6%", width*.7, 630);
}

void drawLabels2() {
  fill(255);
  stroke(255);
  text("4.0%", width*.2, 290);
  text("6.3%", width*.5, 60);
  text("1.0%", width*.8, 590);
}

void keyPressed() {
  if (key == 'a') {
    levelsOne = true;
  } else if (key == 'b') {
    levelsTwo = true;
  } else if (key=='c') {
    percentage = true;
  } else if (key=='d') {
    drawLabels1();
  } else if (key=='e') {
    drawLabels2();
  }
} 


// source for population - https://factfinder.census.gov/faces/nav/jsf/pages/community_facts.xhtml#
// source for ebl - http://flintwaterstudy.org/2015/09/pediatric-lead-exposure-presentation-from-hurley-medical-center-doctors-concerning-flint-mi/  