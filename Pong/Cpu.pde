class Cpu extends Player {
  int cpuSpeed;
  int baseCpuSpeed;

  Cpu() {
    name = "CPU";
    playerColor = color(255);
    playerXPosition = width - width/8;
    playerYPosition = height/2;
    playerWidth = width/250;
    playerHeight = height/20;
    cpuSpeed = 4;
    baseCpuSpeed = 4;
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
    cpuSpeed = baseCpuSpeed + speed;
  }
}
