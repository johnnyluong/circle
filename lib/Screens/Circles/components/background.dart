import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 25,
            right: 40,
            child: FloatingActionButton(
              child: Icon(Icons.person_add),
              onPressed: () {
                print('Display something');
              },
              backgroundColor: Colors.blue,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
