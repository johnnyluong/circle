import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';

class CircleContactList extends StatefulWidget {
  final CloudDB cloudDB;
  @required
  DocumentReference circle;
  List<DocumentSnapshot> circleContacts;
  CircleContactList({this.cloudDB});

  _CircleContactListState createState() => _CircleContactListState();
}

class _CircleContactListState extends State<CircleContactList> {
  Future getCircleContacts() async {
    //TODO: add listener to listen to changes in contacts lists
    return widget.cloudDB.getCircleContacts(widget.circle);
  }

  void setCircleContacts() async {
    widget.circleContacts =
        await widget.cloudDB.getCircleContacts(widget.circle);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(widget.circleContacts.elementAt(0).data['circleContacts']));
  }
}
