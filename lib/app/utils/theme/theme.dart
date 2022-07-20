import 'package:flutter/material.dart';
import 'package:routine/app/utils/color/color.dart';


ThemeData themeData() {

  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(

      /*App bar titles*/
      headline1: base.headline1!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 16.0,
        color: white,
        fontWeight: FontWeight.w700
      ),

      headline2: base.headline2!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 14.0,
        color: white,
        fontWeight: FontWeight.w600
      ),

      headline3: base.headline3!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 14.0,
        color: white,
        fontWeight: FontWeight.w500
      ),

      headline4: base.headline4!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 14.0,
        color: white,
        fontWeight: FontWeight.w400
      ),

      headline5: base.headline5!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 12.0,
        color: white,
        fontWeight: FontWeight.w400
      ),
    );
  }
  
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    //PRIMARY COLOR. 
    primaryColor: backgroundSecondary,
    scaffoldBackgroundColor: backgroundPrimary,

    //TEXT FIELDS
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: amber),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: amber, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: redOrange),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      // fillColor: white,
      // filled: true,
    ),

    //TEXT THEME
    textTheme: _textTheme(base.textTheme),

    iconTheme: const IconThemeData(size: 16.0),
  );


}