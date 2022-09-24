import 'package:flutter/material.dart';
import 'package:sport_rental_app/Available.dart';
import 'package:sport_rental_app/NavBar.dart';
import 'package:sport_rental_app/home.dart';
import 'package:sport_rental_app/login.dart';
import 'package:sport_rental_app/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'Available_item',
        routes: {
          'login': (context) => const MyLogin(),
          'register': (context) => const MyRegister(),
          'home':(context) =>  Home(),
          'Navbar': (context) => NavBar(),
          'Available_item':(context) => availableitem(),
        }),
  );
}