boolean gameIntro;
int fadeTransparency;
int fadeSpeed;

boolean atHome;
int flagR, flagG, flagB;
String[] topTexts = {
  "Powered by: Processing 3, Minim", 
  "v 6.9.0", 
  "Processing.org | code.compartmental.net/tools/minim", 
  "Tan, sine, cosine, Pi, 3.14159... Go, OSA!"
};
int topTextTime, topText;

boolean help;
int helpPage;
boolean settings;
boolean censorNames;
int volume; 
boolean passwording, debugging, logging;

boolean selecting;
int modeSelected, typeSelected;
String p1Name, p2Name, p2NameSto;
String p1NameChange, p2NameChange;
int[][] p1Colors = {{61, 157, 242}, {95, 184, 68}, {189, 69, 222}};
int[][] p2Colors = {{242, 61, 61}, {242, 148, 61}, {242, 200, 61}};
int p1Color, p2Color, p2ColorSto;
boolean editingName;
String[] botDifficulties = {"Easy", "Normal", "Hard"};
int botDifficulty;
boolean dropWhereKilled;

boolean inGame;

class HomePage {
  HomePage() {
    gameIntro = true;
    fadeTransparency = 1;
    fadeSpeed = 1;
    atHome = true;
    flagR = 255;
    flagG = 0;
    flagB = 0;
    help = false;
    helpPage = 0;
    settings = false;
    censorNames = true;
    volume = 5;
    topTextTime = 0;
    topText = 0;
    passwording = false;
    debugging = false;
  }

  void fadeIn() {
    fadeTransparency += fadeSpeed;

    if (fadeTransparency >= 255) fadeSpeed = -1;

    fill(fadeTransparency);
    noStroke();
    textAlign(CENTER);
    textSize(30);
    text("A", width / 2 - 220, height / 2 - 30);
    textSize(50);
    text("Wozard", width / 2 - 60, height / 2 - 30);
    textSize(30);
    text("Production", width / 2 + 160, height / 2 - 30);
    textSize(26);
    text("Powered by: Processing 3, Minim", width / 2, height / 2 + 30);
    textSize(20);
    text("v 6.9.0", width / 2, height / 2 + 80);

    if (fadeTransparency <= 0) {
      gameIntro = false;
    }
  }

  void skipIntro() {
    fadeTransparency = 0;
    gameIntro = false;
  }

  void display() {
    fill(255);
    noStroke();
    textAlign(CENTER);

    textSize(80);
    text("Capture the Flag", width / 2, 200);
    textSize(40);
    text("Java Edition", width / 2, 270);

    if (topTextTime < 300) {
      topTextTime++;
    } else if (topTextTime >= 300) {
      topTextTime = 0;
      if (topText < topTexts.length - 1) {
        topText++;
      } else topText = 0;
    }

    textSize(24);
    text(topTexts[topText], width / 2, 50);

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

    fill(flagR, flagG, flagB); // Flags
    noStroke();
    rectMode(CENTER);
    rect(180, 170, 6, 120, 10); 
    beginShape();
    vertex(177, 110);
    vertex(107, 110);
    vertex(142, 140);
    vertex(107, 170);
    vertex(177, 170);
    endShape();
    rect(width - 180, 170, 6, 120, 10); 
    beginShape();
    vertex(width - 177, 110);
    vertex(width - 107, 110);
    vertex(width - 142, 140);
    vertex(width - 107, 170);
    vertex(width - 177, 170);
    endShape();

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

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width / 2, height / 2, 60, 60, 10); // Play button border
    rect(40, 40, 40, 40, 10); // Exit game button border
    rect(width / 2 - 40, height / 2 + 80, 50, 50, 10); // Help button border
    rect(width / 2 + 40, height / 2 + 80, 50, 50, 10); // Settings button border
    rect(width / 2, height / 2 + 200, 50, 50, 10); // Debug button border

    noStroke(); // Play button icon
    fill(255);
    beginShape();
    vertex(width / 2 - 20, height / 2 - 20);
    vertex(width / 2 + 20, height / 2);
    vertex(width / 2 - 20, height / 2 + 20);
    endShape();

