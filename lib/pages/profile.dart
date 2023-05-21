import 'package:finalproject/data/user_database_helper.dart';
import 'package:finalproject/model/user.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: const Text('Are you sure want to log out?'),
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
                              await SharedPreferences.getInstance();
                          pref.remove('userId');
                          pref.remove('username');
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: const Text('Yes',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: FutureBuilder(
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
            } else {
              UserModel user = snapshot.data;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/afrien.jpg')),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nama"),
                                    Text("NIM"),
                                    Text("TTL"),
                                    Text("Goals"),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(': ${user.username}'),
                                    Text(": 123200093"),
                                    Text(": Sleman, 29 April 2002"),
                                    Text(": UI/UX Designer"),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }

  void setLogout() async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

    SharedPreferences getPref = await _pref;
    getPref.setBool('isLogin', false);
    getPref.remove('username');
  }
}
