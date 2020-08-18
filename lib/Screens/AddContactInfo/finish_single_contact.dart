import 'package:circle/components/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class FinishSingleContactScreen extends StatefulWidget {
  @override
  _FinishSingleContactScreenState createState() =>
      _FinishSingleContactScreenState();
}

class _FinishSingleContactScreenState extends State<FinishSingleContactScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Finalize Contact Details',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center, //Controls vertical center
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TEMP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Finalize contact details here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        color: kPrimaryDarkColor,
        press: () {
          /*
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MainScreen();
              },
            ),
          );
          */
        }, //Handle case of multiple entries vs single
        text: "Finish",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
