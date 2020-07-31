import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/semantics.dart';

class ContactListScreen extends StatefulWidget {
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
  }
}

class ContactDetail extends StatefulWidget {
  final DocumentSnapshot contact;

  ContactDetail({this.contact});

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Info'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.contact.data['FirstName'] +
                  ' ' +
                  widget.contact.data['LastName'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          // SizedBox(height: size.height * 0.03), //Spacing betwen widgets
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.contact.data['JobTitle'] +
                  ' @ ' +
                  widget.contact.data['Company'],
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(
                  widget.contact.data['Tags'][0],
                  style: TextStyle(backgroundColor: Colors.purple[100]),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  widget.contact.data['Tags'][1],
                  style: TextStyle(backgroundColor: Colors.purple[100]),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: Text(
                  widget.contact.data['Tags'][2],
                  style: TextStyle(backgroundColor: Colors.purple[100]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Text(
              'Contact Info',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: Text(
              widget.contact.data['Email'],
            ),
          ),
          Container(
            child: Text(
              widget.contact.data['PhoneNumber'],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  child: Text(
                    widget.contact.data['Circles'][0],
                    softWrap: false,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple[100],
                  ),
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(30),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Text(
                    widget.contact.data['Circles'][1] +
                        'this is just a long test',
                    softWrap: false,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple[100],
                  ),
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(30),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Text(
                    widget.contact.data['Circles'][2],
                    softWrap: false,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple[100],
                  ),
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(30),
                ),
              ),
            ],
          ),
        ],
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
