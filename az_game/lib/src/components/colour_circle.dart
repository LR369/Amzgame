import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ColourCircle extends CircleComponent with HasGameReference {
  ColourCircle()
      : super(
            radius: gameWidth / 4.5,
            position: Vector2(gameWidth / 2, gameHeight / 2),
            anchor: Anchor.center,
            paint: Paint()..color = Colors.white);

  @override
  void update(double dt) {
    super.update(dt);
    if (GameController.gameState == GameState.isPlaying) {
      paint = Paint()..color = GameController.currentColour;
    }
  }
}
