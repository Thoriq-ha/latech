
import 'package:flutter/cupertino.dart';

const int splashDuration = 3;

const String logo = 'assets/images/logo.png';

double getDeviceHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}