import 'dart:async';
import 'package:az_game/src/components/components.dart';
import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:az_game/src/ui/hud.dart';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameWorld extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents, TapDetector {
  GameWorld()
      : super(
            camera: CameraComponent.withFixedResolution(
                width: gameWidth, height: gameHeight));

  double get width => size.x;
  double get height => size.y;

  @override
  Color backgroundColor() => const Color.fromARGB(255, 62, 61, 59);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewport.add(GameBoardView());
    camera.viewport.add(HUD());
    // world.add(HUD());

    //debugMode = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    print(GameController.gameState);
  }

  void addGameOverOverlay() {
    overlays.add('GameOver');
  }

  void addMenuOverlay() {
    overlays.add('MainMenu');
  }

  void removeMenuOverlay() {
    overlays.add('MainMenu');
  }

  void removeGameOverOverlay() {
    overlays.add('GameOver');
  }
}
