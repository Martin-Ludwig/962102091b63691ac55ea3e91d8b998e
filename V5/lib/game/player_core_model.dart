// Martin Ludwig
// 26.12.2019

import 'package:meta/meta.dart';


class PlayerCoreModel {

  ///Player's name
  final String name;

  //Strength, agility and intelligence are the main attributes a player has.
  ///base strength (Str)
  final int strength;

  ///base agility (Agi)
  final int agility;

  ///base intelligence (Int)
  final int intelligence;

  final List<String> skills;

  // Determines how much health one point in vitality gives.
  // vitality = 2*Str + Agi
  static const int vitalityMultiplier = 5;

  //Base health every player starts with.
  static const int health_base = 100;

  PlayerCoreModel({
    @required this.name,
    @required this.strength,
    @required this.agility,
    @required this.intelligence,
    @required this.skills
  });

  ///attack = 2*Int + Str
  int get attack => 2 * intelligence + strength;

  ///defense = 2*Agi + Str
  int get defense => 2 * agility + strength;

  ///initiative = 2*Agi + Int
  int get initiative => 2 * agility + intelligence;

  ///healing = 2*Int + Str
  int get healing => 2 * intelligence + strength;

  ///health = health_base + (2*Str + Agi)*vitalityMultiplier
  int get health => health_base + (2*strength + agility) * vitalityMultiplier;

  String getSkillNameAt(int i) => skills.elementAt(i);

  String toString() {
    return "$name, ${health}hp, $strength/$agility/$intelligence, ${skills.toString()}";
  }
}