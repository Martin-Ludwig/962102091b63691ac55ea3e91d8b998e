

import 'dart:math';

import 'package:flutter_console/game/effects/initiator_bonus.dart';
import 'package:flutter_console/game/module.dart';
import 'package:flutter_console/game/player.dart';

class AutoBattle {

  Player player;
  Player enemy;

  AutoBattle(this.player, this.enemy);

  void fight(int round) {
    List<Player> _players;

    // priority check
    if (player.getPriorityByRound(round) < enemy.getPriorityByRound(round)) {
      _players = [player, enemy];
    } else if (player.getPriorityByRound(round) < enemy.getPriorityByRound(round)) {
      _players = [enemy, player];
    } else {
      // equal priority
      // initiative check

      if (player.initiative < enemy.initiative) {
        _players = [player, enemy];
      } else if (player.initiative > enemy.initiative) {
        _players = [enemy, player];
      } else {
        // equal initiative
        // random
        Random random = new Random();
        // generate random number from 0 to 99
        int randomInt = random.nextInt(100);
        if (randomInt <= 49) {
          _players = [player, enemy];
        }

      }
    }


    // Round start

    // init bonus
    _players[0].addEffect(InitiatorBonus());

    // Initiation


    // Second Action

  }


  List<Player> sortPlayersByPriority() {

  }

  Module inctanceModuleByName(String module) {

  }

}


enum BattleResult {
  draw
}