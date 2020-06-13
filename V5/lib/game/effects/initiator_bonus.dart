

import 'package:flutter_console/game/effect.dart';
import 'package:flutter_console/game/player.dart';

class InitiatorBonus extends Effect {

  @override
  String get name => "Initiator Bonus";

  String get description => "Increases Strength, Agility and Intelligence by 1.";

  @override
  EffectType get effectType => EffectType.buff;



  @override
  void onApply(Player user) {
    user.modifyStrengthBy(1);
    user.modifyAgilityBy(1);
    user.modifyIntelligenceBy(1);
  }

  @override
  void onRemove(Player user) {
    user.modifyStrengthBy(-1);
    user.modifyAgilityBy(-1);
    user.modifyIntelligenceBy(-1);
  }

}