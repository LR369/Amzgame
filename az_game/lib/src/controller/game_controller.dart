import 'dart:math';

import 'package:az_game/src/config.dart';
import 'package:flutter/material.dart';

enum GameState { ready, gameOver, isPlaying, gameStarted }

class GameController {
  static int totalScore = 0;
  static Color currentColour = Colors.blue;
  static Color lastColour = Colors.blue;
  static GameState gameState = GameState.ready;
  static bool removeMenuOverlay = false;
  static bool showMenuOverlay = true;
  static bool showGameOverlay = false;
  static bool removeGameOverlay = false;
  static double speed = 6.0;
  static int colourChoice = 0;
  static Color colourTapped = Colors.black;
  static int score = 0;
  static bool resetSize = false;
  static int arrSize = 3;
  static bool addEffectToSlime = false;

  static void menuReset() {
    GameController.gameState = GameState.ready;
  }

  static void restart() {
    GameController.gameState = GameState.ready;
  }

  static void startGame() {
    GameController.showMenuOverlay = false;
    score = 0;
    GameController.gameState = GameState.isPlaying;
    addEffectToSlime = true;
  }

  static void gameOver() {
    GameController.gameState = GameState.gameOver;
  }

  static void checkTap() {
    if (score > 20) {
      arrSize = 7;
    }
    if (colourTapped == currentColour) {
      score += 1;
      changeColour();
      resetSize = true;
    } else {
      // gameOver();
    }
  }

  // static void changeColour() {

  //   switch (score) {
  //     case 20:
  //   }
  //   //
  // }
  static void changeColour() {
    int rand = Random().nextInt(arrSize);
    switch (score) {
      case 0:
        {}
      case 15:
        {
          speed += 1;
        }
      case 20:
        {
          speed += 1;
        }
      case 25:
        {
          speed += 1;
        }
      case 30:
        {
          speed += 1;
        }

      default:
    }
    colourChoice = rand;
    currentColour = slimeColors[rand];
  }

  //static void resetSize() {}
}
