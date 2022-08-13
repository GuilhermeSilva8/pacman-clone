import 'package:bonfire/bonfire.dart';

class InkySpriteSheet {

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(120, 120)
    ),
  );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(120, 120)
    ),
  );

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(80, 120)
    ),
  );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(80, 120)
    ),
  );

  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 120)
    ),
  );

  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(0, 120)
    ),
  );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(40, 120)
    ),
  );

  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
    'tile/pacman_sprites.png',
    SpriteAnimationData.sequenced(amount: 2,
        stepTime: 0.15,
        textureSize: Vector2(18,18),
        texturePosition: Vector2(40, 120)
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

class Inky extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {

  Inky(Vector2 position)
      : super(
      position: position,
      size: Vector2(32, 32),
      animation: InkySpriteSheet.simpleDirectionAnimation,
      speed: 60
  ) {
    setupCollision(
        CollisionConfig(
            collisions: [
              CollisionArea.rectangle(size: Vector2(26, 32), align: Vector2(5, 0))
            ]
        )
    );
  }

  @override
  void update(double dt) {

    seePlayer(
        observed: (player) {
          seeAndMoveToPlayer(
              closePlayer: (player) {

              },
              radiusVision: 96
          );
        },
        notObserved: () {
          runRandomMovement(dt, timeKeepStopped: 10, runOnlyVisibleInCamera: false);
        },
        radiusVision: 96
    );

    super.update(dt);
  }

}