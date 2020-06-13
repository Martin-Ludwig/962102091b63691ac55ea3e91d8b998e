// Martin Ludwig
// 26.12.2019


//todo: translating names,
//see: mixin ModuleNameIntl
//usage: class Spell extends Module with ModuleNameIntl

import 'modules.dart';
import 'player.dart';

abstract class Module {
  final String name;
  ///The lower the number, the more priority the skill has.
  final int priority;
  final ModuleType moduleType;
  final String description;

  // construct is used by the inherited classes.
  Module.construct({
    this.name = "Default Module",
    this.priority = 1,
    this.moduleType = ModuleType.untyped,
    this.description = "No description given."
  });

  // Module is used to access modules by enum or int
  factory Module(MODULE module) {
    return Modules.get[module];
  }

  void activate(Player user, Player opponent);

  String toString() {
    return "$name ($priority*), Type: $moduleType\n\t$description";
  }

}

//inspiration: https://wiki.guildwars.com/wiki/Skill_type
enum ModuleType {
  untyped,
  attack,
  spell
}





//// @ModuleNameI18n
//maybe useful for translating
//mixin ModuleNameI18n on Module {
//  get name => "translation $runtimeType";
//
//  //todo: remove ?
//  String toString() {
//    return "ModuleNameI18n.toString(): $name $priority* $runtimeType";
//  }
//}