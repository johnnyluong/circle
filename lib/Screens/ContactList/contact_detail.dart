import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Displays the details of each contact in a separate screen
class ContactDetail extends StatefulWidget {
  final DocumentSnapshot contact;

  ContactDetail({this.contact});

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
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
