import 'package:az_game/game_world.dart';
import 'package:az_game/src/controller/game_controller.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final GameWorld game;

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 400,
          width: 300,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 61, 54, 240),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SLIME TAP',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('MainMenu');

                    GameController.startGame();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteTextColor,
                  ),
                  child: const Text(
                    'Go',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: blackTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '''Don't let the black hole grow! First tap the correct colour to match the circle it is inside 
and then tap the slime back again. .
How many point can you get? And keep it contained!''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
