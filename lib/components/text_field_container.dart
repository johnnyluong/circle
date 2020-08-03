import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';


class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8), //space around text
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}