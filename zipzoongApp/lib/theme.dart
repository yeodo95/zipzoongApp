import 'package:flutter/material.dart';
import 'package:zipzoongapp/contant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xff003BF7),
    // fontFamily: "Noto_Sans_KR",
    appBarTheme: appBarTheme(),
    primaryTextTheme: textTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: kDisplayTextColor, fontWeight: FontWeight.w600, fontSize: 20),
    headline2: TextStyle(
        color: kDisplayTextColor, fontWeight: FontWeight.w400, fontSize: 15),
    headline3: TextStyle(
        color: kDisplayTextColor, fontWeight: FontWeight.w400, fontSize: 14),
    bodyText1: TextStyle(
        color: kBodyTextColor, fontWeight: FontWeight.w600, fontSize: 20),
    bodyText2: TextStyle(
        color: kBodyTextColor, fontWeight: FontWeight.w400, fontSize: 17),
    caption: TextStyle(
        color: kBodyTextColor, fontWeight: FontWeight.w400, fontSize: 14),
    button: TextStyle(
        color: kButtonColor, fontWeight: FontWeight.w400, fontSize: 17),
    overline: TextStyle(
        color: kDisplayTextColor, fontWeight: FontWeight.w400, fontSize: 17),
    subtitle1: TextStyle(
        color: kBottomSheetTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    subtitle2: TextStyle(
        color: kBottomSheetTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 17),
    headline4: TextStyle(
        color: kBottomSheetTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 16),
  );
}

TextTheme bottomSheetTextTheme() {
  return const TextTheme(
    bodyText1: TextStyle(
        color: kBottomSheetTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    bodyText2:
        TextStyle(color: kTextColor, fontWeight: FontWeight.w400, fontSize: 17),
    caption:
        TextStyle(color: kTextColor, fontWeight: FontWeight.w400, fontSize: 14),
    overline: TextStyle(
        color: kInputBoxTextColor, fontWeight: FontWeight.w700, fontSize: 10),
  );
}

TextTheme buttonTextTheme() {
  return TextTheme(
    bodyText1:
        TextStyle(color: kTextColor, fontWeight: FontWeight.w600, fontSize: 20),
    bodyText2:
        TextStyle(color: kTextColor, fontWeight: FontWeight.w400, fontSize: 17),
    caption:
        TextStyle(color: kTextColor, fontWeight: FontWeight.w400, fontSize: 14),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
  );
}
