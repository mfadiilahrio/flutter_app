import 'package:core/contants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/movie/movie_page.dart';
import 'package:flutter_app/session.dart';
import 'package:flutter_app/util/locale.dart';
import 'package:flutter_app/util/view/custom_button.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = Session();

    return MaterialApp(
      locale: Locale("id"),
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en', ''), const Locale('id', '')],
      theme: ThemeData(fontFamily: 'Montserrat', appBarTheme: AppBarTheme(color: Color(primaryColor))),
      home: FutureBuilder<bool>(
        future: session.getBooleanSessionValue(SESSION_IS_LOGIN),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data == false) {
            return LoginPage();
          } else {
            return MainPage();
          }
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final session = Session();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(DemoLocalizations.of(context).getText("country") ?? "Error"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomButton(
              text: DemoLocalizations.of(context).getText("xmen") ?? "Error",
              color: Color(primaryColor),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviePage(
                              keyword: "x-men",
                            )));
              },
            ),
            CustomButton(
              text: DemoLocalizations.of(context).getText("avenger") ?? "Error",
              color: Color(primaryColor),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviePage(
                              keyword: "avenger",
                            )));
              },
            ),
            CustomButton(
              text: DemoLocalizations.of(context).getText("logout") ?? "Error",
              color: Color(primaryColor),
              onPressed: () {
                session.logout();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
