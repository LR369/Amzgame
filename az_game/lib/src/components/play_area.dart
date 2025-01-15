import 'dart:async';
import 'package:az_game/game_world.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class PlayArea extends RectangleComponent with HasGameReference<GameWorld> {
  PlayArea() : super(paint: Paint()..color = const Color(0xfff2e8cf));
  // Color(0xfff2e8cf));

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}
