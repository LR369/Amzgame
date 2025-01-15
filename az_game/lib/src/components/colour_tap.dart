import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class ColourTap extends CircleComponent with TapCallbacks {
  ColourTap({required this.currentColor, required Vector2 position})
      : super(
            radius: gameWidth / 10.5,
            position: position,
            anchor: Anchor.center,
            paint: Paint()..color = currentColor);

  bool _beenPressed = false;
  final Color currentColor;
  bool isHidden = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (!isHidden) {}
  }

  @override
  void onTapUp(event) {
    _beenPressed = false;
    print(currentColor);
    // GameController.colourTapped = currentColor;
    // print("Tapped");
    // print(GameController.colourTapped);
    // print(GameController.currentColour);
  }

  @override
  void onTapDown(event) {
    _beenPressed = true;

    // check colour change size
    print(currentColor);
    GameController.colourTapped = currentColor;
    print("Tapped");
    print(GameController.colourTapped);
    print(GameController.currentColour);
  }

  @override
  void onTapCancel(event) {
    _beenPressed = false;
  }
}
