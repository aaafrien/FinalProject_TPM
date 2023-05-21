// import 'package:bcrypt/bcrypt.dart';
import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/pages/login.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure = true;

  registerInputHandler() {
    bool isFilled = true;
    if (_usernameController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Warning! Username can\'t empty!',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          width: 300,
          duration: Duration(seconds: 2),
        ),
      );
      isFilled = false;
    } else if (_passwordController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Warning! Password can\'t empty!',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          width: 300,
          duration: Duration(seconds: 2),
        ),
      );
    } else if (confirmPasswordController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Warning! Confirm password can\'t empty!',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          width: 300,
          duration: Duration(seconds: 2),
        ),
      );
    } else if (_passwordController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Warning! Password less than 8 characters!',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          width: 300,
          duration: Duration(seconds: 2),
        ),
      );
      isFilled = false;
    } else if (confirmPasswordController.text != _passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Warning! Confirm password must be same!',
            textAlign: TextAlign.center,
          ),
          behavior: SnackBarBehavior.floating,
          width: 300,
          duration: Duration(seconds: 2),
        ),
      );
      isFilled = false;
    }
    return isFilled;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Register",
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
            // MaterialButton(
            //   onPressed: () async {
            //     if (registerInputHandler()) {
            //           final String hashedPassword = BCrypt.hashpw(
            //               _passwordController.text, BCrypt.gensalt());
            //           final int result =
            //               await DatabaseHelper.instance.insertUser({
            //             'username': _usernameController.text,
            //             'password': hashedPassword,
            //           });
            //           if (result > 0) {
            //             // ignore: use_build_context_synchronously
            //             ScaffoldMessenger.of(context).showSnackBar(
            //               const SnackBar(
            //                 content: Text(
            //                   'Register Success',
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 behavior: SnackBarBehavior.floating,
            //                 width: 300,
            //                 duration: Duration(seconds: 2),
            //               ),
            //             );
            //             // ignore: use_build_context_synchronously
            //             Navigator.pushReplacement(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const LoginPage(),
            //               ),
            //             );
            //           } else {
            //             // ignore: use_build_context_synchronously
            //             ScaffoldMessenger.of(context).showSnackBar(
            //               const SnackBar(
            //                 content: Text(
            //                   'Register Failed',
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 behavior: SnackBarBehavior.floating,
            //                 width: 300,
            //                 duration: Duration(seconds: 2),
            //               ),
            //             );
            //           }
            //         }
            //   },
            //   child: Text("Register", style: TextStyle(color: Colors.white)),
            //   height: 50,
            //   padding: EdgeInsets.symmetric(horizontal: 50),
            //   color: Palette.mainColor,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8)),
            // ),
            SizedBox(height: 10),
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
    );
  }

  Widget _usernameField() {
    return TextField(
      // key: _formKey,
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
}
