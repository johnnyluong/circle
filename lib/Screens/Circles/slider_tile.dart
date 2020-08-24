import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';

class SliderTile extends StatelessWidget {
  final CloudDB cloudDB;
  List<DocumentSnapshot> currentScreenCircles;
  SliderTile({this.cloudDB, this.currentScreenCircles});

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: currentScreenCircles.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          print('Circle pressed');
          // On tap to be implemented
        },
        child: Container(
          child: Container(
            alignment: Alignment.center,
            child: AutoSizeText(
              currentScreenCircles.elementAt(index).data['circleName'],
              maxLines: 1,
              minFontSize: 12,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[900],
            ),
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
          ),
        ),
      ),
    );
  }
}
