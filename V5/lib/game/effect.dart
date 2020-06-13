

import 'package:flutter_console/game/player.dart';

abstract class Effect {

  final String name;
  final String description;
  final EffectType effectType;
  final EffectSubtype effectSubtype;

  Effect({
    this.name = "Default effect",
    this.description = "No description given.",
    this.effectType = EffectType.untyped,
    this.effectSubtype = EffectSubtype.untyped
  });

  //todo trigger

  void onApply(Player user) {}
  void onRemove(Player user) {}


  String toString() {
    return "$name, Type: $effectType\n\t$description";
  }
}

enum EffectType {
  untyped, buff, debuff, aura
}

enum EffectSubtype {
  untyped, condition, curse
}