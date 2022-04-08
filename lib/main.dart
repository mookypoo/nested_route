import 'package:flutter/material.dart';
import 'package:nested_bottom_sheet/nav_keys.dart';
import 'package:nested_bottom_sheet/your_colors_page.dart';
import 'package:provider/provider.dart';

import 'color_provider.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavKeys.mainAppNav,
      onGenerateRoute: (RouteSettings route) {
        if (route.name == YourColorPage.routeName) {
          return MaterialPageRoute(
            builder: (BuildContext context) => ChangeNotifierProvider(
              create: (_) => ColorProvider(),
              child: YourColorPage(),
            ),
            settings: RouteSettings(name: YourColorPage.routeName),
          );
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        );
      },
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("push to next page"),
          onPressed: () async => await NavKeys.mainAppNav.currentState?.pushNamed(YourColorPage.routeName),
        ),
      )
    );
  }
}

class YourColorPage extends StatelessWidget {
  const YourColorPage({Key? key}) : super(key: key);
  static const String routeName = "/yourColorPage";

  @override
  Widget build(BuildContext context) {
    print("colors page");
    return Navigator(
      key: NavKeys.colorNav,
      onGenerateRoute: (RouteSettings route) {
        if (route.name == ColorPage2.routeName) {
          return MaterialPageRoute(
            settings: RouteSettings(name: ColorPage2.routeName),
            builder: (_) => ColorPage2(),
          );
        }
        return MaterialPageRoute(
          builder: (_) => ColorPage(),
        );
      },
    );
  }
}

