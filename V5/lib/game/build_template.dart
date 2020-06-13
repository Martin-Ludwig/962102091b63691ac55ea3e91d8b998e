


import 'package:flutter_console/game/equipment_loadout.dart';
import 'package:flutter_console/game/module.dart';
import 'package:flutter_console/game/module_loadout.dart';

class BuildTemplate {

  int strength;
  int agility;
  int intelligence;

  EquipmentLoadout equipment;
  ModuleLoadout modules;



  Module getModuleAt(int i) => modules.getModuleAt(i);

}