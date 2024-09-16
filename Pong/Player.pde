class Player {
  String name;
  color playerColor;
  int playerXPosition;
  int playerYPosition;
  int playerWidth;
  int playerHeight;

  Player() {
    name = "Player";
    playerColor = color(255);
    playerXPosition = width/8;
    playerWidth = width/250;
    playerHeight = height/20;
  }

  void display() {
    fill(playerColor);
    noStroke();
    rectMode(CENTER);
  }

  void playerControls() {
    // Player control using mouse
    playerYPosition = mouseY;
    rect(playerXPosition, constrain(playerYPosition, playerHeight/2, height-playerHeight/2), playerWidth, playerHeight);
  }
}
