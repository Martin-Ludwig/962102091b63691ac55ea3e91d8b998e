import 'package:flutter_console/game/module.dart';
import 'package:flutter_console/game/player.dart';

class Spell extends Module {
  get name => "Spell";
  get priority => 2;
  get skillType => ModuleType.spell;
  get description => "Spell does pewpew.";

  Spell():super.construct();

  @override
  void activate(Player user, Player opponent) {
    print("Spell pewpew");
  }
}