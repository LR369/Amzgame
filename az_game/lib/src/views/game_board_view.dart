import 'dart:async';

import 'package:az_game/src/components/circle_row.dart';
import 'package:az_game/src/components/colour_circle.dart';
import 'package:az_game/src/components/components.dart';
import 'package:az_game/src/components/line_view.dart';
import 'package:az_game/src/components/slime.dart';
import 'package:az_game/src/config.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:az_game/src/ui/hud.dart';
import 'package:flame/components.dart';

class GameBoardView extends PositionComponent with HasGameReference {
  CircleRow topRow = CircleRow();
  CircleRow bottomRow = CircleRow();
  late Slime player;

  bool playerAdded = false;
  @override
  Future<void> onLoad() async {
    add(PlayArea());
    add(ColourCircle());

    add(LineView()..position = Vector2(0, 200));

    add(LineView()..position = Vector2(0, gameHeight / 1.17));
    topRow = CircleRow();
    topRow.position = Vector2(0, 90);
    add(topRow);
    bottomRow = CircleRow();
    bottomRow.formationNo = 1;
    bottomRow.position = Vector2(0, gameHeight - 110);
    add(bottomRow);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (GameController.gameState != GameState.gameOver) {
      if (playerAdded) return;
      playerAdded = true;
      player = Slime();

      add(player);
    } else if (GameController.gameState == GameState.gameOver) {
      if (playerAdded) {
        remove(player);
        playerAdded = false;
      }
    }
  }
}
