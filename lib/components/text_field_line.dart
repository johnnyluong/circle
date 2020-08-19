import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class TextFieldLine extends StatelessWidget {
  // final Widget child;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const TextFieldLine({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
    // @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.7,
      /*
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      */
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
        ),
      ),
    );
  }
}
