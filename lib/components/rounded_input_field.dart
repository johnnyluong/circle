import 'package:flutter/material.dart';
import 'package:flutter_app/components/text_field_container.dart';
import 'package:flutter_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String text;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.text,
    this.icon = Icons.person,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon( 
            icon,
            color: kPrimaryColor,
          ),
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}