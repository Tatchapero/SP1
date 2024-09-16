class Ball {
  color ballColor;
  int ballSize;
  int ballXPosition;
  int ballYPosition;
  int ballSpeedX;
  int ballSpeedY;
  int ballMinSpeed;
  int ballMaxSpeed;
  Point[] pos;

  Ball() {
    ballColor = color(255);
    ballSize = width/250;
    ballXPosition = width/2;
    ballYPosition = (int)random(height/4, height-height/4);
    ballSpeedX = -15;
    ballSpeedY = (int)random(-10, 10);
    ballMinSpeed = -10;
    ballMaxSpeed = -15;
    pos = new Point[10];

    for (int i = 0; i < pos.length; i++) {
      pos[i] = new Point();
    }
  }

  public void display() {
    update();
    
    for (int i = 0; i < pos.length; i++) {
      fill(ballColor, 255 * i/pos.length);
      noStroke(); 
      rectMode(CENTER);
      rect(pos[i].x, pos[i].y, ballSize, ballSize);
    }    
  }

  void move() {
    ballXPosition += ballSpeedX;
    ballYPosition += ballSpeedY;
  }

  void respawn() {
    if (ballXPosition >= width) {
      ballSpeedX = abs(ballMinSpeed);
    } else if (ballXPosition <= 0) {
      ballSpeedX = ballMinSpeed;
    }

    ballXPosition = width/2;
    ballYPosition = (int)random(height/4, height-height/4);
    ballSpeedX = adjustSpeed(ballSpeedX, 5);
    ballSpeedY = (int)random(ballMaxSpeed, abs(ballMaxSpeed));
  }

  void bounce() {
    if (ballYPosition > height || ballYPosition < 0) {
      ballSpeedY *= -1;
    }
  }

  void checkPlayerCollision(Player player) {
    boolean ballIsGreaterThanPlayerTop = ballYPosition >= player.playerYPosition - player.playerHeight/2;
    boolean ballIsLessThanPlayerBottom = ballYPosition <= player.playerYPosition + player.playerHeight/2;
    boolean ballIsGreaterThanPlayerLeft = ballXPosition >= player.playerXPosition - player.playerWidth/2;
    boolean ballIsLessThanPlayerRight = ballXPosition <= player.playerXPosition + player.playerWidth/2;

    if (ballIsGreaterThanPlayerTop && ballIsLessThanPlayerBottom && ballIsGreaterThanPlayerLeft && ballIsLessThanPlayerRight) {
      bounce(player);
    }
  }

  void bounce(Player player) {
    float distance = dist(ballXPosition, ballYPosition, player.playerXPosition, player.playerYPosition);

    ballSpeedX = adjustSpeed(ballSpeedX, distance);

    if (ballYPosition > player.playerYPosition && ballSpeedY <= 0) {
      ballSpeedY = adjustSpeed(ballSpeedY, distance);
      ballSpeedY *= -1;
    } else if (ballYPosition < player.playerYPosition && ballSpeedY >= 0) {
      ballSpeedY = adjustSpeed(ballSpeedY, distance);
      ballSpeedY *= -1;
    }

    ballSpeedX *= -1;
  }

  int adjustSpeed(int currentSpeed, float newSpeed) {
    if (currentSpeed <= 0) {
      newSpeed = constrain(newSpeed * -1, ballMinSpeed, ballMaxSpeed);
    } else if (currentSpeed >= 0) {
      newSpeed = constrain(newSpeed, abs(ballMinSpeed), abs(ballMaxSpeed));
    }
    return (int)newSpeed;
  }

  int positionY() {
    return ballYPosition;
  }

  void update() {
    // Shift array values
    for (int i = 0; i < pos.length-1; i++) {
      pos[i].x = pos[i+1].x;
      pos[i].y = pos[i+1].y;
    }

    // New location
    pos[pos.length-1].x = ballXPosition;
    pos[pos.length-1].y = ballYPosition;
  }
}
