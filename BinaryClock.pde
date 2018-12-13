/*
  Binary Clock version 1.1
  By Heiner León (hleonpsn[at]gmail[dot]com).
  
  Written on Processing 3.
*/

int BCD = 4;

int FRAME_CLOCK_WIDTH = 600;
int FRAME_CLOCK_HEIGHT = 400;

int FRAME_CLOCK_MARGIN = 50;

int FIGURE_WIDTH = FRAME_CLOCK_WIDTH/6;
int FIGURE_HEIGHT = FRAME_CLOCK_HEIGHT/BCD;
int FIGURE_MARGIN = 10;

int SEPARATOR = 50;

int FONT_SIZE = 32;

char ON = '1'; //BIT

String hours;
String minutes;
String seconds;

color ledON;
color ledOff;

PFont font;

void setup() {

  size(875, 500);
  noStroke();
  smooth();

  background(255, 255, 255);
  ledON = color(126, 178, 245); //LIGHT BLUE
  ledOff = color(222, 219, 219, 130); //LIGHT GRAY

  font = createFont("Serif-San", 48, true); //FONT FOR TEXT
}

void draw() {
  background(255, 255, 255);
  int hours = hour();
  String hourB2 = binary(hours%10, BCD); //GET THE LAST DIGIT OF THE NUMBER
  hours = hours/10; //GET THE NUMBER WITHOUT THE LAST DIGIT
  String hourB1 = binary(hours%10, BCD);

  int minutes = minute();
  String minuteB2 = binary(minutes%10, BCD);
  minutes = minutes/10;
  String minuteB1 = binary(minutes%10, BCD);

  int seconds = second();
  String secondB2 = binary(seconds%10, BCD);
  seconds = seconds/10;
  String secondB1 = binary(seconds%10, BCD);

  //DRAW THE CLOCK
  for (int i = 0; i < 4; ++i) {

    if ( i > 1) {
      if (hourB1.charAt(i) == ON) {
        fill(ledON);
      } else {
        fill(ledOff);
      }
      ellipse(POSITION_X(0), POSITION_Y(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
    }

    if (hourB2.charAt(i) == ON) {
      fill(ledON);
    } else {
      fill(ledOff);
    }
    ellipse(POSITION_X(1), POSITION_Y(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);

    if (i > 0) {
      if (minuteB1.charAt(i) == ON) {
        fill(ledON);
      } else {
        fill(ledOff);
      }
      ellipse(POSITION_X(2) + SEPARATOR, POSITION_Y(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
    }

    if (minuteB2.charAt(i) == ON) {
      fill(ledON);
    } else {
      fill(ledOff);
    }
    ellipse(POSITION_X(3) + SEPARATOR, POSITION_Y(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);

    if (i > 0) {
      if (secondB1.charAt(i) == ON) {
        fill(ledON);
      } else {
        fill(ledOff);
      }
      ellipse(POSITION_X(4) + 2 * SEPARATOR, POSITION_Y(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
    }

    if (secondB2.charAt(i) == ON) {
      fill(ledON);
    } else {
      fill(ledOff);
    }
    ellipse(POSITION_X(5) + 2 * SEPARATOR, POSITION_Y(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
  }

  textFont(font, FONT_SIZE);
  fill(ledON);

  textAlign(CENTER);
  text(unbinary(hourB1), POSITION_X(0), POSITION_Y(4));
  text(unbinary(hourB2), POSITION_X(1), POSITION_Y(4));

  text(":", POSITION_X(1) + SEPARATOR + SEPARATOR/2, POSITION_Y(4));

  text(unbinary(minuteB1), POSITION_X(2) + SEPARATOR, POSITION_Y(4));
  text(unbinary(minuteB2), POSITION_X(3) + SEPARATOR, POSITION_Y(4));

  text(":", POSITION_X(3) + 2 * SEPARATOR + SEPARATOR/2, POSITION_Y(4));

  text(unbinary(secondB1), POSITION_X(4) + 2 * SEPARATOR, POSITION_Y(4));
  text(unbinary(secondB2), POSITION_X(5) + 2 * SEPARATOR, POSITION_Y(4));

  text("8", POSITION_X(6) + 2 * SEPARATOR, POSITION_Y(0) + 10);
  text("4", POSITION_X(6) + 2 * SEPARATOR, POSITION_Y(1) + 10);
  text("2", POSITION_X(6) + 2 * SEPARATOR, POSITION_Y(2) + 10);
  text("1", POSITION_X(6) + 2 * SEPARATOR, POSITION_Y(3) + 10);
}

int POSITION_X(int position) {
  return position * FIGURE_WIDTH + FIGURE_WIDTH/2 + FRAME_CLOCK_MARGIN;
}

int POSITION_Y(int position) {
  return position * FIGURE_HEIGHT + FIGURE_HEIGHT/2 + FRAME_CLOCK_MARGIN/2;
}
