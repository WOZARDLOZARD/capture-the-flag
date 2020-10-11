class GameOver {
  GameOver() {
    gameFinished = false;
  }

  void display() {
    fill(255);
    noStroke();
    textAlign(CENTER);
    textSize(50);
    text("Game Over", width / 2, 70);

    textSize(40);
    fill(p1Colors[p1Color][0], p1Colors[p1Color][1], p1Colors[p1Color][2]);
    text(p1Score, width / 2 - 100, 160);
    fill(255);
    text("VS", width / 2, 160);
    fill(p2Colors[p2Color][0], p2Colors[p2Color][1], p2Colors[p2Color][2]);
    text(p2Score, width / 2 + 100, 160);

    if (modeSelected == 0 && typeSelected == 0 || modeSelected == 2 && typeSelected == 0 || modeSelected == 1) {
      stroke(245, 180, 39);
      noFill();
      rectMode(CENTER);
      if (p1Score == 10) {
        rect(width / 2 - 100, 150, 55, 55, 10); // Victory borders (P1)
      } else if (p2Score == 10) {
        rect(width / 2 + 100, 150, 55, 55, 10); // Victory borders (P2)
      }

      fill(255);
      noStroke();
      if (modeSelected != 1) {
        if (p1Score == 10) {
          textSize(40);
          text(p1Name + " wins!", width / 2, 240);

          textSize(28);
          if (p2Score == 0) text("Flawless victory!", width / 2, 290);
        } else if (p2Score == 10) {
          textSize(40);
          text(p2Name + " wins!", width / 2, 240);

          textSize(28);
          if (p1Score == 0) text("Flawless victory!", width / 2, 290);
        }
      } else {
        if (p1Score == 10 && p2Score == 0) {
          textSize(40);
          text("Flawless victory!", width / 2, 240);

          textSize(28);
          if (botDifficulty == 0) {
            text("You have flawlessly crushed the Easy AI! Now try Normal!", width / 2, 290);
          } else if (botDifficulty == 1) {
            text("You have flawless crushed the Normal AI! Now try Hard!", width / 2, 290);
          } else if (botDifficulty == 2) {
            text("You have flawlessly crushed the Hard AI and conquered AI mode!", width / 2, 290);
          }
        } else if (p1Score == 10 && p2Score != 0) {
          textSize(40);
          text("Victory!", width / 2, 240);

          textSize(28);
          if (botDifficulty == 0) {
            text("You have defeated the Easy AI! Now try Normal!", width / 2, 290);
          } else if (botDifficulty == 1) {
            text("You have defeated the Normal AI! Now try Hard!", width / 2, 290);
          } else if (botDifficulty == 2) {
            text("You have defeated the Hard AI and conquered AI mode!", width / 2, 290);
          }
        } else if (p2Score == 10) {
          textSize(40);
          text("Defeat...", width / 2, 240);

          textSize(28);
          text("Better luck next time!", width / 2, 290);
        }
      }

      textSize(22);
      text("Time taken: " + gameMinute + ":" + gameSecondString, width / 2, 340);
    } else if (modeSelected == 0 && typeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
      stroke(245, 180, 39);
      noFill();
      rectMode(CENTER);
      if (p1Score > p2Score) {
        rect(width / 2 - 100, 150, 55, 55, 10); // Victory borders (P1)
      } else if (p2Score > p1Score) {
        rect(width / 2 + 100, 150, 55, 55, 10); // Victory borders (P2)
      }

      fill(255);
      noStroke();
      if (p1Score > p2Score) {
        textSize(40);
        text(p1Name + " wins!", width / 2, 240);

        textSize(30);
        if (p2Score == 0) text("Flawless victory!", width / 2, 290);
      } else if (p2Score > p1Score) {
        textSize(40);
        text(p2Name + " wins!", width / 2, 240);

        textSize(30);
        if (p1Score == 0) text("Flawless victory!", width / 2, 290);
      } else if (p1Score == p2Score) {
        textSize(40);
        text("Draw!", width / 2, 240);

        textSize(30);
        text("Better luck next time!", width / 2, 290);
      }
    }

    fill(255);
    textSize(32);
    text("Return to homepage", width / 2, 420);
    text("Exit game", width / 2, 480);
    text("Play again", width / 2, 540);

    image(exitIcon, 40, 40);

    stroke(255);
    strokeWeight(2);
    noFill();
    rectMode(CENTER);
    rect(width / 2, 410, 340, 40, 10); // Return to homepage button
    rect(width / 2, 470, 200, 40, 10); // Exit game button
    rect(width / 2, 530, 220, 40, 10); // Play again button
    rect(40, 40, 40, 40, 10); // X button in corner

    if (flagR == 255 && flagG >= 0 && flagG < 255 && flagB == 0) {
      flagG++;
    } else if (flagR > 0 && flagR <= 255 && flagG == 255 && flagB == 0) {
      flagR--;
    } else if (flagR == 0 && flagG == 255 && flagB >= 0 && flagB < 255) {
      flagB++;
    } else if (flagR == 0 && flagG > 0 && flagG <= 255 && flagB == 255) {
      flagG--;
    } else if (flagR >= 0 && flagR < 255 && flagG == 0 && flagB == 255) {
      flagR++;
    } else if (flagR == 255 && flagG == 0 && flagB <= 255 && flagB > 0) {
      flagB--;
    } 

    noStroke();
    fill(flagR, flagG, flagB);
    rect(30, height - 30, 60, 60); // Decorations
    rect(15, height - 60 - 15, 30, 30);
    rect(7.5, height - 90 - 7.5, 15, 15);
    rect(60 + 15, height - 15, 30, 30);
    rect(90 + 7.5, height - 7.5, 15, 15);
    rect(width - 30, height - 30, 60, 60);
    rect(width - 15, height - 60 - 15, 30, 30);
    rect(width - 7.5, height - 90 - 7.5, 15, 15);
    rect(width - 60 - 15, height - 15, 30, 30);
    rect(width - 90 - 7.5, height - 7.5, 15, 15);
    rect(width / 2, height - 20, 240, 40);
    rect(width / 2 - 120 - 10, height - 10, 20, 20);
    rect(width / 2 + 120 + 10, height - 10, 20, 20);
  }

  void hover() {
    fill(0, 0, 0, 100);
    stroke(0, 0, 0, 100);
    strokeWeight(2);
    rectMode(CENTER);

    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      rect(40, 40, 40, 40, 10);
    } else if (mouseX >= width / 2 - 170 && mouseX <= width / 2 + 170 && mouseY >= 390 && mouseY <= 430) {
      rect(width / 2, 410, 340, 40, 10);
    } else if (mouseX >= width / 2 - 100 && mouseX <= width / 2 + 100 && mouseY >= 450 && mouseY <= 490) {
      rect(width / 2, 470, 200, 40, 10);
    } else if (mouseX >= width / 2 - 110 && mouseX <= width / 2 + 110 && mouseY >= 510 && mouseY <= 550) {
      rect(width / 2, 530, 220, 40, 10);
    }
  }

  void click() {
    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60 || mouseX >= width / 2 - 100 && mouseX <= width / 2 + 100 && mouseY >= 450 && mouseY <= 490) {
      quitting = true;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 - 170 && mouseX <= width / 2 + 170 && mouseY >= 390 && mouseY <= 430) {
      gameFinished = false;
      atHome = true;
      progress = 0.0;
      progressAmount = 0.0;
      gameLoaded = false;
      resetPlayers();
      p1Score = 0;
      p2Score = 0;
      p1Scored = false;
      p2Scored = false;
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
      gameTime = 180;
      gameCounter = 0;
      flagR = 255;
      flagG = 0;
      flagB = 0;
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
    } else if (mouseX >= width / 2 - 110 && mouseX <= width / 2 + 110 && mouseY >= 510 && mouseY <= 550) {
      gameFinished = false;
      gameLoaded = false;
      progress = 0.0;
      progress = 0.0;
      progressAmount = 0.0;
      inGame = true;
      resetPlayers();
      p1Score = 0;
      p2Score = 0;
      p1Scored = false;
      p2Scored = false;
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
      gameTime = 180;
      gameCounter = 0;
      flagR = 255;
      flagG = 0;
      flagB = 0;
      topText = 0; 
      topTextTime = 0;
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
    }
  }
}
