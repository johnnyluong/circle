import 'package:circle/Screens/AddContactInfo/view_contact.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  ContactListItem({
    Key key,
    @required this.userDocument,
    @required this.cloudDB,
  }) : super(key: key);

  final DocumentSnapshot userDocument;
  final CloudDB cloudDB;

  @override
  Widget build(BuildContext context) {
    String fullName =
        userDocument.data['firstName'] + " " + userDocument.data['lastName'];

    return Card(
      color: backgroundColor,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 2,
      child: ListTile(
        title: Text(
          fullName,
          style: TextStyle(
            fontSize: 16,
            color: primaryColor,
          ),
        ),
        subtitle: Text(
          userDocument.data['profession'],
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        dense: true,
        visualDensity: VisualDensity.compact,
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: secondaryIconColor,
          child: IconButton(
            icon: Icon(
              Icons.person,
              color: primaryIconColor,
              size: 21,
            ),
            onPressed: () {},
          ),
        ),
        trailing: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            items: <String>['Delete']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              cloudDB.deleteContact(userDocument.reference);
            },
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewContactScreen(
                isNewContact: false,
                name: fullName,
                profession: userDocument.data['profession'],
              ),
            ),
          );
        }, //TODO Route to view contact
      ),
    );
  }
}
