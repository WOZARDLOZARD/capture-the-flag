import ddf.minim.Minim;
import ddf.minim.AudioPlayer;

Client client;
HomePage homePage;
GameSelect gameSelect;
Game game;
Map map;
PowerUp powerUp;
Menu menu;
GameOver gameOver;
Minim minim;
AudioPlayer homeMusic, gameMusic, gameStart, click, countdown, powerSpawn, flagWarning, flagDanger, flagCapture, flagScore, flash, ghost, barrier, exhaust, playerTag, rampage, unstoppable, dominating, legendary, shutDown, victory, defeat;
PImage settingsIcon, helpIcon, debugIcon, exitIcon;

void setup() {
  size(1100, 750);
  frameRate(60);
  smooth();
  imageMode(CENTER);

  client = new Client();
  homePage = new HomePage();
  gameSelect = new GameSelect();
  game = new Game();
  map = new Map();
  powerUp = new PowerUp();
  menu = new Menu();
  gameOver = new GameOver();
  minim = new Minim(this);
  homeMusic = minim.loadFile("home_music.mp3");
  click = minim.loadFile("click.mp3");
  gameMusic = minim.loadFile("game_music.mp3");
  gameStart = minim.loadFile("game_start.wav");
  countdown = minim.loadFile("countdown.mp3");
  powerSpawn = minim.loadFile("spawn.mp3");
  flagWarning = minim.loadFile("flag_warning.mp3");
  flagDanger = minim.loadFile("flag_danger.mp3");
  flagCapture = minim.loadFile("flag_capture.mp3");
  flagScore = minim.loadFile("flag_score.mp3");
  flash = minim.loadFile("flash.mp3");
  ghost = minim.loadFile("ghost.mp3");
  barrier = minim.loadFile("barrier.mp3");
  exhaust = minim.loadFile("exhaust.mp3");
  playerTag = minim.loadFile("player_tag.mp3");
  rampage = minim.loadFile("rampage.mp3");
  dominating = minim.loadFile("dominating.mp3");
  unstoppable = minim.loadFile("unstoppable.mp3");
  legendary = minim.loadFile("legendary.mp3");
  shutDown = minim.loadFile("shut_down.mp3");
  victory = minim.loadFile("victory.mp3");
  defeat = minim.loadFile("defeat.mp3");
  settingsIcon = loadImage("settings.png");
  helpIcon = loadImage("help.png");
  debugIcon = loadImage("debug.png");
  exitIcon = loadImage("exit.png");
  settingsIcon.resize(40, 40);
  helpIcon.resize(40, 40);
  debugIcon.resize(40, 40);
  exitIcon.resize(40, 40);
}

void draw() {
  if (!focused) return;
  
  background(0);

  if (atHome && !gameIntro && playingMusic || selecting && playingMusic) {
    if (!homeMusic.isPlaying()) {
      homeMusic.loop();
      homeMusic.play();
    }
  } else {
    homeMusic.pause();
  }

  if (inGame && gameLoaded && !displayingMenu && playingMusic) {
    if (!gameMusic.isPlaying()) {
      gameMusic.loop();
      gameMusic.play();
    }
  } else {
    gameMusic.pause();
  }

  if (atHome) {
    if (gameIntro) {
      homePage.fadeIn();
    } else {
      homePage.display();

      if (!quitting) {
        if (!help && !settings && !passwording && !debugging) {
          homePage.hover();
        } else if (help) {
          homePage.helpWindow();
        } else if (settings) {
          homePage.settingsWindow();
          if (resetting) {
            client.resetWindow();
          }
        } else if (passwording) {
          client.passwordWindow();
        } else if (debugging) {
          homePage.debugWindow();
        }
      } else {
        client.quitWindow();
      }
    }
  } else if (selecting) {
    gameSelect.display();

    gameSelect.hover();
  } else if (inGame) {
    if (!gameLoaded) {
      game.load();
    } else {
      game.drawBackground();
      
      if (modeSelected == 0 || modeSelected == 2) {
        map.display();
        map.collide();
      }
      
      powerUp.spawn();
      if (powerSpawned) powerUp.display();
      if (powerSpawned) powerUp.collide();
      
      game.display();
      if (gameTimeout == 0 && !displayingMenu) {
        game.score();
        game.bounceOff();
        game.flag();
        game.tag();
        game.movePlayers();
      }
      game.update();

      if (p2Timeout == 0 && modeSelected == 1 && !displayingMenu) game.runAi();

      menu.display();

      if (!quitting) {
        menu.hover();
      } else if (quitting) {
        client.quitWindow();
      }
    }
  } else if (gameFinished) {
    gameOver.display();

    if (!quitting) {
      gameOver.hover();
    } else {
      client.quitWindow();
    }
  }
}

void mouseReleased() {
  if (atHome) {
    if (gameIntro) {
      homePage.skipIntro();
    } else {
      if (!quitting && !help && !settings && !passwording && !debugging) {
        homePage.click();
      } else if (mouseX >= width / 2 - 90 && mouseX <= width / 2 - 30 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55 && quitting || mouseX >= width / 2 + 30 && mouseX <= width / 2 + 90 && mouseY >= height / 2 + 25 && mouseY <= height / 2 + 55 && quitting) {
        client.confirmQuit();
      } else if (help) {
        homePage.helpClick();
      } else if (settings) {
        if (!resetting) {
          homePage.settingsClick();
        } else {
          client.confirmReset();
        }
      } else if (passwording) {
        client.passwordClick();
      } else if (debugging) {
        homePage.debugClick();
      }
    }
  } else if (selecting) {
    gameSelect.back();
    gameSelect.selectMode();
    gameSelect.changeName();
    gameSelect.changeColor();
    gameSelect.changeDifficulty();
    gameSelect.selectType();
    gameSelect.toggleFlagDrop();
    gameSelect.startGame();
  } else if (inGame) {
    if (!gameLoaded) {
      if (mouseX >= 20 && mouseX <= 60 && mouseY >= 20 && mouseY <= 60) { 
        game.exitLoad();
      }
    } else {
      if (!quitting) {
        menu.click();
      } else {
        client.confirmQuit();
      }
    }
  } else if (gameFinished) {
    if (!quitting) {
      gameOver.click();
    } else {
      client.confirmQuit();
    }
  }
}

void keyPressed() {
  if (inGame) {
    game.moveKeys();
  }
}

void keyReleased() {
  if (atHome && passwording) {
    client.typePassword();
  } else if (selecting && editingName) {
    gameSelect.typeName();
  } else if (inGame) {
    if (key == 'w' || key == 'W') {
      p1Up = false;
    } 
    if (key == 's' || key == 'S') {
      p1Down = false;
    }
    if (key == 'a' || key == 'A') {
      p1Left = false;
    }
    if (key == 'd' || key == 'D') {
      p1Right = false;
    }

    if (keyCode == UP) {
      p2Up = false;
    }
    if (keyCode == DOWN) {
      p2Down = false;
    } 
    if (keyCode == LEFT) {
      p2Left = false;
    }
    if (keyCode == RIGHT) {
      p2Right = false;
    }

    if (key == 'f' || key == 'F' || key == 'j' || key == 'J' || key == 'z' || key == 'Z' || key == 'm' || key == 'M' || key == 'c' || key == 'C' || key == 'n' || key == 'N' || key == 'x' || key == 'X' || key == 'b' || key == 'B') {
      game.playerSpells();
    }
  }
}
