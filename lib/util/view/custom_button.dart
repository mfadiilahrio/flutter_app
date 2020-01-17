import 'package:core/contants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final bool isEnable;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double paddingTop;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final VoidCallback onPressed;
  final double borderRadius;
  final double elevation;
  final FontWeight fontWeight;
  final bool matchParent;
  final double fontSize;
  final Color borderColor;

  CustomButton(
      {Key key,
      this.text = "",
      this.color = const Color(primaryColor),
      this.textColor = Colors.white,
      this.isEnable = true,
      this.marginTop = 0.0,
      this.marginBottom = 0.0,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.paddingTop = 0.0,
      this.paddingBottom = 0.0,
      this.paddingLeft = 0.0,
      this.paddingRight = 0.0,
      this.onPressed,
      this.borderRadius = 5.0,
      this.elevation = 5.0,
      this.fontWeight = FontWeight.normal,
      this.matchParent = false,
      this.fontSize = 14.0,
      this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double minWidth = 70.0;
    if (matchParent) {
      minWidth = MediaQuery.of(context).size.width;
    }

    return Container(
      margin:
          EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      child: Material(
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor)),
        color: color,
        child: MaterialButton(
          minWidth: minWidth,
          padding: EdgeInsets.fromLTRB(
              paddingLeft, paddingTop, paddingRight, paddingBottom),
          onPressed: onPressed,
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize)),
        ),
      ),
    );
  }
}
