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
        centerTitle: true,
        iconTheme: IconThemeData(
          color: addItemButtonColor,
        ),
        backgroundColor: primaryColor,
        title: Text(
          'RISE',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: ListView.builder(
        itemCount: sampleContacts.length,
        itemBuilder: (context, index) {
          return Card(
      color: backgroundColor,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 2,
      child: ListTile(
        title: Text(
          sampleContacts[index].name,
          style: TextStyle(
            fontSize: 16,
            color: primaryColor,
          ),
        ),
        subtitle: Text(
          sampleContacts[index].title,
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
            onChanged: (String newValue) {},
          ),
        ),
        onTap: () {},
      ),
    );
        },
      ),
    );
  }
}
