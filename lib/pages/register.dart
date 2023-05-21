import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/model/user.dart';
import 'package:finalproject/pages/login.dart';
import 'package:finalproject/service/user_database_helper.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
                "Register",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Palette.mainColor),
              ),
              SizedBox(height: 30),
              _nameField(),
              SizedBox(height: 20),
              _nimField(),
              SizedBox(height: 20),
              _usernameField(),
              SizedBox(height: 20),
              _emailField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: () async {
                  if (_usernameController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text("Please fill all fields"),
                            ),
                          );
                        });
                    return;
                  }
                  UserModel user = UserModel(
                      name: _nameController.text,
                      nim: _nimController.text,
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text);
                  try {
                    await userDatabaseHelper.createUser(user);
                  } catch (e) {
                    setState(() {
                      error = e.toString();
                    });
                    return;
                  }
                  setState(() {
                    error = "User Created";
                  });
                },
                height: 45,
                color: Palette.mainColor,
                child: Text(
                  "Register",
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
                  Text('Have an account?',
                      style: TextStyle(color: Palette.mainColor)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Login', style: TextStyle(color: Colors.black)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameField() {
    return TextField(
      controller: _nameController,
      cursorColor: Palette.mainColor,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'name',
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

  Widget _nimField() {
    return TextField(
      controller: _nimController,
      cursorColor: Palette.mainColor,
      decoration: InputDecoration(
        labelText: 'NIM',
        hintText: 'NIM',
        labelStyle: TextStyle(color: Palette.mainColor),
        hintStyle: TextStyle(color: Palette.mainColor),
        prefixIcon: Icon(Icons.contact_page_outlined, color: Palette.mainColor),
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

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      cursorColor: Palette.mainColor,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'email',
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
        prefixIcon: Icon(Icons.lock, color: Palette.mainColor),
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
