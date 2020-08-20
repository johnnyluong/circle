import 'package:circle/constants.dart';
import 'package:flutter/material.dart';

class StandardInfoInput extends StatelessWidget {
  const StandardInfoInput({
    Key key,
    @required this.hintText,
    this.validator,
    @required this.onSaved,
    this.icon,
    this.keyboardType,
  }) : super(key: key);

  final String hintText;
  final Function(String) validator;
  final Function(String) onSaved;
  final IconData icon;
  final TextInputType keyboardType;

  //Values to adjust text field size
  final double _iconSize = 18.0;
  final double _fontSize = 16.0;
  final double _verticalPadding = 8.0;
  final double _horizontalPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: _fontSize,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryDarkColor),
          ),
          prefixIcon: Icon(
            icon,
            size: _iconSize,
            color: primaryIconColor,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
