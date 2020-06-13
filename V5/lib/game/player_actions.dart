import 'package:flutter_console/game/player.dart';

extension PlayerActions on Player {


  /// opponent is damaged by:
  /// this.attack + modifier - opponents.defense
  int attacksPlayer(Player opponent, {int modifier = 0, bool ignoreDefense: false}) {
    int damage = 0;

    if (ignoreDefense) {
      damage = this.attack + modifier;
    } else {
      damage = this.attack + modifier - opponent.defense;

      if (damage <= 0) {
        //todo block
        //opponent.onBlock
        //player.onBlocked
      }
    }

    opponent.modifyDamagedBy(damage);
    // @todo trigger opponent.onHit();

    return damage;
  }

  int healYourself({int modifier = 0}) {
    int healing = this.healing + modifier;

    this.modifyHealedBy(healing);
    // @todo trigger this.onHeal();

    return healing;
  }

}