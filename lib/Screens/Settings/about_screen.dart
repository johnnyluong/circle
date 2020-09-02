import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

// ignore: must_be_immutable
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: addItemButtonColor,
        ),
        backgroundColor: primaryColor,
        title: Text(
          'About Circle',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Hi, thanks for using Circle!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'Circle was built to give young\nprofessionals a platform to organize\nand build their network as they\nprogress in their careers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          SizedBox(height: size.height * 0.01),
        ],
      ),
    );
  }
}
