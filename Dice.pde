int counter;
int dieSize = 30;
int dieHalf = dieSize / 2;
int dieThird = dieSize / 3;
int dieFour = dieHalf / 2;
int dotSize = 5;
int spacing = 10;

void setup() {
	size(370, 375);
	noLoop();
	textAlign(CENTER, CENTER);
}

void draw() {
	background(0);
	counter = 0;
	for (int j = spacing; j < height / 2; j += dieSize + spacing) {
		for (int i = spacing; i < width - dieSize; i += dieSize + spacing) {
			Die die = new Die(i, j);
		}
	}
	fill(255);
	text(counter, width / 2, 3 * height / 4);
}

void mousePressed() {
	redraw();
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
	}
	void show() {
		noStroke();
		fill(255);
		rect(myX, myY, dieSize, dieSize, 5);
		showDots();
	}
	void showDots() {
		fill(0);
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
}
