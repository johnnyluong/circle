import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle/Screens/Circles/components/circle_model.dart';
import 'package:circle/Screens/Home/main_screen.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/Screens/Circles/components/slider_tile.dart';

// ignore: must_be_immutable
class CirclesScreen extends StatefulWidget {
  final CloudDB cloudDB;
  List<DocumentSnapshot> circleList;
  CirclesScreen({this.cloudDB});

  @override
  _CirclesScreenState createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  List<CircleModel> slides = new List<CircleModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  String circleName;

  @override
  void initState() {
    super.initState();
    getSlides(widget.cloudDB).then((val) {
      setState(() {
        slides = val;
      });
    });
  }

  Future getCircles() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('My Circles').getDocuments();
    return qn.documents;
  }

  void setCircleList() async {
    widget.circleList = await widget.cloudDB.getAllCircles();
  }

  @override
  Widget build(BuildContext context) {
    setCircleList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'Circles',
          style: TextStyle(color: primaryTextColor),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: addItemButtonColor,
            onPressed: _onButtonPressed,
          ),
        ],
      ),
      body: Container(
      child: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        onPageChanged: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index) {
          return SliderTile(
            cloudDB: widget.cloudDB,
            currentScreenCircles: slides[index].getCurrentCircles(),
            currentIndex: currentIndex,
            slides: slides,
          );
        },
      ),
    );
  }

  void _onButtonPressed() {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      backgroundColor: backgroundColor,
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
              onChanged: (value) {
                setState(() {
                  circleName = value;
                });
              },
            ),
            RoundedButton(
              text: 'Create Circle',
              press: () {
                widget.cloudDB.addCircle(circleName);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
