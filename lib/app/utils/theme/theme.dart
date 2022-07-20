import 'package:flutter/material.dart';
import 'package:routine/app/utils/color/color.dart';
import 'package:routine/app/utils/dimensions/dimensions.dart';


ThemeData themeData() {

  TextTheme _textTheme(TextTheme base) {
    return base.copyWith(

      /*App bar titles*/
      headline1: base.headline1!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 20.0,
        color: white,
        fontWeight: FontWeight.w700
      ),

      headline2: base.headline2!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 18.0,
        color: white,
        fontWeight: FontWeight.w600
      ),

      headline3: base.headline3!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 16.0,
        color: white,
        fontWeight: FontWeight.w400
      ),

      headline4: base.headline4!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 14.0,
        color: white,
        fontWeight: FontWeight.w500
      ),

      headline5: base.headline5!.copyWith(
        fontFamily: 'AlbertSans',
        fontSize: 14.0,
        color: white,
        fontWeight: FontWeight.w400
      ),

      headline6: base.headline6!.copyWith(
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
    primaryColor: orange,
    scaffoldBackgroundColor: backgroundPrimary,

    //FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: orange,
      foregroundColor: white,
    ),

    //TEXT FIELDS
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: base.textTheme.headline5!.copyWith(color: grey),
      contentPadding: EdgeInsets.all(Dimensions.baseBorderRadius*1.5),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: amber),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.baseBorderRadius/2))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: amber, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.baseBorderRadius/2)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.baseBorderRadius/2))
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.baseBorderRadius/2)),
      ),
    ),

    //TEXT THEME
    textTheme: _textTheme(base.textTheme),

    iconTheme: IconThemeData(size: 16.0, color: white),
  );


}
