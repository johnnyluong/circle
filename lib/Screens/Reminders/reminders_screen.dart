import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class RemindersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'Reminders',
          style: TextStyle(color: primaryTextColor),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: addItemButtonColor,
            onPressed: () {
              //TODO: Add Reminder functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[ //Hard-coded Examples
          ReminderCard(
            name: "Troy Anderson",
            description: "Informational Interview, Thursday 5:00PM",
          ),
          ReminderCard(
            name: "Johnny Luong",
            description: "Networking, Monday 2:00PM",
          ),
          ReminderCard(
            name: "John Doe",
            description: "Recruiting, Wednesday 1:00PM",
          ),
          ReminderCard(
            name: "Evan Wang",
            description: "Networking, Friday 9:00AM",
          ),
          ReminderCard(
            name: "Rui Maki",
            description: "Interview, Thursday 4:00PM",
          ),
        ],
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  final String name;
  final String description;
  const ReminderCard({
    Key key,
    this.name,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      elevation: 2,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 12,
            color: primaryColor,
          ),
        ),
        dense: true,
        visualDensity: VisualDensity.compact,
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: kPrimaryLightColor,
          child: IconButton(
            icon: Icon(
              Icons.calendar_today,
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
  }
}
