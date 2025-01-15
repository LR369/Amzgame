import 'package:az_game/game_world.dart';
import 'package:az_game/src/controller/game_manager.dart';
import 'package:az_game/src/ui/game_over.dart';
import 'package:az_game/src/ui/main_menu.dart';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameWorldPage extends StatelessWidget {
  const GameWorldPage({super.key});
  //final GameWorld game = GameWorld();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      GameWidget<GameWorld>.controlled(
        gameFactory: GameWorld.new,

        overlayBuilderMap: {
          'MainMenu': (_, game) => MainMenu(
                game: game,
              ),
          'GameOver': (_, game) => GameOver(game: game),
        },
        initialActiveOverlays: const ['MainMenu'],

        // },
      )
    ]));
  }
}
