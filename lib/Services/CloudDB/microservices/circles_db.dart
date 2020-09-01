import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CirclesDB {
  final String uid;
  final CollectionReference userCircles;
  final CollectionReference users;
  CirclesDB(this.uid, this.userCircles, this.users);

  CirclesDB.fromUID(String uid)
      : this(
          uid,
          Firestore.instance
              .collection('users')
              .document(uid)
              .collection("circles"),
          Firestore.instance.collection('users'),
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
    List<DocumentSnapshot> contactReferences = allContacts.documents;
    List<DocumentSnapshot> contacts;
    contactReferences.forEach((element) async {
      DocumentReference contactDoc = users.document(element["circleContact"]);
      DocumentSnapshot contactSnapshot = await contactDoc.get();
      contacts.add(contactSnapshot);
      print(contactSnapshot["firstName"]);
    });
    return contacts;
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
      circle
          .collection("circleContacts")
          .add({"circleContact": contacts[i].path});
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
