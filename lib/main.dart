import 'package:flutter/material.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/movie/movie_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OMDB',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String xmen = "X-Men";
  String avenger = "Avenger";

  @override
  Widget build(BuildContext context) {

    _read() async {
      final prefs = await SharedPreferences.getInstance();
      final key = 'name';
      final value = prefs.getString(key) ?? "";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Login"),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.only(left: 10.0, right: 10.0)),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MoviePage(keyword: xmen,)));
                },
                child: Text(xmen),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.only(left: 10.0, right: 10.0)),
            MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MoviePage(keyword: avenger,)));
                },
                child: Text(avenger),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.only(left: 10.0, right: 10.0)),
          ],
        ),
      ),
    );
  }

}