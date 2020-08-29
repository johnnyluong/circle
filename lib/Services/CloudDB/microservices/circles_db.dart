import 'package:cloud_firestore/cloud_firestore.dart';

class CirclesDB {
  final String uid;
  final CollectionReference userCircles;
  CirclesDB(this.uid, this.userCircles);

  CirclesDB.fromUID(String uid)
      : this(
          uid,
          Firestore.instance
              .collection('users')
              .document(uid)
              .collection("circles"),
        );

  Future<DocumentReference> addCircle(String circleName) async {
    return userCircles.add({"circleName": circleName});
  }

  Future<void> renameCircle(DocumentReference circle, String newName) async {
    return circle.updateData({"circleName": newName});
  }

  Future<List<DocumentSnapshot>> getAllCircles() async {
    QuerySnapshot allCircles = await userCircles.getDocuments();
    if (allCircles.documents == null) {
      return new List();
    }
    return allCircles.documents;
  }

  Future<List<DocumentSnapshot>> getCircleContacts(
      DocumentReference circle) async {
    QuerySnapshot allContacts =
        await circle.collection("circleContacts").getDocuments();
    return allContacts.documents;
  }

  Future<DocumentSnapshot> getCircleByName(String circleName) async {
    Query query = userCircles.where("circleName", isEqualTo: circleName);
    QuerySnapshot snapshot = await query.getDocuments();
    List<DocumentSnapshot> list = snapshot.documents;
    if (list.length == 1) {
      return list[0];
    } else {
      return null;
    }
  }

  Future<void> deleteCircles(List<DocumentReference> circlesList) async {
    for (var i = 0; i < circlesList.length; i++) {
      Future<void> del = circlesList[i].delete();
      del
          .then((void _) => print("Circle deleted successfully"))
          .catchError((e) => print("Circle deletion failed."));
    }
  }

  Future<void> addContactsToCircle(
      DocumentReference circle, List<DocumentReference> contacts) async {
    for (var i = 0; i < contacts.length; i++) {
      circle.collection("circleContacts").add({"circleContact": contacts[i]});
    }
  }

  Future<void> removeContactsFromCircle(
      DocumentReference circle, List<DocumentReference> circleContacts) async {
    for (var i = 0; i < circleContacts.length; i++) {
      Future<void> del = circleContacts[i].delete();
      del
          .then((void _) => print("Contact deleted successfully"))
          .catchError((e) => print("Contact deletion failed."));
    }
  }
}
