import 'package:circle/Services/CloudDB/cloud_db.dart';
import 'package:flutter/material.dart';
import 'package:circle/constants.dart';
import 'package:circle/Screens/Circles/components/circle_model.dart';

class Background extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final CloudDB cloudDB;
  final List<CircleModel> slides;

  const Background({
    Key key,
    @required this.slides,
    @required this.currentIndex,
    @required this.cloudDB,
    @required this.child,
  }) : super(key: key);

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: isCurrentPage ? 10.0 : 6.0,
          width: isCurrentPage ? 10.0 : 6.0,
          decoration: BoxDecoration(
            color: isCurrentPage ? Colors.grey : Colors.grey[300],
            borderRadius: BorderRadius.circular(primaryBorderRadius),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          Positioned(
            bottom: 25,
            child: Container(
              height: 65,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      for (int i = 0; i < slides.length; i++)
                        SizedBox(
                          child: currentIndex == i
                              ? pageIndexIndicator(true)
                              : pageIndexIndicator(false),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
