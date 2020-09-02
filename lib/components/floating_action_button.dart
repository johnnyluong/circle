import 'package:circle/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFloatingActionButton extends StatefulWidget {
  String text;
  Function press;
  Color color, textColor;
  bool enabled;

  CustomFloatingActionButton({
    Key key,
    this.text,
    this.press,
    this.color = primaryColor,
    this.textColor = primaryTextColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: widget.enabled ? widget.press : null,
      backgroundColor: widget.enabled ? widget.color : kPrimaryLightColor,
      label: Text(
        widget.text,
        style: TextStyle(color: widget.textColor),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(primaryBorderRadius)),
    );
  }
}