import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';

import 'package:flame/components.dart';

import 'package:flutter/material.dart';

class HUD extends PositionComponent with HasGameReference {
  late TextComponent scoreText;

  HUD() : super(priority: 20);

  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    position = game.size / 2;
    scoreText = TextComponent(
      priority: 20,
      text: 'Score: ${GameController.score}',
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      // size: Vector2(300, 300),
      anchor: Anchor.center,
      // position: Vector2(gameWidth / 2, gameHeight / 2),
    );
    add(scoreText);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameController.gameState == GameState.isPlaying) {
      scoreText.text = 'Score: ${GameController.score}';
    }
  }
}
