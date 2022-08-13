import 'package:bonfire/bonfire.dart';
import 'package:pacman_clone/decorations/element_sprite_sheet.dart';
import '../game.dart';

class ElementEat extends GameDecoration with ObjectCollision{
  ElementEat(Vector2 position)
      : super.withSprite(
          sprite: ElementSpriteSheet.element,
          position: position,
          size: Vector2(10, 10),
        ) {
            setupCollision(
              CollisionConfig(
                  collisions: [
                      CollisionArea.circle(radius: 4, align: Vector2(1, 1))
                  ]
              )
            );
          }

          @override
          bool onCollision(GameComponent component, bool active) {
            if(component is Player) {
                super.removeFromParent();
            }
            return super.onCollision(component, active);
          }
}