import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/pages/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.mainColor,
        fontFamily: "Poppins",
      ),
      home: RegisterPage(),
    );
  }
}
