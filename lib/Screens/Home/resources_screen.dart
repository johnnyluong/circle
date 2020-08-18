import 'package:circle/Screens/AddContactInfo/add_info.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class ResourcesScreen extends StatelessWidget {
  final CloudDB cloudDB;

  const ResourcesScreen({Key key, this.cloudDB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Resources',
          style: TextStyle(color: primaryTextColor),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ResourceItem(
            isMainItem: true,
            text: "1. EXPAND YOUR NETWORK",
          ),
          ResourceItem(
            isMainItem: false,
            text: "Add people throughout\nyour career journey",
          ),
          ResourceItem(
            isMainItem: true,
            text: "2. CREATE CIRCLES",
          ),
          ResourceItem(
            isMainItem: false,
            text: "Visualize your network by\ngrouping your connections",
          ),
          ResourceItem(
            isMainItem: true,
            text: "3. BE THE SPARK",
          ),
          ResourceItem(
            isMainItem: false,
            text: "Set reminders for you to\nreach out to people",
          ),
          ResourceItem(
            isMainItem: true,
            text: "4. LEARN AND GROW",
          ),
          ResourceItem(
            isMainItem: false,
            text:
                "Take notes after meeting\nwith your contact for\nfuture reference",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 65),
            child: RoundedButton(
              color: kPrimaryDarkColor,
              text: "ADD A CONTACT",
              press: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddInfo(
                    cloudDB: cloudDB,
                  ),
                ),
              );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ResourceItem extends StatelessWidget {
  final bool isMainItem;
  final String text;

  const ResourceItem({
    Key key,
    this.isMainItem,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMainItem
          ? EdgeInsets.fromLTRB(69, 0, 40, 0)
          : EdgeInsets.fromLTRB(91, 0, 40, 30),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: isMainItem ? FontWeight.bold : FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}
