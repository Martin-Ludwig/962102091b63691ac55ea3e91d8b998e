import 'package:flutter_console/game/module.dart';
import 'package:flutter_console/game/player.dart';

class ExampleModule extends Module {

  ExampleModule():super.construct(
      name: "Attack",
      priority: 4,
      moduleType: ModuleType.attack,
      description: "Attack!"
  );

  @override
  void activate(Player user, Player opponent) {
    print("pewpew");
  }
}