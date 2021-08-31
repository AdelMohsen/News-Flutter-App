//base url : https://newsapi.org/
// method(url):v2/top-headlines?
// quires : country=eg&category=business&apiKey=418e25b2040e41efa52528133ec04b50

//https://newsapi.org/
// v2/everything?
// q=tesla&
// apiKey=418e25b2040e41efa52528133ec04b50


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
            fontWeight: FontWeight.w600)),
    primarySwatch: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        elevation: 20.0,
        selectedIconTheme: IconThemeData(color: Colors.deepOrange)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black, size: 30.0),
        actionsIconTheme:
        IconThemeData(color: Colors.black, size: 30.0),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
            color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backwardsCompatibility: false,
        color: Colors.white,
        elevation: 0.0));

ThemeData darkTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    primarySwatch: Colors.deepOrange,
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
            fontWeight: FontWeight.w600)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 13.0),
        unselectedLabelStyle: TextStyle(fontSize: 13.0),
        backgroundColor: HexColor('#393E3F'),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        elevation: 20.0,
        selectedIconTheme: IconThemeData(color: Colors.deepOrange)),
    scaffoldBackgroundColor: HexColor('#393E3F'),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 30.0),
        backgroundColor: HexColor('#393E3F'),
        actionsIconTheme:
        IconThemeData(color: Colors.white, size: 30.0),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.0,
            color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('#393E3F'),
            statusBarIconBrightness: Brightness.light),
        backwardsCompatibility: false,
        elevation: 0.0));