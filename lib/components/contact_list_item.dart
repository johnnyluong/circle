import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactListItem extends StatelessWidget {
  var index;

  ContactListItem({
    Key key,
    @required this.list,
    @required this.index,
    @required this.cloudDB,
  }) : super(key: key);

  final AsyncSnapshot<dynamic> list;
  final CloudDB cloudDB;

  void _popupDialog(BuildContext context, String fullName, dynamic contact) {
    showDialog(
        context: context,
        builder: (context) {
          return ContactAlertDialog(
            fullName: fullName,
            contact: contact,
            cloudDB: cloudDB,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String fullName = list.data[index].data['firstName'] +
        " " +
        list.data[index].data['lastName'];
    return ListTile(
      title: Text(
        fullName,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        list.data[index].data['profession'],
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        Icons.person,
        size: 28,
      ),
      trailing: Icon(Icons.menu),
      onTap: () {},
      onLongPress: () {
        _popupDialog(context, fullName, list.data[index]);
      }, //Add drop down menu button
    );
  }
}

class ContactAlertDialog extends StatelessWidget {
  const ContactAlertDialog({
    Key key,
    @required this.fullName,
    @required this.cloudDB,
    @required this.contact,
  }) : super(key: key);

  final String fullName;
  final CloudDB cloudDB;
  final DocumentSnapshot contact;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Contact"),
      content: Text(
        "Do you want to remove " + fullName + " from your contacts list?",
      ),
      actions: [
        FlatButton(
            onPressed: () {
              cloudDB.deleteContact(contact.reference);
              Navigator.of(context).pop();
            },
            child: Text("yes")),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("no")),
      ],
    );
  }
}