    image(settingsIcon, width / 2 + 40, height / 2 + 80);
    image(debugIcon, width / 2, height / 2 + 200);
    image(exitIcon, 40, 40); // Exit game button icon
    image(helpIcon, width / 2 - 40, height / 2 + 80);
  }

  void helpWindow() {
    fill(0, 0, 0, 200);
    noStroke();
    rectMode(CENTER);
    rect(width / 2, height / 2, width, height);

    fill(0);
    stroke(255);
    rect(width / 2, height / 2, 950, 650, 10);

    noStroke();
    fill(255);
    textSize(50);
    text("Help", width / 2, 140);

    if (helpPage == 0) {
      textSize(26);
      text("Game developed by: WozardLozard", width / 2, 200);
      text("Powered by: Processing 3 (sound by Minim)", width / 2, 250);

      textSize(34);
      text("Welcome to the help page!", width / 2, 350);
      textSize(22);
      text("Here, you can find a gameplay guide for beginners.\nYou can also access a list of patch notes and known bugs.\n\nClick on the arrows below to get started.", width / 2, 400);
    } else if (helpPage == 1) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("About the game", width / 2, 250);
      textSize(22);
      text("* This game is intended to be a realistic simulation of the game called\nCapture the Flag.\n* Both players try to get the other player's flag to their own side.\n* However, if a player is not on their native side, they can get tagged\nand sent back to their spawnpoint.\n* One cannot stand on their flag to prevent their opponent from taking it.\n* Every time a flag is brought back, 1 point is earned.\nFirst player to get 10 points or at the end of 3 minutes wins.", width / 2, 300);
    } else if (helpPage == 2) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("Getting started", width / 2, 250);
      textSize(22);
      text("* To get into a game, press the play button on the homepage.\n* Once in game select, fine-tune the game to suit your preferences.\n* You can access the menu by clicking on the button in the top-right corner\nonce in game.\n* You can play with a friend or with an AI.", width / 2, 300);
    } else if (helpPage == 3) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("Player controls", width / 2, 250);
      textSize(22);
      text("* Player 1 moves with the WASD keys, while player 2 moves with the arrow keys.\n* In 1 player mode, player 1 (the player on the left) is used.\n* Both players cannot move if the countdown is not over or if they are respawning.\n* Physics apply when moving and interacting with the other player and the boundaries.\n* Both players can also use spells during the match, which will be explained\non the next page.", width / 2, 300);
    } else if (helpPage == 4) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("Player spells", width / 2, 250);
      textSize(20);
      text("* Both players have access to powerful spells that can greatly influence\nthe outcome of the game if used properly.\n* Player 1 can press F and player 2 can press J to Flash, which teleports them\na short distance based on their movement and speed.\n* Player 1 can press Z and player 2 can press M to Sprint, which increases their\nmovement speed for a short duration.\n* Player 1 can press C and player 2 can press B to Shield, which makes them\ninvulnerable to the next tag within a short duration.\n* Player 1 can press X and player 2 can press N to Exhaust, which reduces their\nopponent's movement speed for a short duration.", width / 2, 300);
    } else if (helpPage == 5) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("Flags", width / 2, 250);
      textSize(22);
      text("* One's flag can only be picked up by their opponent.\n* If tagged, one's flag will be dropped, even if they're tagged on their native side.\n* The game can be set so that when tagged, the flag's position can remain\nat the tagged position.\n* Again, one cannot hover over their flag for too long or they'll be sent back to their\nspawnpoint.", width / 2, 300);
    } else if (helpPage == 6) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("Game modes", width / 2, 250);
      textSize(22);
      text("* 2 player PvP: Regular Capture the Flag, players cannot go off the map.\n* 1 player AI: Regular Capture the Flag but with only 1 player and an AI opponent.\nThe difficulty can be adjusted and players cannot go off the map.\n* 2 player Portals: Regular Capture the Flag, players can go off the map vertically\nto reappear at the opposite end of the map.\n* On 2 player modes, the game type can be changed.You can play until\na player reaches 10 points or for the best score after 3 minutes. ", width / 2, 300);
    } else if (helpPage == 7) {
      textSize(26);
      text("Developed by: WozardLozard", width / 2, 190);
      textSize(34);
      text("Bugs", width / 2, 250);
      textSize(22);
      text("* The player may not move after spawning if the move key is held. Release\n and press the key again if this occurs.", width / 2, 300);
    }

    textSize(20);
    text("Page " + (helpPage + 1) + " of 8", width / 2, height / 2 + 270);

    textSize(30);
    image(exitIcon, width / 2 + 440, height / 2 - 290); // Exit help menu icon

    beginShape(); // Right arrow icon
    vertex(width / 2 + 400, height / 2 + 250);
    vertex(width / 2 + 436, height / 2 + 268);
    vertex(width / 2 + 400, height / 2 + 286);
    endShape();
    beginShape(); // Left arrow icon
    vertex(width / 2 - 400, height / 2 + 250);
    vertex(width / 2 - 436, height / 2 + 268);
    vertex(width / 2 - 400, height / 2 + 286);
    endShape();

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    rect(width / 2 + 418, height / 2 + 268, 50, 50, 10); // Right arrow border
    rect(width / 2 - 418, height / 2 + 268, 50, 50, 10); // Left arrow border
    rect(width / 2 + 440, height / 2 - 290, 40, 40, 10); // Exit help menu border

    fill(0, 0, 0, 100);
    stroke(0, 0, 0, 100);
    strokeWeight(2);
    rectMode(CENTER);

    if (mouseX >= width / 2 + 418 - 25 && mouseX <= width / 2 + 418 + 25 && mouseY >= height / 2 + 268 - 25 && mouseY <= height / 2 + 268 + 25 && helpPage < 7) {
      rect(width / 2 + 418, height / 2 + 268, 50, 50, 10); // Right arrow
    } else if (mouseX >= width / 2 - 418 - 25 && mouseX <= width / 2 - 418 + 25 && mouseY >= height / 2 + 268 - 25 && mouseY <= height / 2 + 268 + 25 && helpPage > 0) {
      rect(width / 2 - 418, height / 2 + 268, 50, 50, 10); // Left arrow
    } else if (mouseX >= width / 2 + 440 - 20 && mouseX <= width / 2 + 440 + 20 && mouseY >= height / 2 - 290 - 20 && mouseY <= height / 2 - 290 + 20) {
      rect(width / 2 + 440, height / 2 - 290, 40, 40, 10); // Exit menu
    } 

    if (helpPage == 0) {
      rect(width / 2 - 418, height / 2 + 268, 50, 50, 10); // Left arrow
    } else if (helpPage == 7) {
      rect(width / 2 + 418, height / 2 + 268, 50, 50, 10); // Right arrow
    }

    noStroke();
  }

  void helpClick() {
    if (mouseX >= width / 2 + 418 - 25 && mouseX <= width / 2 + 418 + 25 && mouseY >= height / 2 + 268 - 25 && mouseY <= height / 2 + 268 + 25 && helpPage < 7) {
      helpPage++;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 - 418 - 25 && mouseX <= width / 2 - 418 + 25 && mouseY >= height / 2 + 268 - 25 && mouseY <= height / 2 + 268 + 25 && helpPage > 0) {
      helpPage--;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 + 440 - 20 && mouseX <= width / 2 + 440 + 20 && mouseY >= height / 2 - 290 - 20 && mouseY <= height / 2 - 290 + 20) {
      help = false;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void settingsWindow() {
    fill(0, 0, 0, 200);
    noStroke();
    rectMode(CENTER);
    rect(width / 2, height / 2, width, height);

    fill(0);
    stroke(255);
    rect(width / 2, height / 2, 910, 650, 10);

    noStroke();
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("Settings", width / 2, 150);

    textSize(30);
    image(exitIcon, width / 2 + 420, height / 2 - 290); // Settings menu exit icon

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
    if (censorNames) {
      text("Censor      On", width / 2, 360);
    } else {
      text("Censor      Off", width / 2, 360);
    }

    text("Volume: " + volume, width / 2, 420);

    text("Reset", width / 2, 550);

    beginShape(); // Volume decrease button
    vertex(width / 2 - 90, 400);
    vertex(width / 2 - 110, 400);
    vertex(width / 2 - 100, 420);
    endShape();
    beginShape(); // Volume increase button
    vertex(width / 2 + 100, 400);
    vertex(width / 2 + 110, 420);
    vertex(width / 2 + 90, 420);
    endShape();

    stroke(255);
    strokeWeight(2);
    noFill();
    rectMode(CENTER);
    rect(width / 2 + 420, height / 2 - 290, 40, 40, 10); // Settings exit button border
    rect(width / 2 + 70, 230, 60, 40, 10); // Music toggle button
    rect(width / 2 + 55, 290, 60, 40, 10); // SFX toggle button
    rect(width / 2 + 80, 350, 60, 40, 10); // Censor toggle button
    rect(width / 2 - 100, 410, 30, 30, 5); // Volume decrease button
    rect(width / 2 + 100, 410, 30, 30, 5); // Volume increase button
    rect(width / 2, 540, 100, 40, 10); // Reset button

    if (!resetting) {
      fill(0, 0, 0, 100);
      stroke(0, 0, 0, 100);
      strokeWeight(2);
      rectMode(CENTER);

      if (mouseX >= width / 2 + 400 && mouseX <= width / 2 + 440 && mouseY >= height / 2 - 310 && mouseY <= height / 2 - 270) {
        rect(width / 2 + 420, height / 2 - 290, 40, 40, 10); // Exit settings button
      } else if (mouseX >= width / 2 + 40 && mouseX <= width / 2 + 100 && mouseY >= 210 && mouseY <= 250) {
        rect(width / 2 + 70, 230, 60, 40, 10); // Music toggle button
      } else if (mouseX >= width / 2 + 25 && mouseX <= width / 2 + 85 && mouseY >= 270 && mouseY <= 310) {
        rect(width / 2 + 55, 290, 60, 40, 10); // SFX toggle button
      } else if (mouseX >= width / 2 + 50 && mouseX <= width / 2 + 110 && mouseY >= 330 && mouseY <= 370) {
        rect(width / 2 + 80, 350, 60, 40, 10); // Censor toggle button
      } else if (mouseX >= width / 2 - 50 && mouseX <= width / 2 + 50 && mouseY >= 520 && mouseY <= 560) {
        rect(width / 2, 540, 100, 40, 10); // Reset button
      } else if (mouseX >= width / 2 - 115 && mouseX <= width / 2 - 85 && mouseY >= 395 && mouseY <= 425 && volume > 0) {
        rect(width / 2 - 100, 410, 30, 30, 5); // Volume decrease button
      } else if (mouseX >= width / 2 + 85 && mouseX <= width / 2 + 115 && mouseY >= 395 && mouseY <= 425 && volume < 10) {
        rect(width / 2 + 100, 410, 30, 30, 5); // Volume increase button
      }

      if (volume == 0) {
        rect(width / 2 - 100, 410, 30, 30, 5); // Volume decrease button
      } else if (volume == 10) {
        rect(width / 2 + 100, 410, 30, 30, 5); // Volume increase button
      }

      noStroke();
    }
  }

  void settingsClick() {
    if (mouseX >= width / 2 + 400 && mouseX <= width / 2 + 440 && mouseY >= height / 2 - 310 && mouseY <= height / 2 - 270) {
      settings = false;

      if (playingSfx) {
        click.rewind();
        click.play();
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
    } else if (mouseX >= width / 2 + 50 && mouseX <= width / 2 + 110 && mouseY >= 330 && mouseY <= 370) {
      if (censorNames) {
        censorNames = false;
      } else {
        censorNames = true;
      } 

      if (logging) {
        println("Censor names has been set to " + censorNames);
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 - 50 && mouseX <= width / 2 + 50 && mouseY >= 520 && mouseY <= 560) {
      resetting = true;

      if (playingSfx) {
        click.rewind(); 
        click.play();
      }
    } else if (mouseX >= width / 2 - 115 && mouseX <= width / 2 - 85 && mouseY >= 395 && mouseY <= 425 && volume > 0) {
      volume--;
      if (volume > 0) {
        homeMusic.shiftGain(homeMusic.getGain(), homeMusic.getGain() - 2, 500);
        gameMusic.shiftGain(gameMusic.getGain(), gameMusic.getGain() - 2, 500);
        gameStart.shiftGain(gameStart.getGain(), gameStart.getGain() - 2, 500);
        click.shiftGain(click.getGain(), click.getGain() - 2, 500);
        flash.shiftGain(flash.getGain(), flash.getGain() - 2, 500);
        ghost.shiftGain(ghost.getGain(), ghost.getGain() - 2, 500);
        barrier.shiftGain(barrier.getGain(), barrier.getGain() - 2, 500);
        exhaust.shiftGain(exhaust.getGain(), exhaust.getGain() - 2, 500);
        rampage.shiftGain(rampage.getGain(), rampage.getGain() - 2, 500);
        unstoppable.shiftGain(unstoppable.getGain(), unstoppable.getGain() - 2, 500);
        dominating.shiftGain(dominating.getGain(), dominating.getGain() - 2, 500);
        legendary.shiftGain(legendary.getGain(), legendary.getGain() - 2, 500);
        shutDown.shiftGain(shutDown.getGain(), shutDown.getGain() - 2, 500);
        victory.shiftGain(victory.getGain(), victory.getGain() - 2, 500);
        defeat.shiftGain(defeat.getGain(), defeat.getGain() - 2, 500);
        countdown.shiftGain(countdown.getGain(), countdown.getGain() - 2, 500);
        flagWarning.shiftGain(flagScore.getGain(), flagScore.getGain() - 2, 500);
        flagDanger.shiftGain(flagScore.getGain(), flagScore.getGain() - 2, 500);
        flagCapture.shiftGain(flagScore.getGain(), flagScore.getGain() - 2, 500);
        flagScore.shiftGain(flagScore.getGain(), flagScore.getGain() - 2, 500);
        playerTag.shiftGain(playerTag.getGain(), playerTag.getGain() - 2, 500);

        if (logging) {
          println("Volume has been decreased");
        }
      } else {
        homeMusic.mute();
        gameMusic.mute();
        gameStart.mute();
        click.mute();
        flash.mute();
        ghost.mute();
        barrier.mute();
        exhaust.mute();
        rampage.mute();
        unstoppable.mute();
        dominating.mute();
        legendary.mute();
        shutDown.mute();
        victory.mute();
        defeat.mute();
        countdown.mute();
        flagWarning.mute();
        flagDanger.mute();
        flagCapture.mute();
        flagScore.mute();
        playerTag.mute();
        click.mute();

        if (logging) {
          println("Sounds have been muted");
        }
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 + 85 && mouseX <= width / 2 + 115 && mouseY >= 395 && mouseY <= 425 && volume < 10) {
      volume++;
      if (homeMusic.isMuted()) homeMusic.unmute();
      if (gameMusic.isMuted()) gameMusic.unmute();
      if (gameStart.isMuted()) gameStart.unmute();
      if (click.isMuted()) click.unmute();
      if (flash.isMuted()) flash.unmute();
      if (ghost.isMuted()) ghost.unmute();
      if (barrier.isMuted()) barrier.unmute();
      if (exhaust.isMuted()) exhaust.unmute();
      if (rampage.isMuted()) rampage.unmute();
      if (unstoppable.isMuted()) unstoppable.unmute();
      if (dominating.isMuted()) dominating.unmute();
      if (legendary.isMuted()) legendary.unmute();
      if (shutDown.isMuted()) shutDown.unmute();
      if (victory.isMuted()) victory.unmute();
      if (defeat.isMuted()) defeat.unmute();
      if (countdown.isMuted()) countdown.unmute();
      if (flagWarning.isMuted()) flagWarning.unmute();
      if (flagDanger.isMuted()) flagDanger.unmute();
      if (flagCapture.isMuted()) flagCapture.unmute();
      if (flagScore.isMuted()) flagScore.unmute();
      if (playerTag.isMuted()) playerTag.unmute();
      if (click.isMuted()) click.unmute();
      homeMusic.shiftGain(homeMusic.getGain(), homeMusic.getGain() + 2, 500);
      gameMusic.shiftGain(gameMusic.getGain(), gameMusic.getGain() + 2, 500);
      gameStart.shiftGain(gameStart.getGain(), gameStart.getGain() + 2, 500);
      click.shiftGain(click.getGain(), click.getGain() + 2, 500);
      flash.shiftGain(flash.getGain(), flash.getGain() + 2, 500);
      ghost.shiftGain(ghost.getGain(), ghost.getGain() + 2, 500);
      barrier.shiftGain(barrier.getGain(), barrier.getGain() + 2, 500);
      rampage.shiftGain(rampage.getGain(), rampage.getGain() + 2, 500);
      unstoppable.shiftGain(unstoppable.getGain(), unstoppable.getGain() + 2, 500);
      dominating.shiftGain(dominating.getGain(), dominating.getGain() + 2, 500);
      legendary.shiftGain(legendary.getGain(), legendary.getGain() + 2, 500);
      shutDown.shiftGain(shutDown.getGain(), shutDown.getGain() + 2, 500);
      victory.shiftGain(victory.getGain(), victory.getGain() + 2, 500);
      defeat.shiftGain(defeat.getGain(), defeat.getGain() + 2, 500);
      countdown.shiftGain(countdown.getGain(), countdown.getGain() + 2, 500);
      flagWarning.shiftGain(flagScore.getGain(), flagScore.getGain() + 2, 500);
      flagDanger.shiftGain(flagScore.getGain(), flagScore.getGain() + 2, 500);
      flagCapture.shiftGain(flagScore.getGain(), flagScore.getGain() + 2, 500);
      flagScore.shiftGain(flagScore.getGain(), flagScore.getGain() + 2, 500);
      playerTag.shiftGain(playerTag.getGain(), playerTag.getGain() + 2, 500);

      if (logging) {
        println("Volume has been increased");
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void debugWindow() {
    if (debugging) {
      fill(0, 0, 0, 200);
      noStroke();
      rectMode(CENTER);
      rect(width / 2, height / 2, width, height);

      fill(0);
      stroke(255);
      strokeWeight(2);
      rectMode(CENTER);
      rect(width / 2, height / 2, 600, 300, 10);

      fill(255);
      noStroke();
      textSize(40);
      textAlign(CENTER);
      text("Debug", width / 2, height / 2 - 100);

      textSize(30);
      image(exitIcon, width / 2 + 260, height / 2 - 110); // Exit debug menu button
      if (logging) {
        text("Logs      On", width / 2, height / 2 - 20);
      } else {
        text("Logs      Off", width / 2, height / 2 - 20);
      }

      noFill();
      stroke(255);
      strokeWeight(2);
      rectMode(CENTER);
      rect(width / 2 + 60, height / 2 - 30, 60, 40, 10); // Logs toggle button
      rect(width / 2 + 260, height / 2 - 110, 40, 40, 10); // Exit debug menu button

      fill(0, 0, 0, 100);
      stroke(0, 0, 0, 100);
      strokeWeight(2);
      rectMode(CENTER);
      if (mouseX >= width / 2 + 30 && mouseX <= width / 2 + 90 && mouseY >= height / 2 - 50 && mouseY <= height / 2 - 10) {
        rect(width / 2 + 60, height / 2 - 30, 60, 40, 10); // Logs toggle
      } else if (mouseX >= width / 2 + 240 && mouseX <= width / 2 + 280 && mouseY >= height / 2 - 130 && mouseY <= height / 2 - 90) {
        rect(width / 2 + 260, height / 2 - 110, 40, 40, 10); // Exit debug menu
      }
    }
  }

  void debugClick() {
    if (mouseX >= width / 2 + 35 && mouseX <= width / 2 + 95 && mouseY >= height / 2 - 50 && mouseY <= height / 2 - 10) {
      if (logging) { // Logs toggle
        logging = false;
      } else if (!logging) {
        logging = true;

        println("Logs have been enabled. Logs will now appear here.");
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 + 240 && mouseX <= width / 2 + 280 && mouseY >= height / 2 - 130 && mouseY <= height / 2 - 90) {
      debugging = false;
      passwording = false;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void hover() {
    fill(0, 0, 0, 100);
    rectMode(CENTER);
    stroke(0, 0, 0, 100);
    strokeWeight(2);

    if (mouseX >= width / 2 - 30 && mouseX <= width / 2 + 30 && mouseY >= height / 2 - 30 && mouseY <= height / 2 + 30) {
      rect(width / 2, height / 2, 60, 60, 10); // Play button
    } else if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      rect(40, 40, 40, 40, 10); // Exit button
    } else if (mouseX >= width / 2 - 65 && mouseX <= width / 2 - 15 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 105) {
      rect(width / 2 - 40, height / 2 + 80, 50, 50, 10); // Help button
    } else if (mouseX >= width / 2 + 15 && mouseX <= width / 2 + 65 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 105) {
      rect(width / 2 + 40, height / 2 + 80, 50, 50, 10); // Settings button
    } else if (mouseX >= width / 2 - 25 && mouseX <= width / 2 + 25 && mouseY >= height / 2 + 175 && mouseY <= height / 2 + 225) {
      rect(width / 2, height / 2 + 200, 50, 50, 10); // Debug button
    }

    noStroke();
  }

  void click() {
    if (mouseX >= width / 2 - 30 && mouseX <= width / 2 + 30 && mouseY >= height / 2 - 30 && mouseY <= height / 2 + 30) {
      atHome = false;
      selecting = true;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 - 65 && mouseX <= width / 2 - 15 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 105) {
      if (!settings && !help && !passwording && !debugging) {
        help = true;

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    } else if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60 && !quitting && !help && !settings && !passwording && !debugging) {
      quitting = true;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 + 15 && mouseX <= width / 2 + 65 && mouseY >= height / 2 + 55 && mouseY <= height / 2 + 105) {
      if (!settings && !help && !passwording && !debugging) {
        settings = true;

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    } else if (mouseX >= width / 2 - 25 && mouseX <= width / 2 + 25 && mouseY >= height / 2 + 175 && mouseY <= height / 2 + 225) {
      if (!settings && !help && !passwording && !debugging) {
        passwording = true;
        password = "";
        passwordHidden = "";

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    }
  }
}

class GameSelect {
  GameSelect() {
    selecting = false;
    modeSelected = 0;
    typeSelected = 0;
    p1Name = "Player 1";
    p2Name = "Player 2";
    p2NameSto = p2Name;
    p1NameChange = "Change...";
    p2NameChange = "Change...";
    p1Color = 0;
    p2Color = 0;
    p2ColorSto = p2Color;
    editingName = false;
    botDifficulty = 1;
    dropWhereKilled = false;
  }

  void display() {
    fill(255);
    noStroke();
    textAlign(CENTER);

    textSize(50);
    text("Game Select", width / 2, 70);

    textSize(38);
    text("Game Mode", width / 2, 160);
    textSize(28);
    text("2 Player | PvP", 300, 220);
    text("1 Player | AI", width / 2, 220);
    text("2 Player | Portal", width - 300, 220);

    textSize(38);
    text("Usernames", width / 2, 320);
    textSize(28);
    fill(p1Colors[p1Color][0], p1Colors[p1Color][1], p1Colors[p1Color][2]);
    text(p1Name, 400, 380);
    fill(p2Colors[p2Color][0], p2Colors[p2Color][1], p2Colors[p2Color][2]);
    text(p2Name, width - 400, 380);
    fill(255);
    textSize(22);
    text(p1NameChange, 400, 420); // Change buttons
    text(p2NameChange, width - 400, 420);

    textSize(38);
    if (modeSelected == 0 || modeSelected == 2) {
      text("Game Type", width / 2, 520);
      textSize(28);
      text("10 Points", width / 2 - 80, 580);
      text("Timed", width / 2 + 80, 580);
    } else if (modeSelected == 1) {
      text("Bot Difficulty", width / 2, 520);
      textSize(28);
      text(botDifficulties[botDifficulty], width / 2, 580);
    }

    textSize(28);
    if (dropWhereKilled) {
      text("Drop flag at defeated position      On", width / 2, 680);
    } else text("Drop flag at defeated position      Off", width / 2, 680);

    textSize(40);
    text("Play", width - 80, height - 40);

    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);

    rect(40, 40, 40, 40, 10); // Back button border

    rect(400, 340, 30, 30, 10); // Color change button borders
    rect(width - 400, 340, 30, 30, 10);

    if (modeSelected == 0 || modeSelected == 2) {
      if (typeSelected == 0) {
        rect(width / 2 - 80, 570, 140, 40, 10); // Game type button borders
      } else if (typeSelected == 1) {
        rect(width / 2 + 80, 570, 140, 40, 10);
      }
    } else if (modeSelected == 1) {
      rect(width / 2 - 90, 570, 40, 40, 10); // Bot difficulty button borders
      rect(width / 2 + 90, 570, 40, 40, 10);
    }

    rect(780, 670, 60, 40, 10); // Drop flag where defeated toggle borders

    rect(width - 80, height - 50, 90, 50, 10); // Play button borders

    // Mode select buttons
    if (modeSelected == 0) {
      rect(300, 210, 220, 40, 10);
    } else if (modeSelected == 1) {
      rect(width / 2, 210, 220, 40, 10);
    } else if (modeSelected == 2) {
      rect(width - 300, 210, 220, 40, 10);
    }

    // Name change buttons
    rect(400, 410, 140, 40, 10);
    rect(width - 400, 410, 140, 40, 10);

    noStroke(); 
    fill(255);

    beginShape(); // Back button icon
    vertex(50, 30);
    vertex(30, 40);
    vertex(50, 50);
    endShape();

    beginShape(); // Color change button icons
    vertex(400, 330);
    vertex(390, 350);
    vertex(410, 350);
    endShape();
    beginShape();
    vertex(width - 400, 330);
    vertex(width - 410, 350);
    vertex(width - 390, 350);
    endShape();

    fill(0, 0, 0, 100);
    stroke(0, 0, 0, 100);
    strokeWeight(2);
    rectMode(CENTER);
    if (modeSelected == 1) rect(width - 400, 390, 140, 140);

    noStroke(); 
    fill(255);

    if (modeSelected == 1) {
      beginShape(); // Bot difficulty button icons
      vertex(width / 2 - 100, 570);
      vertex(width / 2 - 80, 560);
      vertex(width / 2 - 80, 580);
      endShape();
      beginShape();
      vertex(width / 2 + 100, 570);
      vertex(width / 2 + 80, 560);
      vertex(width / 2 + 80, 580);
      endShape();
    }
  }

  void hover() {
    fill(0, 0, 0, 100);
    rectMode(CENTER);
    stroke(0, 0, 0, 100);
    strokeWeight(2);

    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      rect(40, 40, 40, 40, 10);
    } else if (mouseX >= 190 && mouseX <= 420 && mouseY >= 190 && mouseY <= 230) {
      rect(300, 210, 220, 40, 10);
    } else if (mouseX >= width / 2 - 105 && mouseX <= width / 2 + 105 && mouseY >= 190 && mouseY <= 230) {
      rect(width / 2, 210, 220, 40, 10);
    } else if (mouseX >= width - 400 && mouseX <= width - 200 && mouseY >= 190 && mouseY <= 230) {
      rect(width - 300, 210, 220, 40, 10);
    } else if (mouseX >= 330 && mouseX <= 470 && mouseY >= 390 && mouseY <= 430 && !editingName) {
      rect(400, 410, 140, 40, 10);
    } else if (mouseX >= width - 470 && mouseX <= width - 330 && mouseY >= 390 && mouseY <= 430 && !editingName && modeSelected != 1) {
      rect(width - 400, 410, 140, 40, 10);
    } else if (mouseX >= 385 && mouseX <= 415 && mouseY >= 325 && mouseY <= 355) {
      rect(400, 340, 30, 30, 10);
    } else if (mouseX >= width - 415 && mouseX <= width - 385 && mouseY >= 325 && mouseY <= 355 && modeSelected != 1) {
      rect(width - 400, 340, 30, 30, 10);
    } else if (mouseX >= width / 2 - 110 && mouseX <= width / 2 - 70 && mouseY >= 550 && mouseY <= 590 && botDifficulty != 0 && modeSelected == 1) {
      rect(width / 2 - 90, 570, 40, 40, 10);
    } else if (mouseX >= width / 2 + 70 && mouseX <= width / 2 + 110 && mouseY >= 550 && mouseY <= 590 && botDifficulty != 2 && modeSelected == 1) {
      rect(width / 2 + 90, 570, 40, 40, 10);
    } else if (mouseX >= 750 && mouseX <= 810 && mouseY >= 650 && mouseY <= 690) {
      rect(780, 670, 60, 40, 10);
    } else if (mouseX >= width / 2 - 150 && mouseX <= width / 2 - 10 && mouseY >= 550 && mouseY <= 590 && modeSelected == 0 || mouseX >= width / 2 - 150 && mouseX <= width / 2 - 10 && mouseY >= 550 && mouseY <= 590 && modeSelected == 2) {
      rect(width / 2 - 80, 570, 140, 40, 10);
    } else if (mouseX >= width / 2 + 10 && mouseX <= width / 2 + 150 && mouseY >= 550 && mouseY <= 590 && modeSelected == 0 || mouseX >= width / 2 + 10 && mouseX <= width / 2 + 150 && mouseY >= 550 && mouseY <= 590 && modeSelected == 2) {
      rect(width / 2 + 80, 570, 140, 40, 10);
    } else if (mouseX >= width - 125 && mouseX <= width - 35 && mouseY >= height - 75 && mouseY <= height - 25 && !editingName) {
      rect(width - 80, height - 50, 90, 50, 10);
    } 

    if (editingName) {
      rect(width - 80, height - 50, 90, 50, 10);
    }

    if (botDifficulty == 0 && modeSelected == 1) {
      rect(width / 2 - 90, 570, 40, 40, 10);
    } else if (botDifficulty == 2 && modeSelected == 1) {
      rect(width / 2 + 90, 570, 40, 40, 10);
    }

    if (editingName) {
      rect(400, 410, 140, 40, 10);
      rect(width - 400, 410, 140, 40, 10);
    }
  }

  void selectMode() {
    if (mouseX >= 200 && mouseX <= 400 && mouseY >= 190 && mouseY <= 230) {
      modeSelected = 0;
      p2Name = p2NameSto;
      p2Color = p2ColorSto;

      if (logging) {
        println("Mode has been set to 2 player PvP.");
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width / 2 - 105 && mouseX <= width / 2 + 105 && mouseY >= 190 && mouseY <= 230) {
      modeSelected = 1;
      p2ColorSto = p2Color;
      p2Color = int(random(p2Colors.length));
      p2NameSto = p2Name;
      p2Name = botDifficulties[botDifficulty] + "AI";

      if (logging) {
        println("Mode has been set to 1 player AI.");
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width - 400 && mouseX <= width - 200 && mouseY >= 190 && mouseY <= 230) {
      modeSelected = 2;
      p2Name = p2NameSto;
      p2Color = p2ColorSto;

      if (logging) {
        println("Mode has been set to 2 player Portal.");
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void selectType() {
    if (modeSelected == 0 || modeSelected == 2) {
      if (mouseX >= width / 2 - 150 && mouseX <= width / 2 - 10 && mouseY >= 550 && mouseY <= 590) {
        typeSelected = 0;

        if (logging) {
          println("Type has been set to 10 points.");
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width / 2 + 10 && mouseX <= width / 2 + 150 && mouseY >= 550 && mouseY <= 590) {
        typeSelected = 1;

        if (logging) {
          println("Type has been set to timed.");
        }

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    }
  }

  void changeName() {
    if (!editingName) {
      if (mouseX >= 330 && mouseX <= 470 && mouseY >= 390 && mouseY <= 430) {
        editingName = true;
        p1Name = "";
        p1NameChange = "Changing...";
        p2NameChange = "X";

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      } else if (mouseX >= width - 470 && mouseX <= width - 330 && mouseY >= 390 && mouseY <= 430 && modeSelected != 1) {
        editingName = true;
        p2Name = "";
        p2NameChange = "Changing...";
        p1NameChange = "X";

        if (playingSfx) {
          click.rewind();
          click.play();
        }
      }
    }
  }

  void typeName() {
    if (keyCode != ENTER && keyCode != RETURN && keyCode != BACKSPACE && keyCode != SHIFT) {
      if (p1NameChange == "Changing...") {
        if (p1Name.length() < 12) p1Name += key;
      } else if (p2NameChange == "Changing...") {
        if (p2Name.length() < 12) p2Name += key;
      }
    } else if (keyCode == BACKSPACE) {
      if (p1NameChange == "Changing...") {
        if (p1Name.length() > 0) {
          p1Name = p1Name.substring(0, p1Name.length() - 1);
        }
      } else if (p2NameChange == "Changing...") {
        if (p2Name.length() > 0) {
          p2Name = p2Name.substring(0, p2Name.length() - 1);
        }
      }
    } else if (keyCode == ENTER || keyCode == RETURN) {
      if (p1NameChange == "Changing...") {
        if (p1Name.endsWith(" ")) {
          p1Name = p1Name.substring(0, p1Name.length() - 1);
        }

        if (p1Name.length() == 0) {
          p1Name = "Player 1";
        }

        if (censorNames) {
          if (p1Name.toLowerCase().contains("nigger") || p1Name.toLowerCase().contains("n1gg3r") || p1Name.toLowerCase().contains("bitch") || p1Name.toLowerCase().contains("b1tch") || p1Name.toLowerCase().contains("fuck") || p1Name.toLowerCase().contains("retard") || p1Name.toLowerCase().contains("r3tard") || p1Name.toLowerCase().contains("penis") || p1Name.toLowerCase().contains("p3n1s") || p1Name.toLowerCase().contains("vagina") || p1Name.toLowerCase().contains("shit") || p1Name.toLowerCase().contains("sh1t") || p1Name.toLowerCase().contains("ass") || p1Name.toLowerCase().contains("kys")) {
            p1Name = "Benched";
          }
        }

        if (logging) {
          println("Player 1 name has been set to " + p1Name);
        }
      } else if (p2NameChange == "Changing...") {
        if (p2Name.endsWith(" ")) {
          p2Name = p2Name.substring(0, p2Name.length() - 1);
        }

        if (p2Name.length() == 0) {
          p2Name = "Player 2";
        }

        if (censorNames) {
          if (p2Name.toLowerCase().contains("nigger") || p2Name.toLowerCase().contains("n1gg3r") || p2Name.toLowerCase().contains("bitch") || p2Name.toLowerCase().contains("b1tch") || p2Name.toLowerCase().contains("fuck") || p2Name.toLowerCase().contains("retard") || p2Name.toLowerCase().contains("r3tard") || p2Name.toLowerCase().contains("penis") || p2Name.toLowerCase().contains("p3n1s") || p2Name.toLowerCase().contains("vagina") || p2Name.toLowerCase().contains("shit") || p2Name.toLowerCase().contains("sh1t") || p2Name.toLowerCase().contains("ass") || p2Name.toLowerCase().contains("kys")) {
            p2Name = "Benched";
          }
        }

        if (logging) {
          println("Player 2 name has been set to " + p2Name);
        }
      }

      editingName = false;
      p1NameChange = "Change...";
      p2NameChange = "Change...";

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void changeColor() {
    if (mouseX >= 385 && mouseX <= 415 && mouseY >= 325 && mouseY <= 355) {
      if (p1Color < p1Colors.length - 1) {
        p1Color++;
      } else if (p1Color == p1Colors.length - 1) {
        p1Color = 0;
      }

      if (logging) {
        println("Player 1 color has been set to " + p1Colors[p1Color][0] + ", " + p1Colors[p1Color][1] + ", " + p1Colors[p1Color][2]);
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    } else if (mouseX >= width - 415 && mouseX <= width - 385 && mouseY >= 325 && mouseY <= 355 && modeSelected != 1) {
      if (p2Color < p2Colors.length - 1) {
        p2Color++;
      } else if (p2Color == p2Colors.length - 1) {
        p2Color = 0;
      }

      if (logging) {
        println("Player 2 color has been set to " + p2Colors[p2Color][0] + ", " + p2Colors[p2Color][1] + ", " + p2Colors[p2Color][2]);
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void changeDifficulty() {
    if (modeSelected == 1) {
      if (mouseX >= width / 2 - 110 && mouseX <= width / 2 - 70 && mouseY >= 550 && mouseY <= 590) {
        if (botDifficulty > 0) {
          botDifficulty--;

          if (playingSfx) {
            click.rewind();
            click.play();
          }
        }
        p2Name = botDifficulties[botDifficulty] + "AI";

        if (logging) {
          println("Bot difficulty has been set to " + botDifficulties[botDifficulty]);
        }
      } else if (mouseX >= width / 2 + 70 && mouseX <= width / 2 + 110 && mouseY >= 550 && mouseY <= 590) {
        if (botDifficulty < 2) {
          botDifficulty++;

          if (playingSfx) {
            click.rewind();
            click.play();
          }
        }
        p2Name = botDifficulties[botDifficulty] + "AI";

        if (logging) {
          println("Bot difficulty has been set to " + botDifficulties[botDifficulty]);
        }
      }
    }
  }

  void toggleFlagDrop() {
    if (mouseX >= 750 && mouseX <= 810 && mouseY >= 650 && mouseY <= 690) {
      if (dropWhereKilled) {
        dropWhereKilled = false;
      } else dropWhereKilled = true;

      if (logging) {
        println("Drop flag where defeated has been set to " + dropWhereKilled);
      }

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }

  void startGame() {
    if (mouseX >= width - 125 && mouseX <= width - 35 && mouseY >= height - 75 && mouseY <= height - 25 && !editingName) {
      selecting = false;
      inGame = true;
      randomTip = int(random(tips.length));
      progress = 0.0;
      progressAmount = 0.0;

      if (modeSelected == 0 && typeSelected == 1 || modeSelected == 2 && typeSelected == 1) {
        gameMinute = 3;
      }

      if (logging) {
        println("The game has been started. The mode selected is " + modeSelected + " and the type selected is " + typeSelected);
      }

      if (playingSfx) {
        click.rewind();
        click.play();
        gameStart.rewind();
        gameStart.play();
      }

      if (playingMusic) {
        gameMusic.rewind();
      }
    }
  }

  void back() {
    if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) {
      selecting = false;
      atHome = true;

      if (playingSfx) {
        click.rewind();
        click.play();
      }
    }
  }
}
