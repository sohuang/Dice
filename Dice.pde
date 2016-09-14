import java.util.*;

int counter;
int dieSize = 30;
int dieHalf = dieSize / 2;
int dieThird = dieSize / 3;
int dieFour = dieHalf / 2;
int dotSize = 5;
int spacing = 10;
PFont comic;

void setup() {
	size(370, 375);
	noLoop();
	comic = loadFont("ComicSansMS-48.vlw");
	textAlign(CENTER, CENTER);
	textFont(comic);
}

void draw() {
	background(0);
	counter = 0;
	for (int j = spacing; j < (height * 3 / 4); j += dieSize + spacing) {
		for (int i = spacing; i < width - dieSize; i += dieSize + spacing) {
			Die die = new Die(i, j);
		}
	}
	showScore();
}

void mousePressed() {
	redraw();
}

void showScore() {
	fill(255);
	textSize(20);
	// text("number: " + counter, width / 2, 3 * height / 4);
}

class Die {
	int myX, myY;
	int myDieNum;
	HashMap<String, Integer> hm = new HashMap<String, Integer>();

	Die(int x, int y) {
		myX = x;
		myY = y;
		roll();
		show();
	}
	void roll() {
		myDieNum = (int)(Math.random() * 6) + 1;
		counter += myDieNum;
		hm = new HashMap<String, Integer>();
		for (int i = 1; i < 7; i++) {
			if (i == myDieNum) {
				hm.put("n" + i, 0);
			}
		}
		Set set = hm.entrySet();
		Iterator it = set.iterator();
		while (it.hasNext()) {
			Map.Entry me = (Map.Entry)it.next();
			for (int i = 1; i < 7; i++) {
				if (me.getKey().toString().indexOf(Integer.toString(i)) != -1) {
					hm.put(me.getKey().toString(), hm.get(me.getKey()) + myDieNum);
				}
				System.out.println(me.getValue());
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