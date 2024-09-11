import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF4861EC);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectColor;
  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0 && selectColor <= _colorThemes.length,
            "Colors must be between 0 and ${_colorThemes.length}");
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
         colorSchemeSeed: _colorThemes[selectColor],
         );
  }
}
