import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import 'package:flutter/material.dart';

import 'dart:async';

class LineView extends RectangleComponent with CollisionCallbacks {
  //words here which are draggable

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    Anchor.center;
    //position = Vector2(0, gameHeight / 1.3);
    size = Vector2(gameWidth, 25);
    paint = Paint()..color = const Color.fromARGB(255, 111, 210, 129);
    priority = 3;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameController.gameState == GameState.isPlaying) {
      paint = Paint()..color = GameController.currentColour;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
  }
}
