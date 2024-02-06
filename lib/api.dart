import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one/model.dart';


class UserService {
  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      Iterable data = json.decode(response.body);
      List<User> users = data.map((json) => User.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
