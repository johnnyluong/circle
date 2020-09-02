import 'package:circle/Screens/AddContactInfo/add_info.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/contact_list.dart';
import 'package:circle/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

// Builds the contact list screen that displays all the users' contacts
class ContactListScreen extends StatefulWidget {
  final CloudDB cloudDB;
  ContactListScreen({this.cloudDB});

  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {

  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: widget.cloudDB.contacts,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text(
            'My Network',
            style: TextStyle(color: primaryTextColor),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              color: addItemButtonColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddInfo(
                      cloudDB: widget.cloudDB,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: ContactList(
          cloudDB: widget.cloudDB,
        ),
      ),
    );
  }
}
