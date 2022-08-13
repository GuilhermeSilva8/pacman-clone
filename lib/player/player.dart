import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_clone/enemies/blinky.dart';
import 'package:pacman_clone/enemies/clyde.dart';
import 'package:pacman_clone/enemies/inky.dart';

import '../enemies/pinky.dart';
import '../game.dart';

class PlayerSpriteSheet {
  
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
      'tile/pacman_sprites.png',
      SpriteAnimationData.sequenced(amount: 2,
      stepTime: 0.15,
      textureSize: Vector2(18,18),
      texturePosition: Vector2(0, 20)
      ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 20)
    ),
  );

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 0)
    ),
  );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 0)
    ),
  );

  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 42)
    ),
  );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 42)
    ),
  );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 60)
    ),
  );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 60)
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
          idleRight: idleRight,
          runRight: runRight,
          idleLeft: idleLeft,
          runLeft: runLeft,
          idleUp: idleUp,
          runUp: runUp,
          idleDown: idleDown,
          runDown: runDown
      );

}

class MyPlayer extends SimplePlayer with ObjectCollision{

  MyPlayer(Vector2 position)
      : super(position: position,
        size: Vector2(40, 40),
        animation: PlayerSpriteSheet.simpleDirectionAnimation,
        speed: 100
       ) {
            setupCollision(
                CollisionConfig(
                    collisions: [
                      CollisionArea.rectangle(
                        size: Vector2(26, 28),
                        align: Vector2(6, 2))
                    ]
                )
            );
         }

  @override
  bool onCollision(GameComponent component, bool active) {
    if(component is Blinky
    || component is Clyde
    || component is Inky
    || component is Pinky
    ) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('Fim de jogo'),
              actions: [
                TextButton(
                    onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                          return const Game();
                        }), (route) => false);
                    },
                    child: const Text('Tentar novamente'),
                )
              ],
            );
      });
    }
    return super.onCollision(component, active);
  }
}
