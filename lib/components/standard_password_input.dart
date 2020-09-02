import 'package:circle/constants.dart';
import 'package:flutter/material.dart';

class StandardPasswordInput extends StatelessWidget {
  const StandardPasswordInput({
    Key key,
    @required this.hidePassword,
    @required this.hintText,
    @required this.validator,
    @required this.onSaved,
    @required this.onPressed,
  }) : super(key: key);

  final bool hidePassword;
  final String hintText;
  final Function(String) validator;
  final Function(String) onSaved;
  final Function onPressed;

  //Values to adjust text field size
  final double _iconSize = 20.0;
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
        obscureText: hidePassword,
        maxLines: 1,
        keyboardType: TextInputType.name,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: _fontSize,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          prefixIcon: Icon(
            Icons.lock,
            size: _iconSize,
            color: secondaryIconColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              size: _iconSize,
              color: hidePassword ? disabledColor : secondaryIconColor,
            ),
            onPressed: onPressed,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
