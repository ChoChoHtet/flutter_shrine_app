import 'package:flutter/material.dart';
import 'package:flutter_shrine/home.dart';
import 'package:flutter_shrine/login/login_page.dart';
import 'colors.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shrine',
        home: HomePage(),
        theme: _buildShrineTheme(),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/homepage': (context) => HomePage()
        }
//      onGenerateRoute: _getRoute,
        );
  }

  Route<dynamic> _getRoute(RouteSettings routeSettings) {
    if (routeSettings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true);
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    textTheme: _buldShrineTextTheme(base.textTheme),
    primaryTextTheme: _buldShrineTextTheme(base.textTheme),
    accentTextTheme: _buldShrineTextTheme(base.textTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrinePink100,
        colorScheme: base.colorScheme.copyWith(secondary: kShrineBrown900)),
    buttonBarTheme: base.buttonBarTheme.copyWith(buttonTextTheme: ButtonTextTheme.accent),
    //override parent accent color
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2,color: kShrineBrown900)),
      border: OutlineInputBorder(),
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,

  );
}

TextTheme _buldShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline5: base.headline5.copyWith(
            fontWeight: FontWeight.w500,
          ),
          headline6: base.headline6.copyWith(fontSize: 18),
          caption:
              base.caption.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          bodyText1: base.bodyText1
              .copyWith(fontWeight: FontWeight.w500, fontSize: 16))
      .apply(
          fontFamily: 'Rubik',
          displayColor: kShrineBrown900,
          bodyColor: kShrineBrown900);
}
