import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class StartGameButton extends SpriteComponent
    with TapCallbacks, HasGameReference {
  final void Function() onPressed;
  StartGameButton({required this.onPressed})
      : super(size: Vector2(120, 50), position: Vector2(190, 700));

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    sprite = await game.loadSprite("Button_green.png");
    add(TextComponent(
        text: "Start Game",
        textRenderer: TextPaint(
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        position: size / 2));
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    // Show the conundrum overlay when button is tapped
    game.overlays.add('conundrum');
  }
}
