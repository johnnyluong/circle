import 'package:circle/Screens/AddContactInfo/add_info.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/contact_list_item.dart';
import 'package:circle/constants.dart';
import 'package:flutter/material.dart';
import 'package:circle/Screens/Circles/components/sample_contact_info.dart';

// Builds the contact list screen that displays all the users' contacts
class SampleCircleListScreen extends StatelessWidget {
  List<SampleContact> sampleContacts = [
    SampleContact(name: 'Rui Maki', title: 'Product Manager'),
    SampleContact(name: 'Troy Anderson', title: 'Engineering Manager'),
    SampleContact(name: 'Michael Schwartz', title: 'Designer'),
    SampleContact(name: 'Michelle Wan', title: 'Designer'),
    SampleContact(name: 'Johnny Luong', title: 'Developer'),
    SampleContact(name: 'Jason Guo', title: 'Developer'),
    SampleContact(name: 'Tejas Advait', title: 'Developer'),
    SampleContact(name: 'Evan Wang', title: 'Developer'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'RISE',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: ListView.builder(
        itemCount: sampleContacts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(
                sampleContacts[index].name,
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                sampleContacts[index].title,
                style: TextStyle(fontSize: 12),
              ),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(
                Icons.person,
                size: 28,
              ),
              trailing: Icon(Icons.menu),
            ),
          );
        },
      ),
    );
  }
}

/*



Container(
        child: ListView.separated(
          itemCount: 7,
          itemBuilder: (_, index) {
            return ContactListItem(
              list: snapshot,
              index: index,
              cloudDB: widget.cloudDB,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),


*/
