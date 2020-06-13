
import 'module.dart';
import 'modules/_example_module.dart';
import 'modules/attack.dart';
import 'modules/spell.dart';

abstract class Modules {

  static final Map<MODULE, Module> get = {
    MODULE.attack: Attack(),
    MODULE.spell: Spell()
  };

}

enum MODULE {
  default_,
  attack,
  spell
}