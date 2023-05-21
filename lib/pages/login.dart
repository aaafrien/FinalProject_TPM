import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/pages/register.dart';
import 'package:finalproject/service/user_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/cat.png",
                height: 200,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 20),
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Palette.mainColor),
              ),
              SizedBox(height: 30),
              _usernameField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () async {
                  try {
                    var listUser =
                        await userDatabaseHelper.getUserByUsernameAndPassword(
                            _usernameController.text, _passwordController.text);
                    if (listUser.length > 0) {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('username', listUser[0].username!);
                      pref.setInt('userId', listUser[0].id!);
                      Navigator.popAndPushNamed(context, '/navbar');
                    }
                  } catch (e) {
                    setState(() {
                      error = 'Username or Password is wrong';
                    });
                  }
                },
                height: 45,
                color: Palette.mainColor,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(color: Palette.mainColor)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child:
                        Text('Register', style: TextStyle(color: Colors.black)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextField(
      controller: _usernameController,
      cursorColor: Palette.mainColor,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'username',
        labelStyle: TextStyle(color: Palette.mainColor),
        hintStyle: TextStyle(color: Palette.mainColor),
        prefixIcon: Icon(Icons.person, color: Palette.mainColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelStyle: TextStyle(color: Palette.mainColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: true,
      controller: _passwordController,
      cursorColor: Palette.mainColor,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
        labelStyle: TextStyle(color: Palette.mainColor),
        hintStyle: TextStyle(color: Palette.mainColor),
        prefixIcon: Icon(Icons.person, color: Palette.mainColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelStyle: TextStyle(color: Palette.mainColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
