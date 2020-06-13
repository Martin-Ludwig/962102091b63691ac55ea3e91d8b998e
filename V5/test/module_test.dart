import 'package:flutter/widgets.dart';
import 'package:flutter_console/game/modules.dart';
import 'package:flutter_console/game/module.dart';
import 'package:flutter_console/game/player.dart';
import 'package:flutter_console/models/game_log.dart';
import 'package:test/test.dart';


void main() {

  Player player1 = Player(name: "Player1", strength: 13, agility: 3, intelligence: 3, skills: null);
  Player player2 = Player(name: "Player2", strength: 3, agility: 3, intelligence: 3, skills: null);

  Module module = Module(MODULE.attack);

  print(player1.toString());
  print(player2.toString());

  module.activate(player1, player2);

  GameLog().log("ddd");

  final GameLog log = GameLog();
  log.log("dddd");
  print("Log size = ${log.size}");




}