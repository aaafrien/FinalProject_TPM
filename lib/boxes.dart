import 'package:finalproject/model/user_lib.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static String user = 'user_box';

  static Box<UserModel> getUser() => Hive.box<UserModel>(user);
}
