import 'package:flutter/material.dart';

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // Will change the flexible
        // Will use containers and height of the screen to size the pictures and texts
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Image.asset(imageAssetPath),
          ),
          Flexible(
            flex: 0,
            child: Text(title),
          ),
          SizedBox(
            height: 12,
          ),
          Flexible(
            flex: 1,
            child: Text(desc),
          ),
        ],
      ),
    );
  }
}
