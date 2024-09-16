class Cpu extends Player {
  int cpuSpeed;

  Cpu() {
    name = "CPU";
    playerColor = color(255);
    playerXPosition = width - width/8;
    playerYPosition = height/2;
    playerWidth = width/250;
    playerHeight = height/20;
    cpuSpeed = 5;
  }
  
  void playerControls(int ballYPosition) {
    if (ballYPosition < playerYPosition) {
      playerYPosition -= cpuSpeed;
    }
    else if (ballYPosition > playerYPosition) {
      playerYPosition += cpuSpeed;
    }
    
    rect(playerXPosition, constrain(playerYPosition, playerHeight/2, height-playerHeight/2), playerWidth, playerHeight);
  }
  
  void addCpuSpeed(int speed) {
    cpuSpeed = 5 + speed;
  }
}
