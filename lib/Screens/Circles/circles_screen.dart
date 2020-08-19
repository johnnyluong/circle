import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';

class CirclesScreen extends StatefulWidget {
  final CloudDB cloudDB;
  List<DocumentSnapshot> circleList = new List();
  int numberOfCircles = 0;
  CirclesScreen({this.cloudDB});

  @override
  _CirclesScreenState createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  Future getCircles() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('My Circles').getDocuments();
    return qn.documents;
  }

/*
  Future<List<DocumentSnapshot>> getNumberOfCircles() async {
    List<DocumentSnapshot> circleData = await widget.cloudDB.getAllCircles();
    // print(circleData.length);
    widget.circleList = circleData;
    print(circleData);
    // return circleData.length;
    return circleData;
    // return Future.value(circleData.length);
    // var numberOfCircles = circleData.toList();
    // return numberOfCircles.length;
  }
*/

  void setNumberOfCircles() async {
    List<DocumentSnapshot> circleData = await widget.cloudDB.getAllCircles();
    widget.numberOfCircles = circleData.length;
  }

  void setCircleList() async {
    widget.circleList = await widget.cloudDB.getAllCircles();
  }

  @override
  Widget build(BuildContext context) {
    // setNumberOfCircles();
    setCircleList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'My Circles',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () => _onButtonPressed(),
          ),
        ],
      ),
      body: GridView.builder(
          // itemCount: await getNumberOfCircles(),
          itemCount: widget.circleList.length,
          // itemCount: getNumberOfCircles(),
          // itemCount: getNumberOfCircles(),
          // itemCount: widget.numberOfCircles,

          // itemCount: getCircles().toString().length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new GridTile(
                child: Text(
                  'test',
                ),
              ),
            );
          }),
    );
  }

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
}
