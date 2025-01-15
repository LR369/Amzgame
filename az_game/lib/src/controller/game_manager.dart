import 'package:az_game/game_world.dart';

class GameManager {
  // Singleton instance
  static final GameManager instance = GameManager._();
  GameManager._();

  late GameWorld currentGame;

  void restartGame() {
    currentGame = GameWorld(); // Replace the game instance with a new one
  }

  // Initialize with a game instance
  void initGame() {
    currentGame = GameWorld();
  }
}
