import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContactListItem extends StatelessWidget {
  var index;

  ContactListItem({
    Key key,
    @required this.list,
    @required this.index,
  }) : super(key: key);

  final AsyncSnapshot<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        list.data[index].data['firstName'] +
            " " +
            list.data[index].data['lastName'],
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        list.data[index].data['profession'],
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        Icons.person,
        size: 28,
      ),
      trailing: Icon(Icons.menu),
      onTap: () {},
      onLongPress: () {}, //Add drop down menu button
    );
  }
}