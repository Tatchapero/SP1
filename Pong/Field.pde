class Field {
  color fieldColor;
  color middleLineFieldColor;
  int middleLineStripeCount;
  int middleLineXPosition;
  int middleLineYPosition;
  int middleLineWidth;
  int middleLineHeight;
  float whiteStripeHeightPercent;

  Field() {
    fieldColor = color(0);
    middleLineFieldColor = color(255);
    middleLineStripeCount = 30;
    middleLineXPosition = width/2;
    middleLineYPosition = height/2;
    middleLineWidth = width/750;
    middleLineHeight = height;
    whiteStripeHeightPercent = 0.5f;
  }

  void display() {
    background(fieldColor);
    displayMiddleLineStripes();
  }

  void displayMiddleLineStripes() {
    noStroke();
    rectMode(CENTER);

    // Draw a white line through the middle
    fill(middleLineFieldColor);
    rect(middleLineXPosition, middleLineYPosition, middleLineWidth, middleLineHeight);

    // Draw black stripes on top of the white line
    fill(fieldColor);
    for (int i = 0; i <= middleLineStripeCount; i++) {
      rect(middleLineXPosition, i * (height / middleLineStripeCount), width, height / middleLineStripeCount * whiteStripeHeightPercent);
    }
  }
}
