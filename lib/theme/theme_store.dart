import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'theme_store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  @observable
  ThemeMode themeMode = ThemeMode.light;

  @action
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
