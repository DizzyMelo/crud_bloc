import 'dart:convert';

import 'package:crud_bloc/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static const String baseUrl =
      "https://api.mlab.com/api/1/databases/crud/collections";

  static const apiKey =
      "Xt64xDtWXTAgvBiQhLiCgiMhnktLagYnxg4J6jINasEiHk9T1lpSkIetECSWLJUq";

  Future<List<User>> getAllUsers() async {
    var response = await http.get(Uri(path: "$baseUrl/users?$apiKey"));
    Iterable userList = json.decode(response.body);
    List<User> users = userList.map((user) => User.fromJson(user)).toList();
    return users;
  }

  Future<User> getUserById(String id) async {
    var response = await http.get(Uri(path: "$baseUrl/users/$id/?$apiKey"));
    User user = json.decode(response.body);
    return user;
  }

  Future<bool> createUser(User user) async {
    var response = await http.post(Uri(path: "$baseUrl/users?$apiKey"),
        body: json.encode(user.toJson()),
        headers: {"Content-Type": "application/json"});

    return response.statusCode == 200;
  }

  Future<bool> updateUser(User user) async {
    var response = await http.put(
        Uri(path: "$baseUrl/users/${user.id}?$apiKey"),
        body: json.encode(user.toJson()),
        headers: {"Content-Type": "application/json"});

    return response.statusCode == 200;
  }

  Future<bool> deleteUser(String id) async {
    var response = await http.delete(Uri(path: "$baseUrl/users/$id?$apiKey"));
    return response.statusCode == 200;
  }
}
