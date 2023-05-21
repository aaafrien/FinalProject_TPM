import 'dart:convert';
import 'package:finalproject/model/cats.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  Future<List<Cats?>> fetchCats() async {
    var url = Uri.parse("https://api.api-ninjas.com/v1/cats?max_weight=100");
    var response = await http.get(url,
        headers: {'X-Api-Key': 's4oGFdZ34HDuoq3++9jwqQ==bmEY81rS2VHIIA5J'});

    var data = await jsonDecode(utf8.decode(response.bodyBytes));

    List<Cats?> items = [];
    if (data != null) {
      // print(data);
      for (var i in data) {
        if (i != null) {
          items.add(Cats.fromJson(i));
        }
      }
    }

    print(response);
    return items;
  }

  Future<List<Cats?>> fetchCatName(String name) async {
    var url = Uri.parse("https://api.api-ninjas.com/v1/cats?name=$name");
    var response = await http.get(url,
        headers: {'X-Api-Key': 's4oGFdZ34HDuoq3++9jwqQ==bmEY81rS2VHIIA5J'});

    var data = await jsonDecode(utf8.decode(response.bodyBytes));

    List<Cats?> items = [];
    // print(data);
    if (data != null && data != "") {
      for (var i in data) {
        if (i != null) {
          items.add(Cats.fromJson(i));
        }
      }
    }

    print(response);
    return items;
  }
}
