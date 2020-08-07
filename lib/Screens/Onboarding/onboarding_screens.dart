import 'package:circle/Screens/Onboarding/onboarding_data.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnBoardingModel> slides = new List<OnBoardingModel>();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      // height: isCurrentPage ? 10:0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: slides.length,
        onPageChanged: (val) {
          currentIndex = val;
        },
        itemBuilder: (context, index) {
          return SliderTile(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc(),
          );
        },
      ),
      bottomSheet: currentIndex != slides.length - 1
          ? Container(
              child: Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Text('SKIP'),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}

class SliderTile extends StatelessWidget {
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Image.asset(imageAssetPath),
          ),
          Expanded(
            flex: 0,
            child: Text(title),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            flex: 1,
            child: Text(desc),
          ),
        ],
      ),
    );
  }
}

/*

Image.asset(imageAssetPath),
          SizedBox(
            height: 20,
          ),
          Text(title),
          SizedBox(
            height: 12,
          ),
          Text(desc),


*/
