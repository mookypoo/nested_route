import 'package:flutter/material.dart';
import 'package:nested_bottom_sheet/color_circle.dart';
import 'package:nested_bottom_sheet/nav_keys.dart';
import 'package:provider/provider.dart';

import 'color_provider.dart';
import 'main.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key}) : super(key: key);
  static const String routeName = "/colorPage";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ColorProvider _colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Page1"),
        // once you push to another page within this nested route (using colorNav), you can't go back to the main page using back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async => await NavKeys.mainAppNav.currentState?.pushReplacementNamed(Home.routeName),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: _size.width,
            height: _size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Your Color"),
                ColorCircle(color: _colorProvider.color),
                TextButton(
                  child: Text("click to change your color"),
                  onPressed: _colorProvider.bottomSheet,
                ),
                TextButton(
                  child: Text("go to nested page"),
                  onPressed: () async => await NavKeys.colorNav.currentState?.pushNamed(ColorPage2.routeName),
                ),
              ],
            ),
          ),
          _colorProvider.bottomSheetUp ? ModalBarrier(dismissible: true, color: Colors.grey.withOpacity(0.3), onDismiss: () {
            _colorProvider.bottomSheet();
          },) : Container(),
          _colorProvider.bottomSheetUp ? ColorBottomSheet(colorProvider: _colorProvider) : Container(),
        ],
      ),
    );
  }
}

class ColorBottomSheet extends StatelessWidget {
  const ColorBottomSheet({Key? key,required this.colorProvider}) : super(key: key);
  final ColorProvider colorProvider;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0.0,
      child: Container(
        color: Colors.white,
        width: _size.width,
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.colorProvider.colorList.length,
          itemBuilder: (_, int index) => ColorCircle(
            color: this.colorProvider.colorList[index],
            onTap: this.colorProvider.changeColor,
          ),
        ),
      ),
    );
  }
}

class ColorPage2 extends StatelessWidget {
  const ColorPage2({Key? key}) : super(key: key);
  static const String routeName = "/colorPage2";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    ColorProvider _colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("color page 2"),),
      body: Container(
        width: _size.width,
        height: _size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You can still access your color provider"),
            Text("Your Color"),
            ColorCircle(color: _colorProvider.color),
          ],
        ),
      ),
    );
  }
}

