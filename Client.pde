boolean quitting;
boolean resetting;
String password, passwordHidden;
color passwordColor;

class Client {
  Client() {
    quitting = false;
    resetting = false;
    password = "";
    passwordHidden = "";
    passwordColor = color(255);
  }

  void quitWindow() {
    rectMode(CENTER);
    noStroke();
    fill(0, 0, 0, 200);
    rect(width / 2, height / 2, width, height);

    fill(0);
    stroke(255);
    strokeWeight(2);
    rect(width / 2, height / 2, 400, 200, 10);

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width / 2 - 60, height / 2 + 40, 60, 30, 4);
    rect(width / 2 + 60, height / 2 + 40, 60, 30, 4);

    noStroke();
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("Confirmation", width / 2, height / 2 - 50);
    textSize(20);
    text("Are you sure you want to leave?", width / 2, height / 2 - 10);
    textSize(24);
    text("Yes", width / 2 - 60, height / 2 + 50);
    text("No", width / 2 + 60, height / 2 + 50);

    fill(0, 0, 0, 100);
    rectMode(CENTER);
    stroke(0, 0, 0, 100);
    strokeWeight(2);
    if (mouseX >= width / 2 - 90 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      rect(width / 2 - 60, height / 2 + 40, 60, 30, 4);
    } else if (mouseX >= width / 2 + 30 && mouseX <= width / 2 + 90 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      rect(width / 2 + 60, height / 2 + 40, 60, 30, 4);
    }

    noStroke();
  }

  void confirmQuit() {
    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      quitting = true;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 - 90 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      exit();
    } else if (mouseX >= width / 2 + 30 && mouseX <= width / 2 + 90 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      quitting = false;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void resetWindow() {
    rectMode(CENTER);
    noStroke();
    fill(0, 0, 0, 200);
    rect(width / 2, height / 2, width, height);

    fill(0);
    stroke(255);
    strokeWeight(2);
    rect(width / 2, height / 2, 400, 200, 10);

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width / 2 - 60, height / 2 + 40, 60, 30, 4);
    rect(width / 2 + 60, height / 2 + 40, 60, 30, 4);

    noStroke();
    fill(255);
    textAlign(CENTER);
    textSize(40);
    text("Confirmation", width / 2, height / 2 - 50);
    textSize(20);
    text("Are you sure you want to reset?", width / 2, height / 2 - 10);
    textSize(24);
    text("Yes", width / 2 - 60, height / 2 + 50);
    text("No", width / 2 + 60, height / 2 + 50);

    fill(0, 0, 0, 100);
    rectMode(CENTER);
    stroke(0, 0, 0, 100);
    strokeWeight(2);
    if (mouseX >= width / 2 - 90 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      rect(width / 2 - 60, height / 2 + 40, 60, 30, 4);
    } else if (mouseX >= width / 2 + 30 && mouseX <= width / 2 + 90 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      rect(width / 2 + 60, height / 2 + 40, 60, 30, 4);
    }

    noStroke();
  }

  void confirmReset() {
    if (mouseX >= width / 2 - 90 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      p1Name = "Player 1";
      p2Name = "Player 2";
      p2NameSto = p2Name;
      p1Color = 0;
      p2Color = 0;
      modeSelected = 0;
      botDifficulty = 1;
      dropWhereKilled = false;
      playingMusic = true;
      playingSfx = true;
      censorNames = true;
      volume = 5;
      flagR = 255;
      flagG = 0;
      flagB = 0;
      homeMusic.setGain(0);
      gameMusic.setGain(0);
      gameStart.setGain(0);
      click.setGain(0);
      flash.setGain(0);
      ghost.setGain(0);
      barrier.setGain(0);
      rampage.setGain(0);
      unstoppable.setGain(0);
      dominating.setGain(0);
      legendary.setGain(0);
      shutDown.setGain(0);
      victory.setGain(0);
      defeat.setGain(0);
      countdown.setGain(0);
      flagScore.setGain(0);
      flagWarning.setGain(0);
      flagDanger.setGain(0);
      flagCapture.setGain(0);
      playerTag.setGain(0);
      resetting = false;

      if (logging) {
        println("All settings have been reset.");
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }

      if (playingMusic) {
        homeMusic.rewind();
        gameMusic.rewind();
      }
    } else if (mouseX >= width / 2 + 30 && mouseX <= width / 2 + 90 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55) {
      resetting = false;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void passwordWindow() {
    noStroke();
    fill(0, 0, 0, 200);
    rectMode(CENTER);
    rect(width / 2, height / 2, width, height);

    stroke(255);
    strokeWeight(2);
    fill(0);
    rect(width / 2, height / 2, 500, 250, 10);
    noStroke();
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("Enter password", width / 2, height / 2 - 60);
    textSize(24);
    fill(passwordColor);
    text(passwordHidden, width / 2, height / 2 + 10);
    textSize(26);
    fill(255);
    text("Cancel", width / 2 - 80, height / 2 + 80);
    text("OK", width / 2 + 80, height / 2 + 80);

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width / 2 - 80, height / 2 + 70, 100, 30, 4); // Cancel button border
    rect(width / 2 + 80, height / 2 + 70, 60, 30, 4); // OK button border
    rect(width / 2, height / 2, 300, 40, 4); // Password box

    stroke(0, 0, 0, 100);
    strokeWeight(2);
    fill(0, 0, 0, 100);
    rectMode(CENTER);
    if (mouseX >= width / 2 - 130 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 85) {
      rect(width / 2 - 80, height / 2 + 70, 100, 30, 4); // Cancel button
    } else if (mouseX >= width / 2 + 50 && mouseX <= width / 2 + 110 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 85) {
      rect(width / 2 + 80, height / 2 + 70, 60, 30, 4);
    }

    noStroke();
  }

  void typePassword() {
    if (passwording) {
      if (keyCode != BACKSPACE && keyCode != ENTER && keyCode != RETURN && keyCode != SHIFT) {
        if (password.length() < 20) {
          if (passwordColor == color(198, 8, 8)) {
            passwordColor = color(255);
            password = "";
            passwordHidden = "";
          }

          password += key;
          passwordHidden += "*";
        }
      } else if (keyCode == BACKSPACE) {
        if (password.length() > 0) {
          password = password.substring(0, password.length() - 1);
          passwordHidden = passwordHidden.substring(0, passwordHidden.length() - 1);

          if (passwordColor == color(198, 8, 8)) {
            passwordColor = color(255);
          }
        }
      } else if (keyCode == ENTER || keyCode == RETURN) {
        if (password.equals("saimSpeech")) {
          passwording = false;
          debugging = true;
        } else {
          passwordColor = color(198, 8, 8);
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    }
  }

  void passwordClick() {
    if (mouseX >= width / 2 - 130 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 85) {
      passwording = false;
      debugging = false;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 + 50 && mouseX <= width / 2 + 110 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 85) {
      if (password.equals("saimSpeech")) {
        passwording = false;
        debugging = true;
      } else {
        passwordColor = color(198, 8, 8);
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }
}
