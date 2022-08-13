import 'package:bonfire/bonfire.dart';

class ElementSpriteSheet {
  static Future<Sprite> get element => Sprite.load(
    'tile/pacman_sprites.png',
    srcPosition: Vector2(0, 180),
    srcSize: Vector2(10, 10),
  );
}