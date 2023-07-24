import 'package:flutter/material.dart';

const Color _cumstomColor = Color.fromARGB(255, 20, 76, 159);

const List<Color> _colorThemes =[
  _cumstomColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme{

  final int selectedColor;

  AppTheme({
    this.selectedColor=0
  }): assert(selectedColor >=0 && selectedColor<=_colorThemes.length-1,'Colors must be between 0 and ${_colorThemes.length}' );


  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
}