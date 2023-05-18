import 'package:finalproject/model/user.dart';
import 'package:hive/hive.dart';

class HiveBoxes {
  static String user = 'user_box';

  static Box<User> getQuote() => Hive.box<User>(user);
}
