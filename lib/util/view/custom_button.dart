import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final bool isEnable;
  final double paddingTop;
  final double paddingButtom;
  final double paddingLeft;
  final double paddingRight;
  final VoidCallback onPressed;

  CustomButton(
      {Key key,
      this.text = "",
      this.color = Colors.grey,
      this.textColor = Colors.white,
      this.isEnable = true,
      this.paddingTop = 10.0,
      this.paddingButtom = 10.0,
      this.paddingLeft = 10.0,
      this.paddingRight = 10.0,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Text(text),
        color: color,
        textColor: textColor,
        padding: EdgeInsets.only(
            bottom: paddingButtom,
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop));
  }
}
