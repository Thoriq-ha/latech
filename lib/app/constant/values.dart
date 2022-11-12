
import 'package:flutter/cupertino.dart';

const int splashDuration = 3;

const int cameraNavBarIndex = 1;

const String logo = 'assets/images/logo.png';
const String ornamentTop = 'assets/images/ornamentTop.png';
const String ornamentBottom = 'assets/images/ornamentBot.png';

double getDeviceHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}