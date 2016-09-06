int counter;
int dieSize = 30;
int spacing = 10;

void setup() {
	size(370, 375);
	noLoop();
}

void draw() {
	background(0);
	counter = 0;
	for (int i = spacing; i < width - dieSize; i += dieSize + spacing) {
		Die die = new Die(i, spacing);
	}
}

void mousePressed() {
	redraw();
}

class Die {
	int myX, myY;
	Die(int x, int y) {
		myX = x;
		myY = y;
		roll();
		show();
	}
	void roll() {
		int dieNum = (int)(Math.random() * 6);
	}
	void show() {
		noStroke();
		fill(255);
		rect(myX, myY, dieSize, dieSize, 5);
	}
}
