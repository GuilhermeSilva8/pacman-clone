import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman_clone/enemies/clyde.dart';
import 'package:pacman_clone/enemies/pinky.dart';
import 'package:pacman_clone/player/player.dart';
import 'decorations/element.dart';
import 'enemies/blinky.dart';
import 'enemies/inky.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(keyboardDirectionalType: KeyboardDirectionalType.arrows),
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap(
          'tile/mapa.json',
          objectsBuilder: {
            'element': (properties) => ElementEat(properties.position),
            'blinky': (properties) => Blinky(properties.position),
            'pinky': (properties) => Pinky(properties.position),
            'clyde': (properties) => Clyde(properties.position),
            'inky': (properties) => Inky(properties.position),
          }
      ),
      player: MyPlayer(Vector2(32, 32)),
      showCollisionArea: false,
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
      ),
    );
  }

}
