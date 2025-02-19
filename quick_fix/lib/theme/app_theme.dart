import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.pink,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorTheme.length,
            'Color debe de esta en el rango de 0 a 6 and ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorTheme[selectedColor]);
  }
}
