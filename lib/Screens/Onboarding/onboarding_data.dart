
class OnBoardingModel {
  String imageAssetPath;
  String title;
  String desc;

  OnBoardingModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<OnBoardingModel> getSlides() {
  List<OnBoardingModel> slides = new List<OnBoardingModel>();
  OnBoardingModel onBoardingModel = new OnBoardingModel();

  // Onboarding 1
  onBoardingModel.setImageAssetPath('assets/images/onboarding1.png');
  onBoardingModel.setTitle('We\'ll help you out');
  onBoardingModel.setDesc('Insert a description here fore onboarding 1');
  slides.add(onBoardingModel);
  onBoardingModel = new OnBoardingModel();

  // Onboarding 2
  onBoardingModel.setImageAssetPath('assets/images/onboarding2.png');
  onBoardingModel.setTitle('Tips for Reaching Out');
  onBoardingModel.setDesc('Insert a description here fore onboarding 2');
  slides.add(onBoardingModel);
  onBoardingModel = new OnBoardingModel();

  // Onborading 3
  onBoardingModel.setImageAssetPath('assets/images/onboarding3.png');
  onBoardingModel.setTitle('Bring it on!');
  onBoardingModel.setDesc('Insert a description here fore onboarding 3');
  slides.add(onBoardingModel);
  onBoardingModel = new OnBoardingModel();

  return slides;
}
