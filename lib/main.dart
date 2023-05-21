import 'package:finalproject/boxes.dart';
import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/model/user_lib.dart';
import 'package:finalproject/pages/register.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("account");
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
