import 'package:flutter/cupertino.dart';

const int splashDuration = 3;

const int cameraNavBarIndex = 1;

//path
const String logo = 'assets/images/logo.png';
const String ornamentTop = 'assets/images/ornamentTop.png';
const String ornamentBottom = 'assets/images/ornamentBot.png';
const String headline = 'assets/images/headline.png';
const String ornamentAppbarLeft = 'assets/images/ornamentAppbarLeft.png';
const String ornamentAppbarRight = 'assets/images/ornamentAppbarRight.png';
const String resultCard = 'assets/images/result_card.png';

//text
const String searchHintText = "Search halal foods";
const String textImageError = "Whops! Unable to load image";

double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
