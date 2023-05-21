import 'package:finalproject/components/navbar.dart';
import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/data/user_db.dart';
import 'package:finalproject/pages/register.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text("Login"),
              _usernameField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () {
                  validateAndSave();
                  String currentUsername = _usernameController.value.text;
                  String currentPassword = _passwordController.value.text;

                  _processLogin(currentUsername, currentPassword);
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
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Palette.mainColor,
                      fontSize: 14.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xffFEA1A1),
                        fontSize: 14.0,
                      ),
                    ),
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
        labelStyle: TextStyle(
          color: Palette.mainColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Palette.mainColor,
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Palette.mainColor,
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Palette.mainColor,
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
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
        labelStyle: TextStyle(
          color: Palette.mainColor,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: Palette.mainColor,
          fontSize: 14.0,
        ),
        prefixIcon: Icon(
          Icons.lock,
          color: Palette.mainColor,
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: TextStyle(
          color: Palette.mainColor,
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void _processLogin(String username, String password) async {
    final UserDB _hive = UserDB();
    bool found = false;

    found = _hive.checkLogin(username, password);
    if (!found) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Akun tidak ada"),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      setLogin(username, password);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          // builder: (context) => HomePage(username:username),
          builder: (context) => Navbar(),
        ),
      );
    }
  }

  void setLogin(String username, String password) async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

    SharedPreferences getPref = await _pref;
    getPref.setBool('isLogin', true);
    getPref.setString('username', username);
    getPref.setString('password', password);
  }
}
