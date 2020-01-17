import 'package:core/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/screens/home_screen.dart';
import 'package:flutter_app/movie/movie_screen.dart';
import 'package:flutter_app/session.dart';
import 'package:flutter_app/util/locale.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'login/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = Session();
    String primaryFont = 'Helvetica';

    return MaterialApp(
      title: APP_NAME,
      locale: Locale("id"),
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', ''), const Locale('id', '')],
      theme: ThemeData(
        fontFamily: primaryFont,
        primaryColor: Color(primaryColor),
        accentColor: Color(accentColor),
        canvasColor: Color(canvasColor),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(
          title: TextStyle(
              fontSize: 18.0, color: Colors.white, fontFamily: primaryFont),
        )),
        primaryIconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      routes: {
        '/': (ctx) => FutureBuilder<bool>(
              future: session.getBooleanSessionValue(SESSION_IS_LOGIN),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == false) {
                  return LoginScreen();
                } else {
                  return HomeScreen();
                }
              },
            ),
        '/movie': (ctx) => MovieScreen()
      },
    );
  }
}
