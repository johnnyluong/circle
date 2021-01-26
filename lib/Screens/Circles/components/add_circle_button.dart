import 'package:auto_size_text/auto_size_text.dart';
import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:circle/components/text_field_line.dart';
import 'package:circle/constants.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final CloudDB cloudDB;
  String circleName;
  AddButton({Key key, this.cloudDB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
            title: const Text(
              'Form a new circle!',
              style: TextStyle(color: primaryTextColor),
            ),
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Form a new circle!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.28,
                    vertical: MediaQuery.of(context).size.height * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: disabledColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    //TODO: Add image upload functionality
                    'Upload Image!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryDarkColor,
                    ),
                  ),
                ),
                Text("What is your circle called?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold)),
                TextFieldLine(
                    hintText: "Type the name of a company or group!",
                    onChanged: (value) {
                      circleName = value;
                    }),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  cloudDB.addCircle(circleName);
                  Navigator.of(context).pop();
                },
                textColor: kPrimaryDarkColor,
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
      child: Container(
        height: 110,
        alignment: Alignment.center,
        child: AutoSizeText(
          "+",
          maxLines: 1,
          minFontSize: 50,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: addItemButtonColor,
          ),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryIconColor,
            border: Border.all(color: addItemButtonColor)),
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
      ),
    );
  }
}

// Widget _buildPopupDialog(BuildContext context) {
//   String circleName;
//   return new AlertDialog(
//     title: const Text(
//       'Form a new circle!',
//       style: TextStyle(color: primaryTextColor),
//     ),
//     content: new Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Text("Form a new circle!",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
//         Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * 0.28,
//             vertical: MediaQuery.of(context).size.height * 0.1,
//           ),
//           decoration: BoxDecoration(
//             color: disabledColor,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Text(
//             //TODO: Add image upload functionality
//             'Upload Image!',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: kPrimaryDarkColor,
//             ),
//           ),
//         ),
//         Text("What is your circle called?",
//             textAlign: TextAlign.center,
//             style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
//         TextFieldLine(
//             hintText: "Type the name of a company or group!",
//             onChanged: (value) {
//               circleName = value;
//             }),
//       ],
//     ),
//     actions: <Widget>[
//       new FlatButton(
//         onPressed: () {
//           cloudDB.addCircle(circleName);
//           Navigator.of(context).pop();
//         },
//         textColor: kPrimaryDarkColor,
//         child: const Text('Add'),
//       ),
//     ],
//   );
// }
