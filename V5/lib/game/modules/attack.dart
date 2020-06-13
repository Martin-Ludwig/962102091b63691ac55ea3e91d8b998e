import 'package:flutter_console/game/module.dart';
import 'package:flutter_console/game/player.dart';
import 'package:flutter_console/game/player_actions.dart';
import 'package:flutter_console/models/game_log.dart';

class Attack extends Module {

  Attack():super.construct(
      name: "Attack",
      priority: 4,
      moduleType: ModuleType.attack,
      description: "Attack!"
  );

  @override
  void activate(Player user, Player opponent) {

    int damage = user.attacksPlayer(opponent);
    GameLog().log("${user.name} hits ${opponent.name} for $damage using $name.");
  }

}