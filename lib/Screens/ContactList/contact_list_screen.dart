import 'package:circle/Screens/ContactList/contact_detail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:circle/constants.dart';
import 'package:circle/Screens/Home/add_contact.dart';

// Builds the contact list screen that displays all the users' contacts
class ContactListScreen extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactListScreen> {
  Future getContacts() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('contacts').getDocuments();
    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot contact) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (dontext) => ContactDetail(
                  contact: contact,
                )));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'My Network',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContact()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: getContacts(),
          builder: (_, snapshot) {
            // Display contact list
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('Loading ... '),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].data['FirstName'] +
                        ' ' +
                        snapshot.data[index].data['LastName']),
                    onTap: () => navigateToDetail(snapshot.data[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            }
          },
        ),
      ),
    );
  }
}
