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

/**

class ContactListScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(
            child: Text('Entry A'),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(
            child: Text('Entry B'),
          ),
        ),
      ],
    ));
  }
}




return Container(
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
            }));








return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(snapshot.data[index].data['FirstName'] +
                            ' ' +
                            snapshot.data[index].data['LastName']),
                      );
                    });




return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      child: Center(
                        child: Text(snapshot.data[index].data['FirstName'] +
                            ' ' +
                            snapshot.data[index].data['LastName']),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );


// Contact Detail State class:

return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.contact.data['FirstName'] +
              ' ' +
              widget.contact.data['LastName']),
          subtitle: Text(
            widget.contact.data['Company'],
          ),
        ),
      ),
    );



body: Container(
        child: Card(
          child: ListTile(
            title: Text(widget.contact.data['FirstName'] +
                ' ' +
                widget.contact.data['LastName']),
            subtitle: Text(
              widget.contact.data['Company'],
            ),
          ),
        ),
      ),



*/
