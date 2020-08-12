import 'package:circle/components/rounded_button.dart';
import 'package:circle/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CirclesScreen extends StatefulWidget {
  @override
  _CirclesScreenState createState() => _CirclesScreenState();
}

class _CirclesScreenState extends State<CirclesScreen> {
  Future getCircles() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('My Circles').getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'My Circles',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () => _onButtonPressed(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          // width: size.width,
          // height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,

                        child: Text('Mountainers', textAlign: TextAlign.center),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Text('Less boring 1'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        // width: size.width / 2,
                        child: Text('Less boring 2'),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.all(25.0),
                        padding: EdgeInsets.all(40.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.065),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.28,
                vertical: size.height * 0.1,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                //TODO: Add image upload functionality
                'Upload Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            RoundedInputField(
              text: 'Circle Name',
              icon: Icons.donut_large,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'Create Circle',
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            ),
          ],
        );
      },
    );
  }
}

/*
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

*/

/*

body: Container(
        width: double.infinity,
        height: size.height,
        child: FutureBuilder(
          future: getCircles(),
          builder: (_, snapshot) {
            // Display circles
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text('Loading ... '),
              );
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(snapshot.data[index].data['Circle'][index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            }
          },
        ),
      ),



*/

/*

Original

Stack(
          alignment: Alignment.center, //Controls vertical center
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Circles',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'This screen will contain the\n various Circles the user has.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),

*/

/*

Container(
              height: size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,
                      child: Text('Less boring 2'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,
                      child: Text('Less boring 2'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,
                      child: Text('Less boring 2'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),


            */

/*


Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,

                      child: Container(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 20,
                            minHeight: 20,
                            minWidth: 30,
                            maxWidth: 30,
                          ),
                          child: AutoSizeText(
                            'Your Text and this is just to see how long it could be',
                          ),
                        ),
                      ),

                      // child: Text('Hello this is just a test only'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,
                      child: Text('Less boring 2'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,
                      child: Text('Less boring 2'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Text('Less boring 1'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // width: size.width / 2,
                      child: Text('Less boring 2'),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      margin: EdgeInsets.all(25.0),
                      padding: EdgeInsets.all(40.0),
                    ),
                  ),
                ],
              ),
            ),



*/
