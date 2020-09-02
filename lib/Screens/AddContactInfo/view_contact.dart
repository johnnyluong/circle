import 'package:circle/components/floating_action_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';

class ViewContactScreen extends StatefulWidget {
  final Future<DocumentReference> contactRef;
  final String name;
  final String profession;
  ViewContactScreen({@required this.contactRef, this.name, this.profession});

  @override
  _ViewContactScreenState createState() => _ViewContactScreenState();
}

class _ViewContactScreenState extends State<ViewContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Finalize Contact Details',
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentReference>(
          future: widget.contactRef,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: <Widget>[
                  ContactInfoNotice(),
                  Card(
                    child: MainContactInfo(
                      name: widget.name,
                      profession: widget.profession,
                    ),
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        SectionHeader(text: "Circles"),
                        AddToCirclesButton(),
                      ],
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        SectionHeader(text: "Reminders"),
                        SetRemindersButton(),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        color: kPrimaryDarkColor,
        press: () {
          Navigator.pop(context);
          Navigator.pop(context);
        }, //Handle case of multiple entries vs single
        text: "Finish",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AddToCirclesButton extends StatelessWidget {
  const AddToCirclesButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: ListTile(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Add contact to Circles ",
                style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.add_circle_outline,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        dense: true,
        visualDensity: VisualDensity.compact,
        onTap: () {}, //TODO Add Circles here
      ),
    );
  }
}

class SetRemindersButton extends StatelessWidget {
  const SetRemindersButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: ListTile(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Set Reminders ",
                style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
              ),
              WidgetSpan(
                child: Icon(
                  Icons.add_circle_outline,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        dense: true,
        visualDensity: VisualDensity.compact,
        onTap: () {}, //TODO set reminders here
      ),
    );
  }
}

class ContactInfoNotice extends StatelessWidget {
  const ContactInfoNotice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.lock,
                size: 16,
              ),
            ),
            TextSpan(
              text: "This information will only be seen by you.",
              style: TextStyle(
                color: kPrimaryDarkColor,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String text;
  const SectionHeader({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 15, 0, 15),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: primaryTextColor,
          fontSize: 25,
        ),
      ),
    );
  }
}

class MainContactInfo extends StatelessWidget {
  final String name;
  final String profession;
  const MainContactInfo({
    Key key,
    @required this.name,
    @required this.profession,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      title: Text(
        name,
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        profession,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: kPrimaryLightColor,
        child: IconButton(
          icon: Icon(
            Icons.person,
            color: primaryIconColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
