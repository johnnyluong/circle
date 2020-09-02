import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/contact_list_item.dart';
import 'package:circle/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactList extends StatefulWidget {
  const ContactList({
    Key key,
    @required this.cloudDB,
  }) : super(key: key);

  final CloudDB cloudDB;

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    final contacts = Provider.of<QuerySnapshot>(context);
    List<DocumentSnapshot> contactDocList;
    int length;
    try {
      contactDocList = contacts.documents;
    } catch (e) {
      print("Contact List Screen was rebuilt; No database updates");
    }

    if (contactDocList != null) {
      length = contactDocList.length;
    } else {
      length = 0;
    }

    if (length == 0) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "You do not have any contacts yet.",
          textAlign: TextAlign.center,
          style: TextStyle(color: kPrimaryLightColor),
        ),
      );
    } else {
      return Container(
        child: ListView.builder(
          itemCount:
              length, //contactDocList != null ? contactDocList.length : 0,
          itemBuilder: (context, index) {
            return ContactListItem(
              userDocument: contactDocList[index],
              cloudDB: widget.cloudDB,
            );
          },
          //separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      );
    }
  }
}
