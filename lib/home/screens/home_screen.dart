import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/view/custom_button.dart';

import '../../session.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final session = Session();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          button("xmen", "x-men", "/movie", context),
          button("avenger", "avenger", "/movie", context),
          CustomButton(
            text: "Logout",
            marginLeft: 5.0,
            marginTop: 10.0,
            marginRight: 5.0,
            matchParent: true,
            onPressed: () {
              session.logout();
              Navigator.of(context).pushNamed("/");
            },
          ),
        ],
      ),
    );
  }

  Widget button(String text, String keyword, String routeName, BuildContext ctx) {
    return CustomButton(
      text: text,
      marginLeft: 5.0,
      marginTop: 10.0,
      marginRight: 5.0,
      matchParent: true,
      onPressed: () {
        Navigator.of(ctx)
            .pushNamed(routeName, arguments: {'keyword': keyword});
      },
    );
  }
}
