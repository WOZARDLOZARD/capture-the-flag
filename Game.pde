boolean gameLoaded;
float progress, progressAmount;
String[] tips = {
  "Use WASD for player 1, and arrow keys for player 2!", 
  "Bring the opponent's flag to your endzone to win!", 
  "You can get tagged on your opponent's side and sent back to your spawn point!", 
  "When moving, there's a delay before reaching full speed!", 
  "If you've been playing for a long time, consider taking a break!", 
  "In 2 player portals, you can go off the edge of the map!", 
  "In 1 player AI, you're playing against a bot that varies in difficulty!", 
  "In 2 player modes, you can choose the game type from 10 points and timed.", 
  "In 10 points mode, the first player to 10 points wins.", 
  "In timed mode, the player with the most points at the end of 3 minutes wins.", 
  "If you tag your opponent on your side, you'll tag them but drop their flag!", 
  "After getting tagged, you must wait 3 seconds before being able to move again!", 
  "The menu contains some useful in-game settings!", 
  "Take a look at the help page for more info.", 
  "The settings page on the homepage contains some advanced settings!", 
  "You can toggle the music and SFX using the settings page or the in-game menu!", 
  "You can toggle the censor using the settings page to block inappropriate names.", 
  "You'll be sent back to your spawn point for standing on your own flag!", 
  "You can increase/decrease the game volume in the app.", 
  "In 1 player AI, player 1 (the player on the left) is controlled by you.", 
  "The development of this game is made possible by Processing 3 and Minim.", 
  "Look at the indicators along the bottom for your player spell cooldowns!", 
  "Flash teleports your player a short distance based on your direction.", 
  "Sprint increases your max speed for a short duration.", 
  "Shield makes you invulnerable to the next tag in a short duration.", 
  "Exhaust slows your opponent for a short duration.", 
  "You can build up a streak by capturing multiple flags in a row!", 
  "If your opponent gets your flag, your streak will be reset.", 
  "You can get a \"flawless victory\" by playing a perfect game!", 
  "In 2 player modes, slow zones will randomly appear on the map!", 
  "Grab a powerup that spawns periodically to gain an advantage!", 
  "Read these for useful bits of information!", 
  "The loading that is occuring right now may or may not be simulated..."
};
color f1Zone, f2Zone;
int f1Time, f2Time;
int randomTip;
int gameSecond, gameMinute;
String gameSecondString;
int gameCounter, gameTime;
color gameTimeColor;
float p1X, p1Y, p2X, p2Y;
int p1Score, p2Score;
int p1Streak, p2Streak;
float f1X, f1Y, f2X, f2Y;
boolean f1Picked, f2Picked;
boolean p1Up, p1Down, p1Left, p1Right, p2Up, p2Down, p2Left, p2Right;
float p1UpSpeed, p1DownSpeed, p1LeftSpeed, p1RightSpeed, p2UpSpeed, p2DownSpeed, p2LeftSpeed, p2RightSpeed;
float p1UpSto, p1DownSto, p1LeftSto, p1RightSto, p2UpSto, p2DownSto, p2LeftSto, p2RightSto;
int p1Timeout, p2Timeout;
int gameTimeout;
int startTimeout;
boolean p1Scored, p2Scored;
boolean p1Shutdown, p2Shutdown;
int p1Flash, p2Flash;
int p1Ghost, p2Ghost;
int p1GhostC, p2GhostC;
boolean p1Ghosting, p2Ghosting;
int p1Shield, p2Shield;
int p1ShieldC, p2ShieldC;
boolean p1Shielded, p2Shielded;
int p1Exhaust, p2Exhaust;
int p1ExhaustC, p2ExhaustC;
boolean p1Exhausted, p2Exhausted;
int p1Kills, p1Deaths, p2Kills, p2Deaths;

float[] block1X, block1Y, block2X, block2Y;

float powerX, powerY;
boolean powerSpawned;
int powerCounter;
int powerRandom;

boolean displayingMenu;
boolean playingMusic, playingSfx;

boolean gameFinished;

int randomAi;
boolean aiPicked;

class Game {
  Game() {
    gameLoaded = false;
    gameTimeout = 180;
    progress = 0.0;
    progressAmount = 0.0;
    gameCounter = 0;
    gameSecond = 0;
    gameMinute = 0;
    gameSecondString = "00";
    gameTime = 180;
    gameTimeColor = color(255, 255, 255);
    p1X = 160;
    p1Y = height / 2;
    p2X = width - 160;
    p2Y = height / 2;
    p1Score = 0;
    p2Score = 0;
    p1Streak = 0;
    p2Streak = 0;
    f1X = 40;
    f1Y = height / 2;
    f2X = width - 40;
    f2Y = height / 2;
    f1Zone = color(57, 153, 18);
    f2Zone = color(57, 153, 18);
    f1Picked = false;
    f2Picked = false;
    p1Up = false;
    p1Down = false;
    p1Left = false;
    p1Right = false;
    p2Up = false;
    p2Down = false;
    p2Left = false;
    p2Right = false;
    p1UpSpeed = 0;
    p1DownSpeed = 0;
    p1LeftSpeed = 0;
    p1RightSpeed = 0;
    p2UpSpeed = 0;
    p2DownSpeed = 0;
    p2LeftSpeed = 0;
    p2RightSpeed = 0;
    p1UpSto = 0;
    p1DownSto = 0;
    p1LeftSto = 0;
    p1RightSto = 0;
    p2UpSto = 0;
    p2DownSto = 0;
    p2LeftSto = 0;
    p2RightSto = 0;
    p1Timeout = 180;
    p2Timeout = 180;
    startTimeout = 0;
    p1Scored = false;
    p2Scored = false;
    p1Shutdown = false;
    p2Shutdown = false;
    randomAi = 0;
    aiPicked = false;
    p1Flash = 0;
    p2Flash = 0;
    p1Ghost = 300;
    p2Ghost = 300;
    p1GhostC = 0;
    p2GhostC = 0;
    p1Ghosting = false;
    p2Ghosting = false;
    p1Shield = 90;
    p2Shield = 90;
    p1ShieldC = 0;
    p2ShieldC = 0;
    p1Shielded = false;
    p2Shielded = false;
    p1Exhaust = 240;
    p2Exhaust = 240;
    p1ExhaustC = 0;
    p2ExhaustC = 0;
    p1Exhausted = false;
    p2Exhausted = false;
    p1Kills = 0;
    p1Deaths = 0;
    p2Kills = 0;
    p2Deaths = 0;
  }

  void load() {
    noStroke();
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("Loading...", width / 2, height / 2 - 40);
    textSize(26);
    text(round(progress / 250.0 * 100.0) + "%", width / 2, height / 2 + 50);
    textSize(20);
    if (progress < 60) {
      if (modeSelected == 0 || modeSelected == 2) {
        text("Initializing map", width / 2, height / 2 + 80);
      } else if (modeSelected == 1) {
        text("Initializing AI", width / 2, height / 2 + 80);
      }

      progressAmount = 1.0;
    } else if (progress >= 60 && progress < 120) {
      text("Initializing objects", width / 2, height / 2 + 80);

      progressAmount = 0.5;
    } else if (progress >= 120 && progress < 180) {
      text("Initializing physics", width / 2, height / 2 + 80);

      progressAmount = 1.5;
    } else if (progress >= 180 && progress < 215) {
      text("Preparing", width / 2, height / 2 + 80);

      progressAmount = 1.0;
    } else if (progress >= 215) {
      text("Starting game", width / 2, height / 2 + 80);

      progressAmount = 2.0;
    }

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width / 2, height / 2, 250, 20, 20); // Progress bar border
    rect(40, 40, 40, 40, 10); // Back button border

    noStroke();
    fill(255);
    beginShape(); // Back button icon
    vertex(50, 30);
    vertex(30, 40);
    vertex(50, 50);
    endShape();

