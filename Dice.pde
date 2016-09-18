import java.util.Arrays;

int[] stats = new int[6];
int counter;
int dieSize = 30;
int dieHalf = dieSize / 2;
int dieThird = dieSize / 3;
int dieFour = dieHalf / 2;
int dotSize = 5;
int spacing = 10;
int highScore = 0;
PFont comic;
PImage kanye;

void setup() {
	size(370, 375);
	noLoop();
	comic = loadFont("ComicSansMS-48.vlw");
	kanye = loadImage("kanye.png");
	textFont(comic);
}

void draw() {
	background(0);
	counter = 0;
	for (int thing : stats) {
		thing = 0;
	}
	for (int j = spacing; j < (height / 2); j += dieSize + spacing) {
		for (int i = spacing; i < width - dieSize; i += dieSize + spacing) {
			Die die = new Die(i, j);
		}
	}
	showScore();
	showStats();
	showHighScore();
	encouragement();
}

void mousePressed() {
	redraw();
}

void showScore() {
	textAlign(LEFT);
	fill(255);
	textSize(20);
	text("total: " + counter, width / 2 - 40, height / 2 + 50);
}

void showStats() {
	fill(255);
	textSize(10);
	int yPos = 275;
	for (int i = 0; i < stats.length / 2; i++) {
		text("Number of " + Integer.toString(i) + "s: " + Integer.toString(stats[i]), 50, yPos);
		yPos += 20;
	}
	yPos = 275;
	for (int i = stats.length / 2; i < stats.length; i++) {
		text("Number of " + Integer.toString(i) + "s: " + Integer.toString(stats[i]), 250, yPos);
		yPos += 20;
	}
}

void showHighScore() {
	fill(255);
	textSize(20);
	if (counter > highScore) {
		highScore = counter;
	}
	if (highScore != 0) {
		text("high score: " + Integer.toString(highScore), width / 2 - 60, height - 20);
	}
}

void encouragement() {
	kanye.resize(100, 0);
	imageMode(CENTER);
	image(kanye, width / 2, height - 90);
}

class Die {
	int myX, myY;
	int myDieNum;

	Die(int x, int y) {
		myX = x;
		myY = y;
		roll();
		show();
	}
	void roll() {
		myDieNum = (int)(Math.random() * 6) + 1;
		counter += myDieNum;
		for (int i = 0; i < stats.length; i++) {
			if (myDieNum == i + 1) {
				stats[i]++;
			}
		}
	}
	void show() {
		noStroke();
		fill(255);
		rect(myX, myY, dieSize, dieSize, 5);
		showDots();
	}
	void showDots() {
		randomColor();
		if (myDieNum % 2 == 1) {
			ellipse(myX + dieHalf, myY + dieHalf, dotSize, dotSize);
		}
		if (myDieNum > 1) {
			ellipse(myX + dieFour, myY + dieFour, dotSize, dotSize);
			ellipse(myX + (dieSize - dieFour), myY + (dieSize - dieFour), dotSize, dotSize);
			if (myDieNum > 3) {
				ellipse(myX + (dieSize - dieFour), myY + dieFour, dotSize, dotSize);
				ellipse(myX + dieFour, myY + (dieSize - dieFour), dotSize, dotSize);
				if (myDieNum == 6) {
					ellipse(myX + dieFour, myY + dieHalf, dotSize, dotSize);
					ellipse(myX + (dieSize - dieFour), myY + dieHalf, dotSize, dotSize);
				}
			}
		}
	}
	void randomColor() {
		int h = (int)(Math.random() * 360);
		int s = (int)(Math.random() * 85) + 20;
		int b = (int)(Math.random() * 50) + 20;
		colorMode(HSB, 360, 100, 100);
		fill(h, s, b);
		colorMode(RGB, 255, 255, 255);
	}
}
