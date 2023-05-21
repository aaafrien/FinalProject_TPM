import 'package:hive_flutter/hive_flutter.dart';
import 'package:finalproject/model/user_lib.dart';

class UserDB {
  final Box<UserModel> _userDB = Hive.box<UserModel>("account");

  void addData(UserModel data) {
    _userDB.add(data);
  }

  int getLength() {
    return _userDB.length;
  }

  bool checkLogin(String username, String password) {
    bool found = false;
    for (int i = 0; i < getLength(); i++) {
      if (username == _userDB.getAt(i)!.username &&
          password == _userDB.getAt(i)!.password) {
        ("Login Success");
        found = true;
        break;
      } else {
        found = false;
      }
    }

    return found;
  }

  bool checkUsers(String username) {
    bool found = false;
    for (int i = 0; i < getLength(); i++) {
      if (username == _userDB.getAt(i)!.username) {
        found = true;
        break;
      } else {
        found = false;
      }
    }

    return found;
  }
}
