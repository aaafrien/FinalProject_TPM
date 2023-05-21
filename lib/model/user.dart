class UserModel {
  int? id;
  String? name;
  String? nim;
  String? username;
  String? email;
  String? password;

  UserModel({
    required this.name,
    required this.nim,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['nim'] = nim;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserModel.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
    nim = map['nim'];
    username = map['username'];
    email = map['email'];
    password = map['password'];
  }
}
