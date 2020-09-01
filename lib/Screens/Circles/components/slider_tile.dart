import 'package:circle/Screens/Circles/components/circle_contact_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/Screens/Circles/components/background.dart';
import 'package:circle/constants.dart';
import 'package:circle/Screens/Circles/components/circle_model.dart';

class SliderTile extends StatelessWidget {
  final CloudDB cloudDB;
  List<DocumentSnapshot> currentScreenCircles;
  List<DocumentSnapshot> allCircles;
  int currentIndex;
  List<CircleModel> slides;
  SliderTile(
      {this.cloudDB,
      this.currentScreenCircles,
      this.allCircles,
      this.currentIndex,
      this.slides});

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      slides: slides,
      currentIndex: currentIndex,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: currentScreenCircles.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.3),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CircleContactList(
                        circle: currentScreenCircles.elementAt(index).reference,
                        cloudDB: cloudDB,
                      );
                    },
                  ),
                );

                // print(cloudDB.getCircleContacts(circle))
                // On tap to be implemented
              },
              child: Container(
                height: 20,
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
        ],
      ),
    );
  }
}
