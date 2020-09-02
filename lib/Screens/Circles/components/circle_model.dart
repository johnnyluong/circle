import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';

class CircleModel {
  final CloudDB cloudDB;
  List<DocumentSnapshot> currentScreenCircles;
  List<DocumentSnapshot> allCircles;

  CircleModel({this.cloudDB});

  void setCircleList() async {
    allCircles = await cloudDB.getAllCircles();
  }

  List<DocumentSnapshot> getCurrentCircles() {
    return currentScreenCircles;
  }
}

Future<List<CircleModel>> getSlides(CloudDB cloudDB) async {
  List<CircleModel> slides = new List<CircleModel>();
  CircleModel circleModel = new CircleModel(cloudDB: cloudDB);

  await circleModel.setCircleList();

  int numberOfAllCircles = circleModel.allCircles.length;
  int numberOfScreens = (numberOfAllCircles / 6).ceil();


  for (int i = 0; i < numberOfScreens; i++) {
    if (i != numberOfScreens - 1) {
      circleModel.currentScreenCircles =
          circleModel.allCircles.sublist(i * 6, (i + 1) * 6);
      slides.add(circleModel);
      circleModel = new CircleModel(cloudDB: cloudDB);
      await circleModel.setCircleList();
    }
    // If the current screen is the last screen of circles (not full)
    else {
      circleModel.currentScreenCircles = circleModel.allCircles.sublist(i * 6);
      slides.add(circleModel);
      circleModel = new CircleModel();
    }
  }
  return slides;
}
