import 'package:flutter/cupertino.dart';

//color
Color primary = const Color(0xFF00A987);
Color primaryAccent = const Color(0xFFFCFCFC);
Color primaryAccentVariant = const Color(0xFFF6F6F6);
Color inactive = const Color(0xFF687590);

//font and text style
FontWeight thinFont = FontWeight.w100;
FontWeight regularFont = FontWeight.w400;
FontWeight mediumFont = FontWeight.w500;
FontWeight semiBoldFont = FontWeight.w600;
FontWeight boldFont = FontWeight.w700;

TextStyle textThinDefault = const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w100, fontSize: 14);
TextStyle textRegularDefault = const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 14);
TextStyle textMediumDefault = const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 14,);
TextStyle textSemiBoldDefault = const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 14);
TextStyle textBoldDefault = const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 14);

TextStyle textCustom(FontWeight fontWeight, double fontSize, Color color){
  return TextStyle(fontFamily: 'Poppins', fontWeight: fontWeight, fontSize: fontSize, color: color);
}