// Martin Ludwig
// 26.12.2019

import 'package:test/test.dart';

import 'package:flutter_console/game/player_core_model.dart';
import 'package:flutter_console/game/player.dart';

void main() {

  String name = "Test Player";
  List<String> skills = ["Skill 1", "Skill 2", "Skill 3", "Skill 4", "Skill 5"];

  Player player;
  PlayerCoreModel playerCoreModel;




  group('Player stat calculation: ', () {
    int strength = 13;
    int agility = 23;
    int intelligence = 37;

    int modifier = 49;

    playerCoreModel = PlayerCoreModel(
        name: name,
        strength: strength,
        agility: agility,
        intelligence: intelligence,
        skills: skills
    );

    print("playerCoreModel.toString() = ${playerCoreModel.toString()}");

    player = Player(
        name: name,
        strength: strength,
        agility: agility,
        intelligence: intelligence,
        skills: skills
    );

    //increase stats
    player
      ..modifyStrengthBy(modifier)
      ..modifyAgilityBy(modifier)
      ..modifyIntelligenceBy(modifier)
      ..modifyAttackBy(modifier)
      ..modifyDefenseBy(modifier)
      ..modifyInitiativeBy(modifier)
      ..modifyHealingBy(modifier)
      ..modifyHealthBy(modifier);

    test("strength", () {
      int expected = strength + modifier;
      int actual = player.strength;
      expect(expected, actual);
    });

    test("agility", () {
      int expected = agility + modifier;
      int actual = player.agility;
      expect(expected, actual);
    });

    test("intelligence", () {
      int expected = intelligence + modifier;
      int actual = player.intelligence;
      expect(expected, actual);
    });

    test("attack", () {
      int expected = 2 * (intelligence+modifier) + strength + modifier + modifier;
      int actual = player.attack;
      expect(expected, actual);
    });

    test("defense", () {
      int expected = 2 * (agility+modifier) + strength + modifier + modifier;
      int actual = player.defense;
      expect(expected, actual);
    });

    test("initiative", () {
      int expected = 2 * (agility+modifier) + intelligence + modifier + modifier;
      int actual = player.initiative;
      expect(expected, actual);
    });

    test("healing", () {
      int expected = 2 * (intelligence+modifier) + strength + modifier + modifier;
      int actual = player.healing;
      expect(expected, actual);
    });

    test("max health", () {
      int expected = 100 + (2*(strength+modifier) + agility + modifier) * 5 + modifier;
      int actual = player.health;

      print("${player.toString()}");

      expect(expected, actual);
    });

  });



}