import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';

class CircleModel {
  final CloudDB cloudDB;
  List<DocumentSnapshot> currentScreenCircles;
  List<DocumentSnapshot> allCircles;

  CircleModel({this.cloudDB, this.currentScreenCircles, this.allCircles});

  void initState() async {
    allCircles = await cloudDB.getAllCircles();
  }

  void setCircleList() async {
    // cloudDB might be null???
    allCircles = await cloudDB.getAllCircles();
  }

  List<DocumentSnapshot> getCurrentCircles() {
    return currentScreenCircles;
  }
}

// This might be wrong!!
List<CircleModel> getSlides() {
  List<CircleModel> slides = new List<CircleModel>();
  CircleModel circleModel = new CircleModel();

  // This is suspicious
  // circleModel.setCircleList();

  int numberOfAllCircles = circleModel.allCircles.length;
  int numberOfScreens = (numberOfAllCircles / 6).ceil();

  for (int i = 0; i < numberOfScreens; i++) {
    // circleModel.setCircleList();
    // If the current screen is not the last screen (full screen)
    if (i != numberOfScreens - 1) {
      circleModel.currentScreenCircles =
          circleModel.allCircles.sublist(i * 6, (i + 1) * 6);
      slides.add(circleModel);
      // circleModel = new CircleModel();
    }
    // If the current screen is the last screen of circles (not full)
    else {
      circleModel.currentScreenCircles = circleModel.allCircles.sublist(i * 6);
      slides.add(circleModel);
      // circleModel = new CircleModel();
    }
  }
  return slides;
}
