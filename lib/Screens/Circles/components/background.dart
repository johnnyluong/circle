import 'package:circle/Screens/AddContactInfo/add_info.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';
import 'package:circle/Screens/Circles/components/circle_model.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';

class Background extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final CloudDB cloudDB;
  final List<CircleModel> slides;

  const Background({
    Key key,
    @required this.slides,
    @required this.currentIndex,
    @required this.cloudDB,
    @required this.child,
  }) : super(key: key);

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Row(children: <Widget>[
      Container(
        // padding: EdgeInsets.all(50),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: isCurrentPage ? 10.0 : 6.0,
        width: isCurrentPage ? 10.0 : 6.0,
        decoration: BoxDecoration(
          color: isCurrentPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(primaryBorderRadius),
        ),
      ),
      SizedBox(
        width: 10,
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void _onButtonPressed() {
      Size size = MediaQuery.of(context).size;
      showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.065),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.28,
                  vertical: size.height * 0.1,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  //TODO: Add image upload functionality
                  'Upload Image',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              RoundedInputField(
                text: 'Circle Name',
                icon: Icons.donut_large,
                onChanged: (value) {},
              ),
              RoundedButton(
                text: 'Create Circle',
                color: kPrimaryColor,
                textColor: Colors.white,
                press: () {},
              ),
            ],
          );
        },
      );
    }

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // ToggleButton
          Positioned(
            bottom: 25,
            right: 40,
            child: FloatingActionButton(
              child: Icon(Icons.person_add),
              onPressed: () {
                _onButtonPressed();
              },
              backgroundColor: Colors.blue,
            ),
          ),
          child,
          Positioned(
            bottom: 25,
            child: Container(
              height: 65,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        SizedBox(
                          // width: 20,
                          child: currentIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
