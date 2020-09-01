import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';

class CircleContactList extends StatefulWidget {
  final CloudDB cloudDB;
  final DocumentReference circle;
  List<DocumentSnapshot> circleContacts;
  CircleContactList({this.circle, this.cloudDB});

  _CircleContactListState createState() => _CircleContactListState();
}

class _CircleContactListState extends State<CircleContactList> {
  Future getCircleContacts() async {
    //TODO: add listener to listen to changes in contacts lists
    // return widget.cloudDB.getCircleContacts(widget.circle);
  }

  void setCircleContacts() async {
    widget.circleContacts =
        await widget.cloudDB.getCircleContacts(widget.circle);
    print(widget.circleContacts.elementAt(0).data['circleContact']);
    print(widget.circleContacts.length);
  }

  Widget build(BuildContext context) {
    // await setCircleContacts();

    if (widget.circleContacts == null) {
      print('Circle contacts list is null');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Current Circle Name TODO'),
        ),
        body: ListView.builder(
            // itemCount: widget.circleContacts.length,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(title: Text('ITEM PLACEHOLDER')),
              );
            }));
  }
}
