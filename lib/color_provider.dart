import 'dart:ui';

import 'package:flutter/foundation.dart';

class ColorProvider with ChangeNotifier {

  bool bottomSheetUp = false;

  ColorProvider(){
    print("color provider init");
  }

  Color color = Color.fromRGBO(224, 76, 76, 1.0);

  List<Color> colorList = [
    Color.fromRGBO(224, 76, 76, 1.0),
    Color.fromRGBO(245, 155, 124, 1.0),
    Color.fromRGBO(250, 253, 15, 1.0),
    Color.fromRGBO(0, 255, 0, 1.0),
  ];

  void bottomSheet(){
    this.bottomSheetUp = !this.bottomSheetUp;
    this.notifyListeners();
  }

  void changeColor(Color c){
    this.color = c;
    this.notifyListeners();
  }
}