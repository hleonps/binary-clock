/*
  Binary Clock.
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

char ON = '1'; // Bit in nibble

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
  ledON = color(126, 178, 245); // Light blue
  ledOff = color(222, 219, 219, 130); // Light gray

  font = createFont("Serif-San", 48, true);
}

void draw() {
  background(255, 255, 255);
  int hours = hour();
  String hourB2 = binary(hours%10, BCD); // Get the last digit of the number
  hours = hours/10; // Get the number without the last digit
  String hourB1 = binary(hours%10, BCD);

  int minutes = minute();
  String minuteB2 = binary(minutes%10, BCD);
  minutes = minutes/10;
  String minuteB1 = binary(minutes%10, BCD);

  int seconds = second();
  String secondB2 = binary(seconds%10, BCD);
  seconds = seconds/10;
  String secondB1 = binary(seconds%10, BCD);

  // Draw the clock
  for (int i = 0; i < 4; ++i) {

    if ( i > 1) {
      if (hourB1.charAt(i) == ON) {
        fill(ledON);
      } else {
        fill(ledOff);
      }
      ellipse(calculatePosX(0), calculatePosY(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
    }

    if (hourB2.charAt(i) == ON) {
      fill(ledON);
    } else {
      fill(ledOff);
    }
    ellipse(calculatePosX(1), calculatePosY(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);

    if (i > 0) {
      if (minuteB1.charAt(i) == ON) {
        fill(ledON);
      } else {
        fill(ledOff);
      }
      ellipse(calculatePosX(2) + SEPARATOR, calculatePosY(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
    }

    if (minuteB2.charAt(i) == ON) {
      fill(ledON);
    } else {
      fill(ledOff);
    }
    ellipse(calculatePosX(3) + SEPARATOR, calculatePosY(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);

    if (i > 0) {
      if (secondB1.charAt(i) == ON) {
        fill(ledON);
      } else {
        fill(ledOff);
      }
      ellipse(calculatePosX(4) + 2 * SEPARATOR, calculatePosY(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
    }

    if (secondB2.charAt(i) == ON) {
      fill(ledON);
    } else {
      fill(ledOff);
    }
    ellipse(calculatePosX(5) + 2 * SEPARATOR, calculatePosY(i), FIGURE_WIDTH - FIGURE_MARGIN, FIGURE_HEIGHT - FIGURE_MARGIN);
  }

  textFont(font, FONT_SIZE);
  fill(ledON);

  textAlign(CENTER);
  text(unbinary(hourB1), calculatePosX(0), calculatePosY(4));
  text(unbinary(hourB2), calculatePosX(1), calculatePosY(4));

  text(":", calculatePosX(1) + SEPARATOR + SEPARATOR/2, calculatePosY(4));

  text(unbinary(minuteB1), calculatePosX(2) + SEPARATOR, calculatePosY(4));
  text(unbinary(minuteB2), calculatePosX(3) + SEPARATOR, calculatePosY(4));

  text(":", calculatePosX(3) + 2 * SEPARATOR + SEPARATOR/2, calculatePosY(4));

  text(unbinary(secondB1), calculatePosX(4) + 2 * SEPARATOR, calculatePosY(4));
  text(unbinary(secondB2), calculatePosX(5) + 2 * SEPARATOR, calculatePosY(4));

  text("8", calculatePosX(6) + 2 * SEPARATOR, calculatePosY(0) + 10);
  text("4", calculatePosX(6) + 2 * SEPARATOR, calculatePosY(1) + 10);
  text("2", calculatePosX(6) + 2 * SEPARATOR, calculatePosY(2) + 10);
  text("1", calculatePosX(6) + 2 * SEPARATOR, calculatePosY(3) + 10);
}

int calculatePosX(int position) {
  return position * FIGURE_WIDTH + FIGURE_WIDTH/2 + FRAME_CLOCK_MARGIN;
}

int calculatePosY(int position) {
  return position * FIGURE_HEIGHT + FIGURE_HEIGHT/2 + FRAME_CLOCK_MARGIN/2;
}
