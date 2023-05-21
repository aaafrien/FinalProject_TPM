import 'package:finalproject/components/palettes.dart';
import 'package:finalproject/model/user.dart';
import 'package:finalproject/service/user_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  late int _userId;

  Future<void> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt('userId');
    print(userId);
    setState(() {
      _userId = userId!;
    });
  }

  void getUsername() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username')!;
    });
  }

  @override
  void initState() {
    super.initState();
    _userId = 0;
    _getUserId();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    String _saran =
        "Semoga mata kuliah TPM ini dapat terus mengikuti perkembangan teknologi mobile yang ada";
    String _kesan =
        "Bagi saya mata kuliah TPM ini sangat menarik namun membutuhkan kesabaran dan ketekunan yang tinggi :D";

    return SafeArea(
      child: FutureBuilder(
        future: userDatabaseHelper.getUsersById(_userId),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: Text("No Data"),
              ),
            );
          } else if (_userId == 1) {
            UserModel user = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3 + 50,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Palette.mainColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(999),
                              bottomRight: Radius.circular(999),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  AssetImage('assets/images/afrien.jpg'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          enabled: false,
                          initialValue: user.name,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          enabled: false,
                          initialValue: user.nim,
                          decoration: InputDecoration(
                            labelText: 'NIM',
                            prefixIcon: Icon(
                              Icons.school,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          enabled: false,
                          initialValue: user.email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle:
                                TextStyle(color: Palette.mainColor),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: null,
                          enabled: false,
                          initialValue: _saran,
                          decoration: InputDecoration(
                            labelText: 'Saran',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.warning,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: null,
                          enabled: false,
                          initialValue: _kesan,
                          decoration: InputDecoration(
                            labelText: 'Kesan',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.note,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                      'Are you sure want to log out?'),
                                  actions: <TextButton>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();
                                        pref.remove('userId');
                                        pref.remove('username');
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/login',
                                            (route) => false);
                                      },
                                      child: const Text('Yes',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text("Logout"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            UserModel user = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3 + 50,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Palette.mainColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(999),
                              bottomRight: Radius.circular(999),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            Container(
                              alignment: Alignment.center,
                              width: 200,
                              height: 200,
                              child: Text("No Photo"),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(999),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          enabled: false,
                          initialValue: user.name,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          enabled: false,
                          initialValue: user.nim,
                          decoration: InputDecoration(
                            labelText: 'NIM',
                            prefixIcon: Icon(
                              Icons.school,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          enabled: false,
                          initialValue: user.email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Palette.mainColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Palette.mainColor, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: Palette.mainColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                      'Are you sure want to log out?'),
                                  actions: <TextButton>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        SharedPreferences pref =
                                            await SharedPreferences
                                                .getInstance();
                                        pref.remove('userId');
                                        pref.remove('username');
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/login',
                                            (route) => false);
                                      },
                                      child: const Text('Yes',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text("Logout"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  void _saran() {
    Text("test");
  }

  void setLogout() async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

    SharedPreferences getPref = await _pref;
    getPref.setBool('isLogin', false);
    getPref.remove('username');
  }
}
