import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api/models/user.dart';

class UserApi extends ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUser() async {
    const url = "https://randomuser.me/api/?results=5";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    _users = results.map((e) => User.fromMap(e)).toList();
    notifyListeners();
  }
}
