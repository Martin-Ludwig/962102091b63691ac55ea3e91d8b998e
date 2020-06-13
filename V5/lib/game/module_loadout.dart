

import 'package:flutter_console/game/module.dart';

class ModuleLoadout {
  static const maxModules = 5;

  List<Module> modules;

  ModuleLoadout([List<String> moduleNames = const []]) {

  }

  Module getModuleAt(int i) => modules.elementAt(i);

  void addModuleByName(String name) {

  }

}