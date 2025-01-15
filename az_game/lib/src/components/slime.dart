import 'dart:async';

import 'package:az_game/src/components/line_view.dart';
import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Slime extends SpriteComponent
    with HasGameReference, TapCallbacks, CollisionCallbacks {
  late Vector2 startSize;
  bool reverse = false;

  Slime()
      : super(
          position: Vector2(gameWidth / 2, gameHeight / 2),
          priority: 10,
        );
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    anchor = Anchor.center;
    sprite = await game.loadSprite('slime.png');
    size = Vector2(gameWidth / 8.5, gameWidth / 8.5);
    startSize = Vector2(gameWidth / 8.5, gameWidth / 8.5);
    paint = Paint()..color = const Color.fromARGB(255, 62, 61, 59);
    add(RectangleHitbox(size: Vector2(gameWidth / 9.5, gameWidth / 9.5)));
    //add(CircleHitbox());
    //add(addEffect(0.5));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameController.gameState != GameState.isPlaying) return;
    //if (reverse = !reverse) {
    if (GameController.addEffectToSlime) {
      add(addEffect(0.5));
      GameController.addEffectToSlime = false;
    }
    // }
    if (GameController.resetSize) {
      print("reset");
      // RemoveEffect();
      size.setFrom(startSize);
      //size = Vector2(gameWidth / 7.5, gameWidth / 7.5);
      //add(reduceEffect(1.0));
      GameController.resetSize = false;
    }
    if (GameController.gameState == GameState.gameOver) {
      if (!game.overlays.isActive('GameOver')) {
        game.overlays.add('GameOver');
      }
    }
  }

  // @override
  // void onTapUp(TapUpEvent event) {
  //   super.onTapUp(event);
  //   print("Tapped");
  // }
  @override
  void onTapUp(event) {}

  @override
  void onTapDown(event) {
    angle += 1.0;
    // check colour change size
    GameController.checkTap();
    GameController.resetSize = true;
  }

  @override
  void onTapCancel(event) {}

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    //call game over
    if (other is LineView) {
      print('Gameover');
      if (GameController.gameState != GameState.gameOver) {
        GameController.gameOver();
        //game.overlays.add('GameOver');
      }
    }
  }

  SequenceEffect addEffect(double scaleSize) {
    // final effect = ScaleEffect.by(
    //   Vector2.all(scaleSize),
    //   EffectController(duration: 5),
    // );
    // final effect = ScaleEffect.to(
    //   Vector2.all(11),
    //   EffectController(
    //     duration: 10,
    //   ),
    // );
    // final effect = SizeEffect.to(
    //   Vector2(gameWidth + 100, gameHeight + 100),
    //   EffectController(duration: 10),
    // );
    final effect = SequenceEffect([
      SizeEffect.to(
        Vector2(gameWidth + 100, gameHeight + 100),
        EffectController(duration: 10),
      ),
    ]);

    return effect;
  }

  SequenceEffect reduceEffect(double time) {
    // final effect = ScaleEffect.by(
    //   Vector2.all(scaleSize),
    //   EffectController(duration: 5),
    // );
    // final effect = SizeEffect.to(
    //   Vector2(gameWidth + 100, gameHeight + 100),
    //   EffectController(duration: 10),
    // );
    final effect = SequenceEffect([
      SizeEffect.to(
        Vector2(50, 50),
        EffectController(duration: 10),
      ),
    ]);

    // final effect = ScaleEffect.to(
    //   Vector2.all(11),
    //   EffectController(
    //     duration: 10,
    //   ),
    // );

    return effect;
  }
}
