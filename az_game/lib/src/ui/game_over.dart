import 'package:az_game/game_world.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:az_game/src/controller/game_manager.dart';
import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  GameWorld game;

  GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            color: blackTextColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Game Over',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    GameController.restart;

                    game.overlays.remove('GameOver');

                    GameManager.instance.restartGame();
                    game.overlays.add('MainMenu');
                    //game = GameWorld();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                  ),
                  child: const Text(
                    'Play Again?',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Score: ${GameController.score}',
                style: TextStyle(
                    fontSize: 28.0, color: Color.fromARGB(255, 59, 232, 56)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
