Field field;
Player player;
Cpu cpu;
Ball ball;
Score scoreboard;

void settings() {
  size(displayWidth, displayHeight);
  fullScreen();  
}

void setup() {
  frameRate(120);
  field = new Field();
  player = new Player();
  cpu = new Cpu();
  ball = new Ball();
  scoreboard = new Score();
}

void draw() {  
  field.display();
  player.display();
  player.playerControls();
  cpu.display();
  cpu.playerControls(ball.positionY());
  cpu.addCpuSpeed(scoreboard.playerScore()/2);
  ball.display();
  ball.move();
  ball.bounce();
  ball.checkPlayerCollision(player);
  ball.checkPlayerCollision(cpu);  
  scoreboard.display();
  scoreboard.updateScore(ball);
}