    fill(0, 0, 0, 100);
    rectMode(CENTER);
    stroke(0, 0, 0, 100);
    strokeWeight(2);

    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      rect(40, 40, 40, 40, 10);
    }

    if (progress < 250) {
      progress += progressAmount;
    } else {
      gameLoaded = true;
    }

    fill(255);
    stroke(255);
    strokeWeight(2);
    rectMode(CORNER);
    rect(width / 2 - 125, height / 2 - 10, progress, 20, 20); // Progress bar fill

    textSize(26);
    text("Tip", width / 2, height - 100);
    textSize(20);
    text(tips[randomTip], width / 2, height - 70);
  }

  void drawBackground() {
    noStroke();
    rectMode(CENTER);

    fill(p1Colors[p1Color][0], p1Colors[p1Color][1], p1Colors[p1Color][2]);
    rect(width / 4, height / 2, width / 2, height);
    fill(p2Colors[p2Color][0], p2Colors[p2Color][1], p2Colors[p2Color][2]);
    rect(width / 2 + width / 4, height / 2, width / 2, height);
  }

  void display() {
    strokeWeight(3);
    rectMode(CENTER);
    noFill();    
    if (!f1Picked) {
      stroke(f1Zone);
      rect(f1X + 10, f1Y, 100, 100, 10);
    }
    if (!f2Picked) {
      stroke(f2Zone);
      rect(f2X - 10, f2Y, 100, 100, 10);
    }

    rectMode(CENTER);
    strokeWeight(3);
    textAlign(CENTER);

    if (p1Timeout > 0) {
      stroke(100);
    } else if (p1Shielded) {
      stroke(127, 7, 240);
    } else if (p1Exhausted) {
      stroke(247, 85, 10);
    } else if (p1Ghosting) {
      stroke(26, 127, 217);
    } else {
      stroke(0);
    }
    fill(p1Colors[p1Color][0], p1Colors[p1Color][1], p1Colors[p1Color][2]); // Players
    rect(p1X, p1Y, 34, 34, 6);
    if (gameTimeout > 0) {
      fill(0);
      textSize(20);
      noStroke();
      text(p1Name, p1X, p1Y - 30);
      text(p1Kills + "/" + p1Deaths, p1X, p1Y - 50);
    }

    if (p2Timeout > 0) {
      stroke(100);
    } else if (p2Shielded) {
      stroke(127, 7, 240);
    } else if (p2Exhausted) {
      stroke(247, 85, 10);
    } else if (p2Ghosting) {
      stroke(26, 127, 217);
    } else {
      stroke(0);
    }
    fill(p2Colors[p2Color][0], p2Colors[p2Color][1], p2Colors[p2Color][2]);
    rect(p2X, p2Y, 34, 34, 6);
    if (gameTimeout > 0) {
      fill(0);
      textSize(20);
      noStroke();
      text(p2Name, p2X, p2Y - 30);
      text(p2Kills + "/" + p2Deaths, p2X, p2Y - 50);
    }

    fill(0); // Flags
    noStroke();
    rect(f1X, f1Y, 3, 60);
    stroke(0);
    strokeWeight(2);
    fill(p1Colors[p1Color][0], p1Colors[p1Color][1], p1Colors[p1Color][2]);
    rect(f1X + 11, f1Y - 19, 22, 22);
    fill(0);
    noStroke();
    rect(f2X, f2Y, 3, 60);
    stroke(0);
    strokeWeight(2);
    fill(p2Colors[p2Color][0], p2Colors[p2Color][1], p2Colors[p2Color][2]);
    rect(f2X - 11, f2Y - 19, 22, 22);

    if (gameTimeout > 0) {
      stroke(100);
      strokeWeight(4);
      fill(150);
      beginShape();
      vertex(width / 2 - 245, 0);
      vertex(width / 2 - 245, 20);
      vertex(width / 2 - 225, 20);
      vertex(width / 2 - 225, 45);
      vertex(width / 2 - 175, 45);
      vertex(width / 2 - 175, 80);
      vertex(width / 2 + 175, 80);
      vertex(width / 2 + 175, 45);
      vertex(width / 2 + 225, 45);
      vertex(width / 2 + 225, 20);
      vertex(width / 2 + 245, 20);
      vertex(width / 2 + 245, 0);
      endShape();

      noStroke();
      textAlign(CENTER);
      textSize(44);
      fill(p1Colors[p1Color][0], p1Colors[p1Color][1], p1Colors[p1Color][2]);
      text(p1Score, width / 2 - 100, 50);
      fill(p2Colors[p2Color][0], p2Colors[p2Color][1], p2Colors[p2Color][2]);
      text(p2Score, width / 2 + 100, 50);
      fill(255);
      text("VS", width / 2, 50);

      stroke(245, 180, 39);
      noFill();
      strokeWeight(2);
      rectMode(CENTER);
      if (p1Score == 9) rect(width / 2 - 100, 35, 55, 55, 10);
      if (p2Score == 9) rect(width / 2 + 100, 35, 55, 55, 10);
    }

    fill(0);
    textAlign(CENTER);
    noStroke();
    textSize(16);
    text("FPS: " + round(frameRate), 50, 30);
    if (modeSelected == 0 && typeSelected == 0 || modeSelected == 1 || modeSelected == 2 && typeSelected == 0) {
      if (gameTimeout == 0) {
        fill(0);
        rectMode(CENTER);
        rect(width / 2, 35, 80, 30, 50);

        textSize(20);
        fill(255);
        text(gameMinute + ":" + gameSecondString, width / 2, 40);
      }
    } else if (modeSelected == 0 && typeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
      if (gameTimeout == 0) {
        fill(0);
        rectMode(CENTER);
        rect(width / 2, 35, 80, 30, 50);

        textSize(20);
        fill(gameTimeColor);
        text(gameMinute + ":" + gameSecondString, width / 2, 40);
      }
    }

    if (p1Flash > 0) {
      strokeWeight(2);
      fill(0);
      stroke(247, 227, 2);
      ellipse(40, height - 40, 30, 30);
      fill(247, 227, 2);
      arc(40, height - 40, 30, 30, -HALF_PI, map(p1Flash, 1800, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2Flash > 0) {
      fill(0);
      stroke(247, 227, 2);
      strokeWeight(2);
      ellipse(width - 40, height - 40, 30, 30);
      fill(247, 227, 2);
      arc(width - 40, height - 40, 30, 30, -HALF_PI, map(p2Flash, 1800, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1Ghosting && p1Ghost > 0) {
      strokeWeight(2);
      fill(0, 170, 255);
      stroke(0);
      ellipse(90, height - 40, 30, 30);
      fill(0);
      arc(90, height - 40, 30, 30, -HALF_PI, map(p1Ghost, 300, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1GhostC > 0 && !p1Ghosting) {
      strokeWeight(2);
      fill(0);
      stroke(0, 170, 255);
      ellipse(90, height - 40, 30, 30);
      fill(0, 170, 255);
      arc(90, height - 40, 30, 30, -HALF_PI, map(p1GhostC, 1200, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2Ghosting && p2Ghost > 0) {
      strokeWeight(2);
      fill(0, 170, 255);
      stroke(0);
      ellipse(width - 90, height - 40, 30, 30);
      fill(0);
      arc(width - 90, height - 40, 30, 30, -HALF_PI, map(p2Ghost, 300, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2GhostC > 0 && !p2Ghosting) {
      strokeWeight(2);
      fill(0);
      stroke(0, 170, 255);
      ellipse(width - 90, height - 40, 30, 30);
      fill(0, 170, 255);
      arc(width - 90, height - 40, 30, 30, -HALF_PI, map(p2GhostC, 1200, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1Shielded && p1Shield > 0) {
      strokeWeight(2);
      fill(127, 7, 240);
      stroke(0);
      ellipse(140, height - 40, 30, 30);
      fill(0);
      arc(140, height - 40, 30, 30, -HALF_PI, map(p1Shield, 90, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1ShieldC > 0 && !p1Shielded) {
      strokeWeight(2);
      fill(0);
      stroke(127, 7, 240);
      ellipse(140, height - 40, 30, 30);
      fill(127, 7, 240);
      arc(140, height - 40, 30, 30, -HALF_PI, map(p1ShieldC, 1800, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2Shielded && p2Shield > 0) {
      strokeWeight(2);
      fill(127, 7, 240);
      stroke(0);
      ellipse(width - 140, height - 40, 30, 30);
      fill(0);
      arc(width - 140, height - 40, 30, 30, -HALF_PI, map(p2Shield, 90, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2ShieldC > 0 && !p2Shielded) {
      strokeWeight(2);
      fill(0);
      stroke(127, 7, 240);
      ellipse(width - 140, height - 40, 30, 30);
      fill(127, 7, 240);
      arc(width - 140, height - 40, 30, 30, -HALF_PI, map(p2ShieldC, 1800, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2Exhausted && p1Exhaust > 0) {
      strokeWeight(2);
      fill(247, 85, 10);
      stroke(0);
      ellipse(190, height - 40, 30, 30);
      fill(0);
      arc(190, height - 40, 30, 30, -HALF_PI, map(p1Exhaust, 240, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1ExhaustC > 0 && !p2Exhausted) {
      strokeWeight(2);
      fill(0);
      stroke(247, 85, 10);
      ellipse(190, height - 40, 30, 30);
      fill(247, 85, 10);
      arc(190, height - 40, 30, 30, -HALF_PI, map(p1ExhaustC, 1800, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1Exhausted && p2Exhaust > 0) {
      strokeWeight(2);
      fill(247, 85, 10);
      stroke(0);
      ellipse(width - 190, height - 40, 30, 30);
      fill(0);
      arc(width - 190, height - 40, 30, 30, -HALF_PI, map(p2Exhaust, 240, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2ExhaustC > 0 && !p1Exhausted) {
      strokeWeight(2);
      fill(0);
      stroke(247, 85, 10);
      ellipse(width - 190, height - 40, 30, 30);
      fill(247, 85, 10);
      arc(width - 190, height - 40, 30, 30, -HALF_PI, map(p2ExhaustC, 1800, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p1Timeout > 0) {
      strokeWeight(2);
      fill(0);
      stroke(32, 176, 7);
      ellipse(240, height - 40, 30, 30);
      fill(32, 176, 7);
      arc(240, height - 40, 30, 30, -HALF_PI, map(p1Timeout, 180, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }

    if (p2Timeout > 0) {
      strokeWeight(2);
      fill(0);
      stroke(32, 176, 7);
      ellipse(width - 240, height - 40, 30, 30);
      fill(32, 176, 7);
      arc(width - 240, height - 40, 30, 30, -HALF_PI, map(p2Timeout, 180, 0, 0, TWO_PI) - HALF_PI);

      noStroke();
    }
  }

  void movePlayers() {
    if (p1Up) {
      if (!p1Ghosting && !p1Exhausted) {
        if (p1UpSpeed < 6) {
          p1UpSpeed += 0.1;
        } else if (p1UpSpeed > 6) p1UpSpeed -= 0.1;
      } else if (p1Ghosting && !p1Exhausted) {
        if (p1UpSpeed < 8) p1UpSpeed += 0.1;
      } else if (p1Exhausted) {
        if (p1UpSpeed < 4) {
          p1UpSpeed += 0.1;
        } else if (p1UpSpeed > 4) p1UpSpeed -= 0.1;
      }

      p1Y -= p1UpSpeed;
    } else {
      if (p1UpSpeed > 0) {
        p1UpSpeed -= 0.1;
        p1Y -= p1UpSpeed;
      }
    }

    if (p1Down) {
      if (!p1Ghosting && !p1Exhausted) {
        if (p1DownSpeed < 6) {
          p1DownSpeed += 0.1;
        } else if (p1DownSpeed > 6) p1DownSpeed -= 0.1;
      } else if (p1Ghosting && !p1Exhausted) {
        if (p1DownSpeed < 8) p1DownSpeed += 0.1;
      } else if (p1Exhausted) {
        if (p1DownSpeed < 4) {
          p1DownSpeed += 0.1;
        } else if (p1DownSpeed > 4) p1DownSpeed -= 0.1;
      }

      p1Y += p1DownSpeed;
    } else {
      if (p1DownSpeed > 0) {
        p1DownSpeed -= 0.1;
        p1Y += p1DownSpeed;
      }
    }

    if (p1Left) {
      if (!p1Ghosting && !p1Exhausted) {
        if (p1LeftSpeed < 6) {
          p1LeftSpeed += 0.1;
        } else if (p1LeftSpeed > 6) p1LeftSpeed -= 0.1;
      } else if (p1Ghosting && !p1Exhausted) {
        if (p1LeftSpeed < 8) p1LeftSpeed += 0.1;
      } else if (p1Exhausted) {
        if (p1LeftSpeed < 4) {
          p1LeftSpeed += 0.1;
        } else if (p1LeftSpeed > 4) p1LeftSpeed -= 0.1;
      }

      p1X -= p1LeftSpeed;
    } else {
      if (p1LeftSpeed > 0) {
        p1LeftSpeed -= 0.1;
        p1X -= p1LeftSpeed;
      }
    }

    if (p1Right) {
      if (!p1Ghosting && !p1Exhausted) {
        if (p1RightSpeed < 6) {
          p1RightSpeed += 0.1;
        } else if (p1RightSpeed > 6) p1RightSpeed -= 0.1;
      } else if (p1Ghosting && !p1Exhausted) {
        if (p1RightSpeed < 8) p1RightSpeed += 0.1;
      } else if (p1Exhausted) {
        if (p1RightSpeed < 4) {
          p1RightSpeed += 0.1;
        } else if (p1RightSpeed > 4) p1RightSpeed -= 0.1;
      }

      p1X += p1RightSpeed;
    } else {
      if (p1RightSpeed > 0) {
        p1RightSpeed -= 0.1;
        p1X += p1RightSpeed;
      }
    }

    if (p2Up) {
      if (!p2Ghosting && !p2Exhausted) {
        if (p2UpSpeed < 6) {
          p2UpSpeed += 0.1;
        } else if (p2UpSpeed > 6) p2UpSpeed -= 0.1;
      } else if (p2Ghosting && !p2Exhausted) {
        if (p2UpSpeed < 8) p2UpSpeed += 0.1;
      } else if (p2Exhausted) {
        if (p2UpSpeed < 4) {
          p2UpSpeed += 0.1;
        } else if (p2UpSpeed > 4) p2UpSpeed -= 0.1;
      }

      p2Y -= p2UpSpeed;
    } else {
      if (p2UpSpeed > 0) {
        p2UpSpeed -= 0.1;
        p2Y -= p2UpSpeed;
      }
    }

    if (p2Down) {
      if (!p2Ghosting && !p2Exhausted) {
        if (p2DownSpeed < 6) {
          p2DownSpeed += 0.1;
        } else if (p2DownSpeed > 6) p2DownSpeed -= 0.1;
      } else if (p2Ghosting && !p2Exhausted) {
        if (p2DownSpeed < 8) p2DownSpeed += 0.1;
      } else if (p2Exhausted) {
        if (p2DownSpeed < 4) {
          p2DownSpeed += 0.1;
        } else if (p2DownSpeed > 4) p2DownSpeed -= 0.1;
      }

      p2Y += p2DownSpeed;
    } else {
      if (p2DownSpeed > 0) {
        p2DownSpeed -= 0.1;
        p2Y += p2DownSpeed;
      }
    }

    if (p2Left) {
      if (!p2Ghosting && !p2Exhausted) {
        if (p2LeftSpeed < 6) {
          p2LeftSpeed += 0.1;
        } else if (p2LeftSpeed > 6) p2LeftSpeed -= 0.1;
      } else if (p2Ghosting && !p2Exhausted) {
        if (p2LeftSpeed < 8) p2LeftSpeed += 0.1;
      } else if (p2Exhausted) {
        if (p2LeftSpeed < 4) {
          p2LeftSpeed += 0.1;
        } else if (p2LeftSpeed > 4) p2LeftSpeed -= 0.1;
      }

      p2X -= p2LeftSpeed;
    } else {
      if (p2LeftSpeed > 0) {
        p2LeftSpeed -= 0.1;
        p2X -= p2LeftSpeed;
      }
    }

    if (p2Right) {
      if (!p2Ghosting && !p2Exhausted) {
        if (p2RightSpeed < 6) {
          p2RightSpeed += 0.1;
        } else if (p2RightSpeed > 6) p2RightSpeed -= 0.1;
      } else if (p2Ghosting && !p2Exhausted) {
        if (p2RightSpeed < 8) p2RightSpeed += 0.1;
      } else if (p2Exhausted) {
        if (p2RightSpeed < 4) {
          p2RightSpeed += 0.1;
        } else if (p2RightSpeed > 4) p2RightSpeed -= 0.1;
      }

      p2X += p2RightSpeed;
    } else {
      if (p2RightSpeed > 0) {
        p2RightSpeed -= 0.1;
        p2X += p2RightSpeed;
      }
    }
  }

  void playerSpells() {
    if (key == 'f' && p1Flash == 0 && p1Timeout == 0 || key == 'F' && p1Flash == 0 && p1Timeout == 0) {
      if (p1UpSpeed > 0 && p1UpSpeed > p1DownSpeed) {
        if (p1Y - 117 > 17) {
          p1Y -= 117;
        } else {
          p1Y = 17;
        }
        p1Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      } else if (p1DownSpeed > 0 && p1DownSpeed > p1UpSpeed) {
        if (p1Y + 117 < height - 17) {
          p1Y += 117;
        } else {
          p1Y = height - 17;
        }
        p1Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      } 

      if (p1LeftSpeed > 0 && p1LeftSpeed > p1RightSpeed) {
        if (p1X - 117 > 17) {
          p1X -= 117;
        } else {
          p1X = 17;
        }
        p1Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      } else if (p1RightSpeed > 0 && p1RightSpeed > p1LeftSpeed) {
        if (p1X + 117 < width - 17) {
          p1X += 117;
        } else {
          p1X = width - 17;
        }
        p1Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      }

      if (p1UpSpeed > 0 || p1DownSpeed > 0 || p1LeftSpeed > 0 || p1RightSpeed > 0) {
        if (logging) {
          println("Player 1 used Flash. Their new coordinates are: " + round(p1X) + ", " + round(p1Y));
        }
      }
    }

    if (key == 'j' && p2Flash == 0 && p2Timeout == 0 && modeSelected != 1 || key == 'J' && p2Flash == 0 && p2Timeout == 0 && modeSelected != 1) {
      if (p2UpSpeed > 0 && p2UpSpeed > p2DownSpeed) {
        if (p2Y - 117 > 17) {
          p2Y -= 117;
        } else {
          p2Y = 17;
        }
        p2Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      } else if (p2DownSpeed > 0 && p2DownSpeed > p2UpSpeed) {
        if (p2Y + 117 < height - 17) {
          p2Y += 117;
        } else {
          p2Y = height - 17;
        }
        p2Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      }

      if (p2LeftSpeed > 0 && p2LeftSpeed > p2RightSpeed) {
        if (p2X - 117 > 17) {
          p2X -= 117;
        } else {
          p2X = 17;
        }
        p2Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      } else if (p2RightSpeed > 0 && p2RightSpeed > p2LeftSpeed) {
        if (p2X + 117 < width - 17) {
          p2X += 117;
        } else {
          p2X = width - 17;
        }
        p2Flash = 1800;

        if (playingSfx) {
          flash.rewind();
          flash.play();
        }
      }

      if (p2UpSpeed > 0 || p2DownSpeed > 0 || p2LeftSpeed > 0 || p2RightSpeed > 0) {
        if (logging) {
          println("Player 2 used Flash. Their new coordinates are: " + round(p2X) + ", " + round(p2Y));
        }
      }
    }

    if (key == 'z' && p1Timeout == 0 || key == 'Z' && p1Timeout == 0) {
      if (p1GhostC == 0) {
        p1GhostC = 1200;
        p1Ghost = 300;
        p1Ghosting = true;

        if (logging) {
          println("Player 1 used Ghost. Their top speed is now 8 pixels/frame.");
        }

        if (playingSfx) {
          ghost.rewind();
          ghost.play();
        }
      }
    }

    if (key == 'm' && modeSelected != 1 && p2Timeout == 0 || key == 'M' && modeSelected != 1 && p2Timeout == 0) {
      if (p2GhostC == 0) {
        p2GhostC = 1200;
        p2Ghost = 300;
        p2Ghosting = true;

        if (logging) {
          println("Player 2 used Ghost. Their top speed is now 8 pixels/frame.");
        }

        if (playingSfx) {
          ghost.rewind();
          ghost.play();
        }
      }
    }

    if (key == 'c' && p1Timeout == 0 || key == 'C' && p1Timeout == 0) {
      if (p1ShieldC == 0) {
        p1ShieldC = 1800;
        p1Shield = 90;
        p1Shielded = true;

        if (logging) {
          println("Player 1 used Shield.");
        }

        if (playingSfx) {
          barrier.rewind();
          barrier.play();
        }
      }
    }

    if (key == 'b' && modeSelected != 1 && p2Timeout == 0 || key == 'B' && modeSelected != 1 && p2Timeout == 0) {
      if (p2ShieldC == 0) {
        p2ShieldC = 1800;
        p2Shield = 90;
        p2Shielded = true;

        if (logging) {
          println("Player 2 used Shield.");
        }

        if (playingSfx) {
          barrier.rewind();
          barrier.play();
        }
      }
    }

    if (key == 'x' && p1Timeout == 0 && p2Timeout == 0 || key == 'X' && p1Timeout == 0 && p2Timeout == 0) {
      if (p1ExhaustC == 0) {
        p1ExhaustC = 1800;
        p1Exhaust = 240;
        p2Exhausted = true;

        if (logging) {
          println("Player 1 used Exhaust. Player 2's top speed is now 4 pixels/frame.");
        }

        if (playingSfx) {
          exhaust.rewind();
          exhaust.play();
        }
      }
    }

    if (key == 'n' && p2Timeout == 0 && p1Timeout == 0 && modeSelected != 1 || key == 'N' && p2Timeout == 0 && p1Timeout == 0 && modeSelected != 1) {
      if (p2ExhaustC == 0) {
        p2ExhaustC = 1800;
        p2Exhaust = 240;
        p1Exhausted = true;

        if (logging) {
          println("Player 2 used Exhaust. Player 1's top speed is now 4 pixels/frame.");
        }

        if (playingSfx) {
          exhaust.rewind();
          exhaust.play();
        }
      }
    }
  }

  void bounceOff() {
    if (p1X - 17 <= 0 && !f2Picked) {
      p1LeftSpeed = 0;

      p1RightSpeed = 3;
      if (p1RightSpeed > 0) {
        p1RightSpeed -= 0.1;
        p1X += p1DownSpeed;
      }
    } else if (p1X + 17 >= width) {
      p1RightSpeed = 0;

      p1LeftSpeed = 3;
      if (p1LeftSpeed > 0) {
        p1LeftSpeed -= 0.1;
        p1X -= p1LeftSpeed;
      }
    }

    if (p2X - 17 <= 0) {
      p2LeftSpeed = 0;

      p2RightSpeed = 3;
      if (p2RightSpeed > 0) {
        p2RightSpeed -= 0.1;
        p2X += p2DownSpeed;
      }
    } else if (p2X + 17 >= width && !f1Picked) {
      p2RightSpeed = 0;

      p2LeftSpeed = 3;
      if (p2LeftSpeed > 0) {
        p2LeftSpeed -= 0.1;
        p2X -= p2LeftSpeed;
      }
    }

    if (modeSelected != 2) {
      if (p1Y - 17 <= 0) {
        p1UpSpeed = 0;

        p1DownSpeed = 3;
        if (p1DownSpeed > 0) {
          p1DownSpeed -= 0.1;
          p1Y += p1DownSpeed;
        }
      } else if (p1Y + 17 >= height) {
        p1DownSpeed = 0;

        p1UpSpeed = 3;
        if (p1UpSpeed > 0) {
          p1UpSpeed -= 0.1;
          p1Y -= p1UpSpeed;
        }
      }

      if (p2Y - 17 <= 0) {
        p2UpSpeed = 0;

        p2DownSpeed = 3;
        if (p2DownSpeed > 0) {
          p2DownSpeed -= 0.1;
          p2Y += p2DownSpeed;
        }
      } else if (p2Y + 17 >= height) {
        p2DownSpeed = 0;

        p2UpSpeed = 3;
        if (p2UpSpeed > 0) {
          p2UpSpeed -= 0.1;
          p2Y -= p2UpSpeed;
        }
      }
    } else {
      if (p1Y + 17 <= 0) {
        p1Y = height + 17;
      } else if (p1Y - 17 >= height) {
        p1Y = -17;
      }

      if (p2Y + 17 <= 0) {
        p2Y = height + 17;
      } else if (p2Y - 17 >= height) {
        p2Y = -17;
      }
    }
  }

  void flag() {
    if (p1X + 17 >= f2X - 22 && p1X - 17 <= f2X && p1Y + 17 >= f2Y - 30 && p1Y - 17 <= f2Y + 30 && !f2Picked) {
      f2Picked = true;

      if (logging) {
        println("Player 1 grabbed player 2's flag.");
      }

      if (playingSfx) {
        flagCapture.rewind();
        flagCapture.play();
      }
    }

    if (p2X - 17 <= f1X + 22 && p2X + 17 >= f1X && p2Y + 17 >= f1Y - 30 && p2Y - 17 <= f1Y + 30 && !f1Picked) {
      f1Picked = true;

      if (logging) {
        println("Player 2 grabbed player 1's flag.");
      }

      if (playingSfx) {
        flagCapture.rewind();
        flagCapture.play();
      }
    }

    if (f2Picked) {
      f2X = p1X;
      f2Y = p1Y;
    } 

    if (f1Picked) {
      f1X = p2X;
      f1Y = p2Y;
    }

    if (p1X + 17 >= f1X - 40 && p1X - 17 <= f1X + 60 && p1Y + 17 >= f1Y - 50 && p1Y - 17 <= f1Y + 50 && !f1Picked && p1Timeout == 0) {
      if (f1Time < 240) {
        f1Time++;
      } else if (f1Time == 240) {
        p1X = 160;
        p1Y = height / 2;

        p1UpSpeed = 0;
        p1DownSpeed = 0;
        p1LeftSpeed = 0;
        p1RightSpeed = 0;
        p1Up = false;
        p1Down = false;
        p1Left = false;
        p1Right = false;
        p1Timeout = 180;
        f1Time = 0;

        if (f2Picked) {
          f2Picked = false;
          f2X = width - 40;
          f2Y = height / 2;
        }

        if (logging) {
          println("Player 1 has been reset for standing on their flag.");
        }

        if (playingSfx) {
          playerTag.rewind();
          playerTag.play();
        }
      }
    } else {
      f1Time = 0;
    }

    if (f1Time == 0) {
      f1Zone = color(57, 153, 18);
    } else if (f1Time > 0 && f1Time <= 150) {
      f1Zone = color(232, 188, 12);

      if (f1Time == 1 && playingSfx) {
        flagWarning.rewind();
        flagWarning.play();
      } else if (f1Time == 150 && playingSfx) {
        flagDanger.rewind();
        flagDanger.play();
      }
    } else if (f1Time > 150) {
      f1Zone = color(232, 48, 12);
    }

    if (p2X + 17 >= f2X - 60 && p2X - 17 <= f2X + 40 && p2Y + 17 >= f2Y - 50 && p2Y - 17 <= f2Y + 50 && !f2Picked && p2Timeout == 0) {
      if (f2Time < 240) {
        f2Time++;
      } else if (f2Time == 240) {
        p2X = width - 160;
        p2Y = height / 2;

        p2UpSpeed = 0;
        p2DownSpeed = 0;
        p2LeftSpeed = 0;
        p2RightSpeed = 0;
        p2Up = false;
        p2Down = false;
        p2Left = false;
        p2Right = false;
        p2Timeout = 180;
        f2Time = 0;

        if (f1Picked) {
          f1Picked = false;
          f1X = 40;
          f1Y = height / 2;
        }

        if (logging) {
          println("Player 2 has been reset for standing on their flag.");
        }

        if (playingSfx) {
          playerTag.rewind();
          playerTag.play();
        }
      }
    } else {
      f2Time = 0;
    }

    if (f2Time == 0) {
      f2Zone = color(57, 153, 18);
    } else if (f2Time > 0 && f2Time <= 150) {
      f2Zone = color(232, 188, 12);

      if (f2Time == 1 && playingSfx) {
        flagWarning.rewind();
        flagWarning.play();
      } else if (f2Time == 150 && playingSfx) {
        flagDanger.rewind();
        flagDanger.play();
      }
    } else if (f2Time > 150) {
      f2Zone = color(232, 48, 12);
    }
  }

  void tag() {
    if (p1X + 17 >= p2X - 17 && p1X - 17 <= p2X + 17 && p1Y + 17 >= p2Y - 17 && p1Y - 17 <= p2Y + 17 && p1Timeout == 0 && p2Timeout == 0) {
      f1Picked = false;
      f2Picked = false;

      if (!dropWhereKilled) {
        f1X = 40;
        f1Y = height / 2;
        f2X = width - 40;
        f2Y = height / 2;
      }

      if (p1X < width / 2 && p2X < width / 2) {
        if (!p2Shielded) {
          p2X = width - 160;
          p2Y = height / 2;
          p2Timeout = 180;
          p1Kills++;
          p2Deaths++;

          p2Up = false;
          p2Down = false;
          p2Left = false;
          p2Right = false;

          p2UpSpeed = 0;
          p2DownSpeed = 0;
          p2LeftSpeed = 0;
          p2RightSpeed = 0;

          p2Ghost = 0;
          p2Ghosting = false;
          p2Shield = 0;
          p2Shielded = false;

          if (logging) {
            println("Player 2 has been tagged and reset.");
          }
        } else {
          p2Shielded = false;
          p2Shield = 0;

          if (logging) {
            println("Player 2 has been tagged, but they were Shielded.");
          }
        }

        if (playingSfx) {
          playerTag.rewind();
          playerTag.play();
        }

        if (p1UpSpeed > 0 && p1UpSpeed > p1DownSpeed) {
          p1UpSpeed = 0; 

          p1DownSpeed = 3;
          if (p1DownSpeed > 0) {
            p1DownSpeed -= 0.1;
            p1Y += p1DownSpeed;
          }
        } else if (p1DownSpeed > 0 && p1DownSpeed > p1UpSpeed) {
          p1DownSpeed = 0;

          p1UpSpeed = 3;
          if (p1UpSpeed > 0) {
            p1UpSpeed -= 0.1;
            p1Y -= p1UpSpeed;
          }
        } 

        if (p1LeftSpeed > 0 && p1LeftSpeed > p1RightSpeed) {
          p1LeftSpeed = 0;

          p1RightSpeed = 3;
          if (p1RightSpeed > 0) {
            p1RightSpeed -= 0.1;
            p1X += p1RightSpeed;
          }
        } else if (p1RightSpeed > 0 && p1RightSpeed > p1LeftSpeed) {
          p1RightSpeed = 0;

          p1LeftSpeed = 3;
          if (p1LeftSpeed > 0) {
            p1LeftSpeed -= 0.1;
            p1X -= p1LeftSpeed;
          }
        }
      } else if (p1X > width / 2 && p2X > width / 2) {
        if (!p1Shielded) {
          p1X = 160;
          p1Y = height / 2;
          p1Timeout = 180;
          p2Kills++;
          p1Deaths++;

          p1Up = false;
          p1Down = false;
          p1Left = false;
          p1Right = false;

          p1UpSpeed = 0;
          p1DownSpeed = 0;
          p1LeftSpeed = 0;
          p1RightSpeed = 0;

          p1Ghost = 0;
          p1Ghosting = false;
          p1Shield = 0;
          p1Shielded = false;

          if (logging) {
            println("Player 1 has been tagged and reset.");
          }
        } else {
          p1Shielded = false;
          p1Shield = 0;

          if (logging) {
            println("Player 1 has been tagged, but they were Shielded.");
          }
        }

        if (playingSfx) {
          playerTag.rewind();
          playerTag.play();
        }

        if (p2UpSpeed > 0 && p2UpSpeed > p2DownSpeed) {
          p2UpSpeed = 0;

          p2DownSpeed = 3;
          if (p2DownSpeed > 0) {
            p2DownSpeed -= 0.1;
            p2Y += p2DownSpeed;
          }
        } else if (p2DownSpeed > 0 && p2DownSpeed > p1UpSpeed) {
          p2DownSpeed = 0;

          p2UpSpeed = 3;
          if (p2UpSpeed > 0) {
            p2UpSpeed -= 0.1;
            p2Y -= p2UpSpeed;
          }
        }

        if (p2LeftSpeed > 0 && p2LeftSpeed > p2RightSpeed) {
          p2LeftSpeed = 0;

          p2RightSpeed = 3;
          if (p2RightSpeed > 0) {
            p2RightSpeed -= 0.1;
            p2X += p2RightSpeed;
          }
        } else if (p2RightSpeed > 0 && p2RightSpeed > p2LeftSpeed) {
          p2RightSpeed = 0;

          p2LeftSpeed = 3;
          if (p2LeftSpeed > 0) {
            p2LeftSpeed -= 0.1;
            p2X -= p2LeftSpeed;
          }
        }
      } else if (p1X < width / 2 && p2X > width / 2 || p1X > width / 2 && p2X < width / 2) {
        if (p1UpSpeed > 0 && p1UpSpeed > p1DownSpeed) {
          p1UpSpeed = 0;

          p1DownSpeed = 3;
          if (p1DownSpeed > 0) {
            p1DownSpeed -= 0.1;
            p1Y += p1DownSpeed;
          }
        } else if (p1DownSpeed > 0 && p1DownSpeed > p1UpSpeed) {
          p1DownSpeed = 0;

          p1UpSpeed = 3;
          if (p1UpSpeed > 0) {
            p1UpSpeed -= 0.1;
            p1Y -= p1UpSpeed;
          }
        }

        if (p1LeftSpeed > 0 && p1LeftSpeed > p1RightSpeed) {
          p1LeftSpeed = 0;

          p1RightSpeed = 3;
          if (p1RightSpeed > 0) {
            p1RightSpeed -= 0.1;
            p1X += p1RightSpeed;
          }
        } else if (p1RightSpeed > 0 && p1RightSpeed > p1LeftSpeed) {
          p1RightSpeed = 0;

          p1LeftSpeed = 3;
          if (p1LeftSpeed > 0) {
            p1LeftSpeed -= 0.1;
            p1X -= p1LeftSpeed;
          }
        }

        if (p2UpSpeed > 0 && p2UpSpeed > p2DownSpeed) {
          p2UpSpeed = 0;

          p2DownSpeed = 3;
          if (p2DownSpeed > 0) {
            p2DownSpeed -= 0.1;
            p2Y += p2DownSpeed;
          }
        } else if (p2DownSpeed > 0 && p2DownSpeed > p2UpSpeed) {
          p2DownSpeed = 0;

          p2UpSpeed = 3;
          if (p2UpSpeed > 0) {
            p2UpSpeed -= 0.1;
            p2Y -= p2UpSpeed;
          }
        }

        if (p2LeftSpeed > 0 && p2LeftSpeed > p2RightSpeed) {
          p2LeftSpeed = 0;

          p2RightSpeed = 3;
          if (p2RightSpeed > 0) {
            p2RightSpeed -= 0.1;
            p2X += p2RightSpeed;
          }
        } else if (p2RightSpeed > 0 && p2RightSpeed > p2LeftSpeed) {
          p2RightSpeed = 0;

          p2LeftSpeed = 3;
          if (p2LeftSpeed > 0) {
            p2LeftSpeed -= 0.1;
            p2X -= p2LeftSpeed;
          }
        }
      }
    }
  }

  void update() {
    if (p1Timeout > 0 && !displayingMenu) p1Timeout--;
    if (p2Timeout > 0 && !displayingMenu) p2Timeout--;

    if (modeSelected == 0 && typeSelected == 0 || modeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
      if (!displayingMenu && gameTimeout == 0) gameCounter++;
      if (gameCounter >= 60) {
        gameCounter = 0;

        if (gameSecond == 59) {
          gameSecond = 0;
          gameMinute++;
        } else gameSecond++;

        if (gameSecond < 10) {
          gameSecondString = "0" + gameSecond;
        } else gameSecondString = "" + gameSecond;
      }
    } else if (modeSelected == 0 && typeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
      if (!displayingMenu && gameTimeout == 0) gameCounter++;
      if (gameCounter >= 60) {
        gameCounter = 0;
        gameTime--;

        if (gameSecond == 0) {
          gameSecond = 60;
          gameMinute--;
        }

        gameSecond--;

        if (gameSecond < 10) {
          gameSecondString = "0" + gameSecond;
        } else gameSecondString = "" + gameSecond;
      }

      if (gameTime > 60) {
        gameTimeColor = color(255, 255, 255);
      } else if (gameTime > 10 && gameTime <= 60) {
        gameTimeColor = color(247, 207, 5);
      } else if (gameTime <= 10) {
        gameTimeColor = color(204, 6, 6);
      }
    }

    if (gameTimeout > 0 && !displayingMenu) gameTimeout--;

    if (p1Flash > 0 && !displayingMenu) p1Flash--;
    if (p2Flash > 0 && !displayingMenu) p2Flash--;

    if (p1Ghost > 0 && p1Ghosting && !displayingMenu) p1Ghost--;
    if (p1Ghost == 0 && p1Ghosting) p1Ghosting = false;
    if (p1GhostC > 0 && !p1Ghosting && !displayingMenu) p1GhostC--;
    if (p2Ghost > 0 && p2Ghosting && !displayingMenu) p2Ghost--;
    if (p2Ghost == 0 && p2Ghosting) p2Ghosting = false;
    if (p2GhostC > 0 && !p2Ghosting && !displayingMenu) p2GhostC--;

    if (p1Shield > 0 && p1Shielded && !displayingMenu) p1Shield--;
    if (p1Shield == 0 && p1Shielded) p1Shielded = false;
    if (p1ShieldC > 0 && !p1Shielded && !displayingMenu) p1ShieldC--;
    if (p2Shield > 0 && p2Shielded && !displayingMenu) p2Shield--;
    if (p2Shield == 0 && p2Shielded) p2Shielded = false;
    if (p2ShieldC > 0 && !p2Shielded && !displayingMenu) p2ShieldC--;

    if (p1Exhaust > 0 && p2Exhausted && !displayingMenu) p1Exhaust--;
    if (p1Exhaust == 0 && p2Exhausted) p2Exhausted = false;
    if (p1ExhaustC > 0 && !p2Exhausted && !displayingMenu) p1ExhaustC--;
    if (p2Exhaust > 0 && p1Exhausted && !displayingMenu) p2Exhaust--;
    if (p2Exhaust == 0 && p1Exhausted) p1Exhausted = false;
    if (p2ExhaustC > 0 && !p1Exhausted && !displayingMenu) p2ExhaustC--;

    if (startTimeout < 180 && !displayingMenu && playingSfx && !countdown.isPlaying() && p1Score != 10 && p2Score != 10) {
      countdown.loop();
      countdown.play();
    } else if (displayingMenu) {
      countdown.pause();
    }

    if (startTimeout < 240 && !displayingMenu) {
      startTimeout++;
    }
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(64);
    if (startTimeout < 60) {
      text("3", width / 2, height / 2 + 10);
    } else if (startTimeout >= 60 && startTimeout < 120) {
      text("2", width / 2, height / 2 + 10);
    } else if (startTimeout >= 120 && startTimeout < 180) {
      text("1", width / 2, height / 2 + 10);
    } else if (startTimeout >= 180 && startTimeout < 240) {
      text("Capture!", width / 2, height / 2 + 10);
    }

    if (startTimeout < 180) {
      textSize(36);
      if (p1Scored || p2Scored) {
        if (p1Scored) {
          fill(255);
          if (p1Streak == 3) {
            text(p1Name + " is on a rampage!", width / 2, 140);
          } else if (p1Streak == 5) {
            text(p1Name + " is unstoppable!", width / 2, 140);
          } else if (p1Streak == 7) {
            text(p1Name + " is dominating!", width / 2, 140);
          } else if (p1Streak == 9) {
            text(p1Name + " is legendary!", width / 2, 140);
          } else {
            text(p1Name + " captured the flag!", width / 2, 140);
          }

          if (p2Shutdown && p1Score != 9 && p2Score != 9) {
            text(p2Name + " has been shut down!", width / 2, 200);
          }
        } else if (p2Scored) {
          fill(255);
          if (p2Streak == 3) {
            text(p2Name + " is on a rampage!", width / 2, 140);
          } else if (p2Streak == 5) {
            text(p2Name + " is unstoppable!", width / 2, 140);
          } else if (p2Streak == 7) {
            text(p2Name + " is dominating!", width / 2, 140);
          } else if (p2Streak == 9) {
            text(p2Name + " is legendary!", width / 2, 140);
          } else {
            text(p2Name + " captured the flag!", width / 2, 140);
          }

          if (p1Shutdown && p1Score != 9 && p2Score != 9) {
            text(p1Name + " has been shut down!", width / 2, 200);
          }
        }

        fill(255, 187, 0);
        stroke(0);
        strokeWeight(2);
        beginShape();
        vertex(width / 2 - 280, 110);
        vertex(width / 2 - 360, 110);
        vertex(width / 2 - 360, 120);
        vertex(width / 2 - 340, 120);
        vertex(width / 2 - 340, 130);
        vertex(width / 2 - 320, 130);
        vertex(width / 2 - 320, 140);
        vertex(width / 2 - 280, 140);
        vertex(width / 2 - 280, 110);
        endShape();
        beginShape();
        vertex(width / 2 + 280, 110);
        vertex(width / 2 + 360, 110);
        vertex(width / 2 + 360, 120);
        vertex(width / 2 + 340, 120);
        vertex(width / 2 + 340, 130);
        vertex(width / 2 + 320, 130);
        vertex(width / 2 + 320, 140);
        vertex(width / 2 + 280, 140);
        vertex(width / 2 + 280, 110);
        endShape();

        rectMode(CENTER);
        strokeWeight(1);
        if (!p1Shutdown && !p2Shutdown && p1Score != 9 && p2Score != 9) {
          rect(width / 2, 160, 480, 5, 10);
        } else if (p1Shutdown || p2Shutdown || p1Score == 9 || p2Score == 9) {
          rect(width / 2, 220, 480, 5, 10);
        }

        textSize(32);
        fill(255);
        noStroke();
        if (p1Score == 9 && p2Score != 9) {
          text("This is " + p1Name + "'s match point!", width / 2, 200);
        } else if (p2Score == 9 && p1Score != 9) {
          text("This is " + p2Name + "'s match point!", width / 2, 200);
        } else if (p1Score == 9 && p2Score == 9) {
          text("This is both players's match point!", width / 2, 200);
        }
      }
    } else if (startTimeout == 180) {
      p1Scored = false;
      p2Scored = false;
      p1Shutdown = false;
      p2Shutdown = false;
    }
  }

  void score() {
    if (p1X - 17 <= 0 && f2Picked) {
      p1Score++;
      p1Streak++;
      if (p2Streak >= 3) {
        p2Shutdown = true;
      }
      p2Streak = 0;
      resetPlayers();
      p1Scored = true;

      if (logging) {
        println("Player 1 captured the flag. The score is now " + p1Score + " - " + p2Score);
      }

      if (playingSfx) {
        flagScore.rewind();
        flagScore.play();

        if (p1Streak == 3 || p2Streak == 3) {
          rampage.rewind();
          rampage.play();
        } else if (p1Streak == 5 || p2Streak == 5) {
          unstoppable.rewind();
          unstoppable.play();
        } else if (p1Streak == 7 || p2Streak == 7) {
          dominating.rewind();
          dominating.play();
        } else if (p1Streak == 9 || p2Streak == 9) {
          legendary.rewind();
          legendary.play();
        } else if (p1Shutdown || p2Shutdown) {
          shutDown.rewind();
          shutDown.play();
        }
      }
    }
    if (p2X + 17 >= width && f1Picked) {
      p2Score++;
      p2Streak++;
      if (p1Streak >= 3) {
        p1Shutdown = true;
      }
      p1Streak = 0;
      resetPlayers();
      p2Scored = true;

      if (logging) {
        println("Player 2 captured the flag. The score is now " + p1Score + " - " + p2Score);
      }

      if (playingSfx) {
        flagScore.rewind();
        flagScore.play();

        if (p1Streak == 3 || p2Streak == 3) {
          rampage.rewind();
          rampage.play();
        } else if (p1Streak == 5 || p2Streak == 5) {
          unstoppable.rewind();
          unstoppable.play();
        } else if (p1Streak == 7 || p2Streak == 7) {
          dominating.rewind();
          dominating.play();
        } else if (p1Streak == 9 || p2Streak == 9) {
          legendary.rewind();
          legendary.play();
        } else if (p1Shutdown || p2Shutdown) {
          shutDown.rewind();
          shutDown.play();
        }
      }
    }

    if (modeSelected == 0 && typeSelected == 0 || modeSelected == 2 && typeSelected == 0 || modeSelected == 1) {
      if (p1Score == 10 || p2Score == 10) {
        inGame = false;
        gameFinished = true;

        flagR = 255;
        flagG = 0;
        flagB = 0;

        if (logging) {
          println("The game is now finished because a player reached 10 points.");
        }

        if (modeSelected == 1) {
          if (p1Score == 10 && playingSfx) {
            victory.rewind();
            victory.play();
          } else if (p2Score == 10 && playingSfx) {
            defeat.rewind();
            defeat.play();
          }
        }
      }
    } else if (modeSelected == 0 && typeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
      if (gameTime == 0) {
        inGame = false;
        gameFinished = true;

        flagR = 255;
        flagG = 0;
        flagB = 0;

        if (logging) {
          println("The game is now finished because the time is up.");
        }
      }
    }
  }

  void runAi() {
    if (botDifficulty == 0) {
      if (p1X < width / 2 && !f2Picked) {
        if (p2X > f1X && !f1Picked) {
          p2Right = false;
          p2Left = true;
        } else if (p2X < f1X && !f1Picked) {
          p2Left = false;
          p2Right = true;
        } else if (f1Picked) {
          p2Left = false;
          p2Right = true;
          if (p2Y - 17 < p1Y + 17) {
            p2Down = false;
            p2Up = true;
          } else if (p2Y + 17 > p1Y - 17) {
            p2Up = false;
            p2Down = true;
          }
        }

        if (p2Y < f1Y && !f1Picked) {
          p2Up = false;
          p2Down = true;
        } else if (p2Y > f1Y && !f1Picked) {
          p2Down = false;
          p2Up = true;
        }
      } else if (p1X > width / 2 && !f1Picked || p1X < width / 2 && f2Picked) {
        if (p2Y < p1Y) {
          p2Up = false;
          p2Down = true;
        } else if (p2Y > p1Y) {
          p2Down = false;
          p2Up = true;
        }

        if (p2X > p1X) {
          p2Right = false;
          p2Left = true;
        } else if (p2X < p1X) {
          p2Left = false;
          p2Right = true;
        }
      }
    } else if (botDifficulty == 1) {
      if (p1X < width / 2 && !f2Picked || p1X > width / 2 && p2X < width / 4 && !f2Picked) {
        if (p2X > f1X && !f1Picked || p2X < f1X && !f1Picked) {
          if (p2Y == p1Y) {
            if (!aiPicked) {
              randomAi = int(random(10));
              if (randomAi < 5) {
                p2Down = false;
                p2Up = true;
              } else if (randomAi >= 5) {
                p2Up = false;
                p2Down = true;
              }

              aiPicked = true;
            }
          } else if (p1Y > p2Y) {
            p2Down = false;
            p2Up = true;
          } else if (p1Y < p2Y) {
            p2Up = false;
            p2Down = true;
          }
        }

        if (p2X > f1X + 10 && !f1Picked) {
          p2Right = false;
          p2Left = true;
        } else if (p2X <= f1X + 10 && !f1Picked) {
          p2Left = false;
          p2Right = false;
          if (p2Y < f1Y) {
            p2Up = false;
            p2Down = true;
          } else if (p2Y > f1Y) {
            p2Down = false;
            p2Up = true;
          }
        } else if (f1Picked) {
          p2Left = false;
          p2Right = true;
          if (p2Y < p1Y) {
            p2Down = false;
            p2Up = true;
          } else if (p2Y > p1Y) {
            p2Up = false;
            p2Down = true;
          }
        }
      } else if (p1X > width / 2 && !f1Picked && p2X > width / 4 || p1X < width / 2 && f2Picked && !f1Picked) {
        if (p2Y < p1Y) {
          p2Up = false;
          p2Down = true;
        } else if (p2Y > p1Y) {
          p2Down = false;
          p2Up = true;
        }

        if (p2X > p1X) {
          p2Right = false;
          p2Left = true;
        } else if (p2X < p1X) {
          p2Left = false;
          p2Right = true;
        }
      }
    } else if (botDifficulty == 2) {
      if (p1X > width / 2 && !f2Picked && !f1Picked || f2Picked && !f1Picked) {
        if (!p1Up && !p1Down) {
          if (p2Y + 17 < p1Y - 17) {
            p2Up = false;
            p2Down = true;
          } else if (p2Y - 17 > p1Y + 17) {
            p2Down = false;
            p2Up = true;
          } else if (p2Y + 2 > p1Y - 2 || p2Y - 2 < p1Y + 2) {
            p2Up = false;
            p2Down = false;
          } else if (p2Y + 17 > p1Y - 17) {
            if (p2DownSpeed < 3) {
              p2Down = true;
            } else p2Down = false;
          } else if (p2Y - 17 < p1Y + 17) {
            if (p2UpSpeed < 3) {
              p2Up = true;
            } else p2Up = false;
          }
        } else if (p1Up || p1Down) {
          if (p2Y < p1Y) {
            p2Up = false;
            p2Down = true;
          } else if (p2Y > p1Y) {
            p2Down = false;
            p2Up = true;
          } else {
            p2Up = false;
            p2Down = false;
          }
        }

        if (p1X > p2X) {
          p2Left = false;
          p2Right = true;
        } else if (p1X < p2X) {
          p2Right = false;
          p2Left = true;
        }
      } else if (p1Timeout > 0 && !f1Picked || p2X < width / 2 && !f1Picked) {
        if (p2Y + 17 < f1Y - 30) {
          p2Up = false;
          p2Down = true;
        } else if (p2Y - 17 > f1Y + 30) {
          p2Down = false;
          p2Up = true;
        } else {
          p2Up = false;
          p2Down = false;
        }

        if (p2X - 17 > f1X + 22) {
          p2Right = false;
          p2Left = true;
        } else if (p2X + 17 < f1X) {
          p2Left = false;
          p2Right = true;
        }
      } else if (f1Picked) {
        p2Left = false;
        p2Right = true;

        if (p2Y < p1Y) {
          p2Down = false;
          p2Up = true;
        } else if (p2Y > p1Y) {
          p2Up = false;
          p2Down = true;
        }
      } else if (p1X < width / 2 && !f1Picked && !f2Picked) {
        if (p2X - 17 > width / 2 + 200) {
          p2Right = false;
          p2Left = true;
        } else {
          p2Left = false;
        }

        if (!p1Up && !p1Down) {
          if (p2Y + 17 < p1Y - 17) {
            p2Up = false;
            p2Down = true;
          } else if (p2Y - 17 > p1Y + 17) {
            p2Down = false;
            p2Up = true;
          } else if (p2Y + 2 > p1Y - 2 || p2Y - 2 < p1Y + 2) {
            p2Up = false;
            p2Down = false;
          } else if (p2Y + 17 > p1Y - 17) {
            if (p2DownSpeed < 3) {
              p2Down = true;
            } else p2Down = false;
          } else if (p2Y - 17 < p1Y + 17) {
            if (p2UpSpeed < 3) {
              p2Up = true;
            } else p2Up = false;
          }
        } else if (p1Up || p1Down) {
          if (p2Y < p1Y) {
            p2Up = false;
            p2Down = true;
          } else if (p2Y > p1Y) {
            p2Down = false;
            p2Up = true;
          } else {
            p2Up = false;
            p2Down = false;
          }
        }
      }
    }
  }

  void moveKeys() {
    if (p1Timeout == 0 && !displayingMenu) {
      if (key == 'w' || key == 'W') {
        p1Up = true;
      } 
      if (key == 's' || key == 'S') {
        p1Down = true;
      } 
      if (key == 'a' || key == 'A') {
        p1Left = true;
      } 
      if (key == 'd' || key == 'D') {
        p1Right = true;
      }
    } 

    if (p2Timeout == 0 && !displayingMenu && modeSelected != 1) {
      if (keyCode == UP) {
        p2Up = true;
      } 
      if (keyCode == DOWN) {
        p2Down = true;
      } 
      if (keyCode == LEFT) {
        p2Left = true;
      } 
      if (keyCode == RIGHT) {
        p2Right = true;
      }
    }
  }

  void exitLoad() {
    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      inGame = false;
      gameLoaded = false;
      selecting = true;

      if (playingSfx) {
        click.rewind();
        click.play();
      }

      if (playingMusic) {
        homeMusic.rewind();
        gameMusic.rewind();
      }
    }
  }
}

class Map {
  Map() {
    block1X = new float[4];
    block1Y = new float[4];
    block2X = new float[4];
    block2Y = new float[4];

    block1X[0] = random(40, 235);
    block1X[1] = random(315, 510);
    block1X[2] = random(590, 785);
    block1X[3] = random(865, 1060);
    block1Y[0] = random(40, 335);
    block1Y[1] = random(40, 335);
    block1Y[2] = random(40, 335);
    block1Y[3] = random(40, 335);

    block2X[0] = random(40, 235);
    block2X[1] = random(315, 510);
    block2X[2] = random(590, 785);
    block2X[3] = random(865, 1060);
    block2Y[0] = random(415, 710);
    block2Y[1] = random(415, 710);
    block2Y[2] = random(415, 710);
    block2Y[3] = random(415, 710);
  }

  void display() {
    if (modeSelected == 0 || modeSelected == 2) {
      fill(173, 93, 7);
      stroke(138, 73, 7);
      strokeWeight(2);
      rectMode(CENTER);
      for (int i = 0; i < 4; i++) {
        rect(block1X[i], block1Y[i], 40, 40, 10);
        rect(block2X[i], block2Y[i], 40, 40, 10);
      }
    }
  }

  void collide() {
    for (int i = 0; i < 4; i++) {
      if (p1X + 17 >= block1X[i] - 20 && p1X - 17 <= block1X[i] + 20 && p1Y + 17 >= block1Y[i] - 20 && p1Y - 17 <= block1Y[i] + 20 || p1X + 17 >= block2X[i] - 20 && p1X - 17 <= block2X[i] + 20 && p1Y + 17 >= block2Y[i] - 20 && p1Y - 17 <= block2Y[i] + 20) {
        if (p1UpSpeed > 0) p1UpSpeed *= 0.8;
        if (p1DownSpeed > 0) p1DownSpeed *= 0.8;
        if (p1LeftSpeed > 0) p1LeftSpeed *= 0.8;
        if (p1RightSpeed > 0) p1RightSpeed *= 0.8;
      }

      if (p2X + 17 >= block1X[i] - 20 && p2X - 17 <= block1X[i] + 20 && p2Y + 17 >= block1Y[i] - 20 && p2Y - 17 <= block1Y[i] + 20 || p2X + 17 >= block2X[i] - 20 && p2X - 17 <= block2X[i] + 20 && p2Y + 17 >= block2Y[i] - 20 && p2Y - 17 <= block2Y[i] + 20) {
        if (p2UpSpeed > 0) p2UpSpeed *= 0.8;
        if (p2DownSpeed > 0) p2DownSpeed *= 0.8;
        if (p2LeftSpeed > 0) p2LeftSpeed *= 0.8;
        if (p2RightSpeed > 0) p2RightSpeed *= 0.8;
      }
    }
  }
}

class PowerUp {
  PowerUp() {
    powerSpawned = false;
    powerCounter = 0;
    powerX = 0;
    powerY = 0;
    powerRandom = 0;
  }

  void spawn() {
    if (!powerSpawned) {
      if (powerCounter < 600 && gameTimeout == 0 && !displayingMenu) {
        powerCounter++;
      } else if (powerCounter == 600) {
        powerSpawned = true;
        powerX = random(88, width - 88);
        powerY = random(88, height - 88);
        powerRandom = int(random(100));

        if (logging) {
          println("A powerup spawned at: " + powerX + ", " + powerY + ", with the random number " + powerRandom);
        }

        if (playingSfx) {
          powerSpawn.rewind();
          powerSpawn.play();
        }
      }
    }
  }

  void display() {
    if (powerSpawned) {
      fill(250, 209, 7);
      stroke(201, 93, 10);
      strokeWeight(2);
      rectMode(CENTER);
      rect(powerX, powerY, 44, 44, 10);

      fill(255);
      textSize(30);
      noStroke();
      textAlign(CENTER);
      text("?", powerX, powerY + 10);
    }
  }

  void collide() {
    if (p1X + 17 >= powerX - 22 && p1X - 17 <= powerX + 22 && p1Y + 17 >= powerY - 22 && p1Y - 17 <= powerY + 22 && powerSpawned || p2X - 17 <= powerX + 22 && p2X + 17 >= powerX - 22 && p2Y + 17 >= powerY - 22 && p2Y - 17 <= powerY + 22 && powerSpawned) {
      if (p1X + 17 >= powerX - 22 && p1X - 17 <= powerX + 22 && p1Y + 17 >= powerY - 22 && p1Y - 17 <= powerY + 22) { 
        if (powerRandom <= 79 && p1Flash > 0 || powerRandom <= 79 && !p1Ghosting && p1GhostC > 0 || powerRandom <= 79 && !p2Exhausted && p1ExhaustC > 0 || powerRandom <= 79 && !p1Shielded && p1ShieldC > 0) {
          if (p1Flash - 300 > 0) {
            p1Flash -= 300;
          } else p1Flash = 0;

          if (!p1Ghosting && p1GhostC - 240 > 0) {
            p1GhostC -= 240;
          } else if (!p1Ghosting && p1GhostC - 240 <= 0) p1GhostC = 0;

          if (!p2Exhausted && p1ExhaustC - 300 > 0) {
            p1ExhaustC -= 300;
          } else if (!p2Exhausted && p1ExhaustC - 300 <= 0) p1ExhaustC = 0;

          if (!p1Shielded && p1ShieldC - 300 > 0) {
            p1ShieldC -= 300;
          } else if (!p1Shielded && p1ShieldC - 300 <= 0) p1ShieldC = 0;

          if (logging) {
            println("Player 1 has picked up a powerup and got a cooldown reduction.");
          }
        } else if (powerRandom > 79 || p1Flash == 0 && p1GhostC == 0 && p1ShieldC == 0 && p1ExhaustC == 0) {
          p2Timeout += 90;

          p2Up = false;
          p2Down = false;
          p2Left = false;
          p2Right = false;

          p2UpSpeed = 0;
          p2DownSpeed = 0;
          p2LeftSpeed = 0;
          p2RightSpeed = 0;

          p2Ghost = 0;
          p2Ghosting = false;
          p2Shield = 0;
          p2Shielded = false;

          if (logging) {
            println("Player 1 has picked up a powerup and disabled player 2 temporarily.");
          }
        }
      } else if (p2X - 17 <= powerX + 22 && p2X + 17 >= powerX - 22 && p2Y + 17 >= powerY - 22 && p2Y - 17 <= powerY + 22 && powerSpawned) {
        if (powerRandom <= 79 && p2Flash > 0 || powerRandom <= 79 && !p2Ghosting && p2GhostC > 0 || powerRandom <= 79 && !p1Exhausted && p2ExhaustC > 0 || powerRandom <= 79 && !p2Shielded && p2ShieldC > 0) {
          if (p2Flash - 300 > 0) {
            p2Flash -= 300;
          } else p2Flash = 0;

          if (!p2Ghosting && p2GhostC - 240 > 0) {
            p2GhostC -= 240;
          } else if (!p2Ghosting && p2GhostC - 240 <= 0) p2GhostC = 0;

          if (!p1Exhausted && p2ExhaustC - 300 > 0) {
            p2ExhaustC -= 300;
          } else if (!p1Exhausted && p2ExhaustC - 300 <= 0) p2ExhaustC = 0;

          if (!p2Shielded && p2ShieldC - 300 > 0) {
            p2ShieldC -= 300;
          } else if (!p2Shielded && p2ShieldC - 300 <= 0) p2ShieldC = 0;

          if (logging) {
            println("Player 2 has picked up a powerup and got a cooldown reduction.");
          }
        } else if (powerRandom > 79 || p2Flash == 0 && p2GhostC == 0 && p2ShieldC == 0 && p2ExhaustC == 0) {
          p1Timeout += 90;

          p1Up = false;
          p1Down = false;
          p1Left = false;
          p1Right = false;

          p1UpSpeed = 0;
          p1DownSpeed = 0;
          p1LeftSpeed = 0;
          p1RightSpeed = 0;

          p1Ghost = 0;
          p1Ghosting = false;
          p1Shield = 0;
          p1Shielded = false;

          if (logging) {
            println("Player 2 has picked up a powerup and disabled player 1 temporarily.");
          }
        }
      }

      if (playingSfx) {
        powerSpawn.rewind();
        powerSpawn.play();
      }

      powerSpawned = false;
      powerCounter = 0;
    }
  }
}

class Menu {
  Menu() {
    displayingMenu = false;
    playingMusic = true;
    playingSfx = true;
  }

  void display() {
    fill(160);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width - 40, 40, 40, 40, 10);
    noStroke();
    fill(0);
    rect(width - 40, 30, 30, 4, 100);
    rect(width - 40, 40, 30, 4, 100);
    rect(width - 40, 50, 30, 4, 100);

    if (displayingMenu) {
      fill(0, 0, 0, 200);
      rect(width / 2, height / 2, width, height);
      fill(0);
      stroke(255);
      strokeWeight(2);
      rect(width / 2, height / 2, 910, 650, 10);

      noStroke();

      fill(255);
      textAlign(CENTER);
      textSize(46);
      text("Menu", width / 2, 150);
      image(exitIcon, width / 2 + 420, height / 2 - 290);
      textSize(30);
      if (playingMusic) {
        text("Music      On", width / 2, 240);
      } else {
        text("Music      Off", width / 2, 240);
      }
      if (playingSfx) {
        text("SFX      On", width / 2, 300);
      } else {
        text("SFX      Off", width / 2, 300);
      }
      text("Return to homepage", width / 2, 400);
      text("Exit game", width / 2, 460);
      text("Restart", width / 2, 520);
      textSize(24);
      if (modeSelected == 0 || modeSelected == 2) {
        text("Change map", width / 2, 620);
      }

      stroke(255);
      strokeWeight(2);
      noFill();
      rectMode(CENTER);
      rect(width / 2 + 420, height / 2 - 290, 40, 40, 10); // Menu exit button border
      rect(width / 2 + 70, 230, 60, 40, 10); // Music toggle button
      rect(width / 2 + 55, 290, 60, 40, 10); // SFX toggle button
      rect(width / 2, 390, 320, 40, 10); // Return to homepage button
      rect(width / 2, 450, 180, 40, 10); // Exit game button
      rect(width / 2, 510, 160, 40, 10); // Restart button
      if (modeSelected == 0 || modeSelected == 2) {
        rect(width / 2, 614, 200, 40, 10); // Change map button
      }

      noStroke();
    }
  }

  void hover() {
    fill(0, 0, 0, 100);
    stroke(0, 0, 0, 100);
    strokeWeight(2);
    rectMode(CENTER);

    if (mouseX >= width - 60 && mouseX <= width - 20 && mouseY >= 20 && mouseY <= 60 && !displayingMenu) {
      rect(width - 40, 40, 40, 40, 10); // Menu in-game button
    } else if (mouseX >= width / 2 + 400 && mouseX <= width / 2 + 440 && mouseY >= height / 2 - 310 && mouseY <= height / 2 - 270 && displayingMenu) {
      rect(width / 2 + 420, height / 2 - 290, 40, 40, 10); // Exit menu button
    } else if (mouseX >= width / 2 + 40 && mouseX <= width / 2 + 100 && mouseY >= 210 && mouseY <= 250 && displayingMenu) {
      rect(width / 2 + 70, 230, 60, 40, 10); // Music toggle button
    } else if (mouseX >= width / 2 + 25 && mouseX <= width / 2 + 85 && mouseY >= 270 && mouseY <= 310 && displayingMenu) {
      rect(width / 2 + 55, 290, 60, 40, 10); // SFX toggle button
    } else if (mouseX >= width / 2 - 160 && mouseX <= width / 2 + 160 && mouseY >= 370 && mouseY <= 410 && displayingMenu) {
      rect(width / 2, 390, 320, 40, 10); // Return to homepage button
    } else if (mouseX >= width / 2 - 90 && mouseX <= width / 2 + 90 && mouseY >= 430 && mouseY <= 470 && displayingMenu) {
      rect(width / 2, 450, 180, 40, 10); // Exit game button
    } else if (mouseX >= width / 2 - 80 && mouseX <= width / 2 + 80 && mouseY >= 490 && mouseY <= 530 && displayingMenu) {
      rect(width / 2, 510, 160, 40, 10); // Restart button
    } else if (mouseX >= width / 2 - 100 && mouseX <= width / 2 + 100 && mouseY >= 614 - 20 && mouseY <= 614 + 20 && displayingMenu && modeSelected == 0 || mouseX >= width / 2 - 100 && mouseX <= width / 2 + 100 && mouseY >= 614 - 20 && mouseY <= 614 + 20 && displayingMenu && modeSelected == 2) {
      rect(width / 2, 614, 200, 40, 10);
    }

    noStroke();
  }

  void click() {
    if (mouseX >= width - 60 && mouseX <= width - 20 && mouseY >= 20 && mouseY <= 60 && !displayingMenu) {
      displayingMenu = true;

      p1UpSto = p1UpSpeed;
      p1DownSto = p1DownSpeed;
      p1LeftSto = p1LeftSpeed;
      p1RightSto = p1RightSpeed;
      p2UpSto = p2UpSpeed;
      p2DownSto = p2DownSpeed;
      p2LeftSto = p2LeftSpeed;
      p2RightSto = p2RightSpeed;

      p1Up = false;
      p1Down = false;
      p1Left = false;
      p2Right = false;
      p2Up = false;
      p2Down = false;
      p2Left = false;
      p2Right = false;

      p1UpSpeed = 0;
      p1DownSpeed = 0;
      p1LeftSpeed = 0;
      p1RightSpeed = 0;
      p2UpSpeed = 0;
      p2DownSpeed = 0;
      p2LeftSpeed = 0;
      p2RightSpeed = 0;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (displayingMenu) {
      if (mouseX <= 95 || mouseX >= width - 95 || mouseX >= 95 && mouseX <= width - 95 && mouseY <= 50 || mouseX >= 95 && mouseX <= width - 95 && mouseY >= height - 50) {
        displayingMenu = false;

        p1UpSpeed = p1UpSto;
        p1DownSpeed = p1DownSto;
        p1LeftSpeed = p1LeftSto;
        p1RightSpeed = p1RightSto;
        p2UpSpeed = p2UpSto;
        p2DownSpeed = p2DownSto;
        p2LeftSpeed = p2LeftSto;
        p2RightSpeed = p2RightSto;

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width / 2 + 400 && mouseX <= width / 2 + 440 && mouseY >= height / 2 - 310 && mouseY <= height / 2 - 270) {
        displayingMenu = false;

        p1UpSpeed = p1UpSto;
        p1DownSpeed = p1DownSto;
        p1LeftSpeed = p1LeftSto;
        p1RightSpeed = p1RightSto;
        p2UpSpeed = p2UpSto;
        p2DownSpeed = p2DownSto;
        p2LeftSpeed = p2LeftSto;
        p2RightSpeed = p2RightSto;

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width / 2 - 90 && mouseX <= width / 2 + 90 && mouseY >= 430 && mouseY <= 470) {
        quitting = true;

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width / 2 - 160 && mouseX <= width / 2 + 160 && mouseY >= 370 && mouseY <= 410) {
        inGame = false;
        atHome = true;
        displayingMenu = false;
        progress = 0.0;
        progressAmount = 0.0;
        gameLoaded = false;
        resetPlayers();
        p1Scored = false;
        p2Scored = false;
        p1Score = 0;
        p2Score = 0;
        p1Flash = 0;
        p2Flash = 0;
        p1Ghost = 0;
        p1Ghosting = false;
        p1GhostC = 0;
        p2Ghost = 0;
        p2Ghosting = false;
        p2GhostC = 0;
        p1Shield = 0;
        p1Shielded = false;
        p1ShieldC = 0;
        p2Shield = 0;
        p2Shielded = false;
        p2ShieldC = 0;
        p1Exhaust = 240;
        p2Exhaust = 240;
        p1ExhaustC = 0;
        p2ExhaustC = 0;
        p1Exhausted = false;
        p2Exhausted = false;
        p1Kills = 0;
        p1Deaths = 0;
        p2Kills = 0;
        p2Deaths = 0;
        gameCounter = 0;
        topText = 0;
        topTextTime = 0;
        gameCounter = 0;
        gameSecond = 0;
        gameMinute = 0;
        gameSecondString = "00";
        gameTime = 180;
        gameTimeColor = color(255, 255, 255);
        p1Streak = 0;
        p2Streak = 0;
        p1Shutdown = false;
        p2Shutdown = false;
        block1X[0] = random(40, 235);
        block1X[1] = random(315, 510);
        block1X[2] = random(590, 785);
        block1X[3] = random(865, 1060);
        block1Y[0] = random(40, 335);
        block1Y[1] = random(40, 335);
        block1Y[2] = random(40, 335);
        block1Y[3] = random(40, 335);
        block2X[0] = random(40, 235);
        block2X[1] = random(315, 510);
        block2X[2] = random(590, 785);
        block2X[3] = random(865, 1060);
        block2Y[0] = random(415, 710);
        block2Y[1] = random(415, 710);
        block2Y[2] = random(415, 710);
        block2Y[3] = random(415, 710);
        flagR = 255;
        flagG = 0;
        flagB = 0;

        if (logging) {
          println("The players have returned to the homepage.");
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }

        if (playingMusic) {
          homeMusic.rewind();
          gameMusic.rewind();
        }
      } else if (mouseX >= width / 2 + 40 && mouseX <= width / 2 + 100 && mouseY >= 210 && mouseY <= 250) {
        if (playingMusic) {
          playingMusic = false;
        } else {
          playingMusic = true;
          homeMusic.rewind();
          gameMusic.rewind();
        }

        if (logging) {
          println("Playing music has been set to " + playingMusic);
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width / 2 + 25 && mouseX <= width / 2 + 85 && mouseY >= 270 && mouseY <= 310) {
        if (playingSfx) {
          playingSfx = false;
        } else {
          playingSfx = true;
        }

        if (logging) {
          println("Playing SFX has been set to " + playingSfx);
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width / 2 - 80 && mouseX <= width / 2 + 80 && mouseY >= 490 && mouseY <= 530 && displayingMenu) {
        displayingMenu = false;
        gameLoaded = false;
        progress = 0.0;
        progressAmount = 0.0;
        resetPlayers();
        p1Scored = false;
        p2Scored = false;
        p1Score = 0;
        p2Score = 0;
        p1Flash = 0;
        p2Flash = 0;
        p1Ghost = 0;
        p1Ghosting = false;
        p1GhostC = 0;
        p2Ghost = 0;
        p2Ghosting = false;
        p2GhostC = 0; 
        p1Shield = 0;
        p1Shielded = false;
        p1ShieldC = 0;
        p2Shield = 0;
        p2Shielded = false;
        p2ShieldC = 0;
        p1Exhaust = 240;
        p2Exhaust = 240;
        p1ExhaustC = 0;
        p2ExhaustC = 0;
        p1Exhausted = false;
        p2Exhausted = false;
        p1Kills = 0;
        p1Deaths = 0;
        p2Kills = 0;
        p2Deaths = 0;
        gameCounter = 0;
        gameSecond = 0;
        if (modeSelected == 0 && typeSelected == 0 || modeSelected == 1 || modeSelected == 2 && typeSelected == 0) {
          gameMinute = 0;
        } else if (modeSelected == 0 && typeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
          gameMinute = 3;
        }
        gameSecondString = "00";
        gameTime = 180;
        gameTimeColor = color(255, 255, 255);
        p1Streak = 0;
        p2Streak = 0;
        p1Shutdown = false;
        p2Shutdown = false;
        block1X[0] = random(40, 235);
        block1X[1] = random(315, 510);
        block1X[2] = random(590, 785);
        block1X[3] = random(865, 1060);
        block1Y[0] = random(40, 335);
        block1Y[1] = random(40, 335);
        block1Y[2] = random(40, 335);
        block1Y[3] = random(40, 335);
        block2X[0] = random(40, 235);
        block2X[1] = random(315, 510);
        block2X[2] = random(590, 785);
        block2X[3] = random(865, 1060);
        block2Y[0] = random(415, 710);
        block2Y[1] = random(415, 710);
        block2Y[2] = random(415, 710);
        block2Y[3] = random(415, 710);

        if (logging) {
          println("The game has been restarted.");
        }

        if (playingSfx) {
          click.rewind();
          click.play();
          gameStart.rewind();
          gameStart.play();
        }

        if (playingMusic) {
          homeMusic.rewind();
          gameMusic.rewind();
        }
      } else if (mouseX >= width / 2 - 100 && mouseX <= width / 2 + 100 && mouseY >= 614 - 20 && mouseY <= 614 + 20 && displayingMenu && modeSelected == 0 || mouseX >= width / 2 - 100 && mouseX <= width / 2 + 100 && mouseY >= 614 - 20 && mouseY <= 614 + 20 && displayingMenu && modeSelected == 2) {
        block1X[0] = random(40, 235);
        block1X[1] = random(315, 510);
        block1X[2] = random(590, 785);
        block1X[3] = random(865, 1060);
        block1Y[0] = random(40, 335);
        block1Y[1] = random(40, 335);
        block1Y[2] = random(40, 335);
        block1Y[3] = random(40, 335);
        block2X[0] = random(40, 235);
        block2X[1] = random(315, 510);
        block2X[2] = random(590, 785);
        block2X[3] = random(865, 1060);
        block2Y[0] = random(415, 710);
        block2Y[1] = random(415, 710);
        block2Y[2] = random(415, 710);
        block2Y[3] = random(415, 710);

        if (logging) {
          println("The map has been regenerated.");
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    }
  }
}

void resetPlayers() {
  p1X = 160;
  p1Y = height / 2;
  p2X = width - 160;
  p2Y = height / 2;
  f1Picked = false;
  f2Picked = false;
  f1X = 40;
  f1Y = height / 2;
  f2X = width - 40;
  f2Y = height / 2;
  p1Timeout = 180;
  p2Timeout = 180;
  p1Up = false;
  p1Down = false;
  p1Left = false;
  p1Right = false;
  p2Up = false;
  p2Down = false;
  p2Left = false;
  p2Right = false;
  p1UpSpeed = 0;
  p1DownSpeed = 0;
  p1LeftSpeed = 0;
  p1RightSpeed = 0;
  p2UpSpeed = 0;
  p2DownSpeed = 0;
  p2LeftSpeed = 0;
  p2RightSpeed = 0;
  f1Time = 0;
  f2Time = 0;
  gameTimeout = 180;
  startTimeout = 0;
  aiPicked = false;
  if (p1Ghosting) {
    p1Ghosting = false;
    p1Ghost = 0;
  }
  if (p2Ghosting) {
    p2Ghosting = false;
    p2Ghost = 0;
  }
  if (p1Shielded) {
    p1Shielded = false;
    p1Shield = 0;
  }
  if (p2Shielded) {
    p2Shielded = false;
    p2Shield = 0;
  }
  if (p1Exhausted) {
    p1Exhausted = false;
    p2Exhaust = 0;
  }
  if (p2Exhausted) {
    p2Exhausted = false;
    p1Exhaust = 0;
  }
}
