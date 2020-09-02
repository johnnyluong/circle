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
    return widget.cloudDB.getCircleContacts(widget.circle);
  }

  Stream<QuerySnapshot> get circleContacts {
    final CollectionReference contactsCollection =
        widget.circle.collection('circleContacts');
    return contactsCollection.snapshots();
  }

  @override
  void initState() {
    super.initState();

    // widget.circleContacts = circleContactsTest;

    getCircleContacts().then((val) {
      setState(() {
        widget.circleContacts = val;
      });
    });

    if (widget.circleContacts == null) {
      print('CircleContacts in null');
    }
  }

  Widget build(BuildContext context) {
    if (widget.circleContacts == null) {
      print('Circle contacts list is null');
    } else {
      print('This is working now ');
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Current Circle Name TODO'),
        ),
        body: ListView.builder(
            itemCount: widget.circleContacts.length,
            itemBuilder: (context, index) {
              return Card(
                // TODO: it returns a document snapshot but needs to be a string
                child: ListTile(
                    title: Text(widget.circleContacts.length.toString())),
              );
            }));
  }
}
