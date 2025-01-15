import 'dart:async';

import 'package:az_game/src/components/colour_tap.dart';
import 'package:az_game/src/config.dart';
import 'package:flame/components.dart';

class CircleRow extends PositionComponent {
  int formationNo = 0;
  final List<ColourTap> circleArray = [];
  var tileOffset = (gameWidth / 10.5) * 2.2;
  CircleRow();

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    if (formationNo == 0) {
      setUpColoursTop();
    } else {
      setUpRowBot();
    }
  }

  void setUpColoursTop() {
    ColourTap circleOne = ColourTap(
        currentColor: slimeColors[0],
        position: Vector2(gameWidth / 10.5 + 5, 10));
    add(circleOne);
    circleArray.add(circleOne);

    ColourTap circleTwo = ColourTap(
        currentColor: slimeColors[1],
        position: Vector2((gameWidth / 2) - (tileOffset / 1.5), 10));
    add(circleTwo);
    circleArray.add(circleTwo);
    ColourTap circlethree = ColourTap(
        currentColor: slimeColors[2],
        position: Vector2(gameWidth / 2 + (tileOffset / 2), 10));
    add(circlethree);
    circleArray.add(circlethree);
    ColourTap circlefour = ColourTap(
        currentColor: slimeColors[3],
        position: Vector2(gameWidth - (tileOffset / 2), 10));
    add(circlefour);
    circleArray.add(circlefour);
  }

  void setUpRowBot() {
    ColourTap circleOne = ColourTap(
        currentColor: slimeColors[4],
        position: Vector2(gameWidth / 10.5 + 5, 10));
    add(circleOne);
    circleArray.add(circleOne);

    ColourTap circleTwo = ColourTap(
        currentColor: slimeColors[5],
        position: Vector2((gameWidth / 2) - (tileOffset / 1.5), 10));
    add(circleTwo);
    circleArray.add(circleTwo);
    ColourTap circlethree = ColourTap(
        currentColor: slimeColors[6],
        position: Vector2(gameWidth / 2 + (tileOffset / 2), 10));
    add(circlethree);
    circleArray.add(circlethree);
    ColourTap circlefour = ColourTap(
        currentColor: slimeColors[7],
        position: Vector2(gameWidth - (tileOffset / 2), 10));
    add(circlefour);
    circleArray.add(circlefour);
  }
}
