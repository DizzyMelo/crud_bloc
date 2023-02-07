import 'dart:convert';

import 'package:crud_bloc/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static const String baseUrl = "data.mongodb-api.com";

  static const apiKey =
      "Xt64xDtWXTAgvBiQhLiCgiMhnktLagYnxg4J6jINasEiHk9T1lpSkIetECSWLJUq";

  Map<String, dynamic> defaultBody = {
    "dataSource": "Cluster0",
    "database": "crud",
    "collection": "users"
  };

  Future<List<User>> getAllUsers() async {
    try {
      var response = await http.post(
          Uri(
              scheme: "https",
              host: baseUrl,
              path: "app/data-bjiti/endpoint/data/v1/action/find"),
          body: json.encode(defaultBody),
          headers: {"Content-Type": "application/json", "api-key": apiKey});
      Iterable userList = json.decode(response.body)["documents"];
      List<User> users = userList.map((user) => User.fromJson(user)).toList();
      return users;
    } catch (e) {
      throw Exception("Error trying to get users");
    }
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
