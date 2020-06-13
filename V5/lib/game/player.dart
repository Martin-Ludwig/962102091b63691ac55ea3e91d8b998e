// Martin Ludwig
// 26.12.2019
//
// Player Game Design choices:
// Health is unlimited (in range of dart's integer), thus no max health exists.
// Barrier functions as a second health. It takes first damage, before
// life. Barrier is limited to 50% of current health. In the end only
// the highest life number wins. Barrier is not considered for this.


import 'package:flutter/cupertino.dart';
import 'package:flutter_console/game/effect.dart';
import 'package:flutter_console/game/module_loadout.dart';
import 'package:flutter_console/models/game_log.dart';
import 'package:meta/meta.dart';

import 'package:flutter_console/game/player_core_model.dart';


class Player extends PlayerCoreModel {
  int _experience;

  ModuleLoadout _modules;

  //helper variables to calculate health in fight
  int _damaged = 0;
  int _healed = 0;
  int _barrier = 0;

  ///Active and temporary buffs and de-buffs.
  List<Effect> _effects = [];

  //stat modifiers
  int _strengthModifier = 0;
  int _agilityModifier = 0;
  int _intelligenceModifier = 0;

	int _attackModifier = 0;
	int _defenseModifier = 0;
	int _initiativeModifier = 0;
	int _healingModifier = 0;
	int _healthModifier = 0;

	Player({
    @required name,
    @required strength,
    @required agility,
    @required intelligence,
    @required skills,
    level: 0
  }):super(
      name: name,
      strength: strength,
      agility: agility,
      intelligence: intelligence,
      skills: skills
  ) {
	  _experience = levelToExp(level);

  }


  @override int get strength => super.strength + level + _strengthModifier;
  @override int get agility => super.agility + level + _agilityModifier;
  @override int get intelligence => super.intelligence + level + _intelligenceModifier;

  @override int get attack => super.attack + _attackModifier ;
  @override int get defense => super.defense + _defenseModifier;
  @override int get initiative => super.initiative + _initiativeModifier;
  @override int get healing => super.healing + _healingModifier;
  @override int get health => super.health + _healthModifier - _damaged + _healed;

  int get barrier => _barrier;

  void modifyStrengthBy(int i) => _strengthModifier += i;
  void modifyAgilityBy(int i) => _agilityModifier += i;
  void modifyIntelligenceBy(int i) => _intelligenceModifier += i;

  void modifyAttackBy(int i) => _attackModifier += i;
  void modifyDefenseBy(int i) => _defenseModifier += i;
  void modifyInitiativeBy(int i) => _initiativeModifier += i;
  void modifyHealingBy(int i) => _healingModifier += i;
  void modifyHealthBy(int i) => _healthModifier += i;

  void modifyDamagedBy(int i) => _damaged += i;
  void modifyHealedBy(int i) => _healed += i;
  void modifyBarrierBy(int i) {
    if (_barrier + i < (health ~/ 2)) {
      _barrier += i;
    } else {
      _barrier = health ~/ 2;
    }
  }

  // MODULES

  int getPriorityByRound(int round) {
    return _modules.getModuleAt(round).priority;
  }


  // EFFECTS

  void addEffect(Effect effect) {
    GameLog().log("$name gains ${effect.name}");
    _effects.add(effect);
  }

  void removeEffect(String effect) {
  }


  // EXPERIENCE AND LEVEL SYSTEM

  /// returns the level that can be reached with the amount of experience
  int expToLevel(int xp) {
    return xp ~/ 10;
  }
  /// returns the required amount of experience to reach that level
  int levelToExp(int lvl) {
    return lvl * 10;
  }
  int addExperience(int xp) {
    _experience += xp;
  }
  int get level => expToLevel(_experience);


  @override
  String toString() {
    return super.toString() + ", $attack att, $defense def, $initiative init, $healing healing";
  }
}