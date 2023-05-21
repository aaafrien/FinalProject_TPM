import 'package:hive/hive.dart';

part 'user_lib.g.dart'; // generate file using build_runner

@HiveType(typeId: 0)
class UserModel {
  UserModel({required this.username, required this.password});

  @HiveField(0)
  String username;

  @HiveField(1)
  String password;

  @override
  String toString() {
    return 'UserModel{username: $username, password: $password}';
  }
}
