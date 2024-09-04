import 'package:flutter/material.dart';
import 'package:sample_api/models/user_dob.dart';
import 'package:sample_api/models/user_location.dart';
import 'package:sample_api/models/user_name.dart';
import 'package:sample_api/models/user_picture.dart';

class User extends ChangeNotifier {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final dob = UserDob.fromMap(e['dob']);
    final name = UserName.fromMap(e['name']);
    final picture = UserPicture.fromMap(e['picture']);
    final location = UserLocation.fromMap(e['location']);
    return User(
        picture: picture,
        location: location,
        dob: dob,
        name: name,
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat']);
  }

  String get fullName {
    return "${name.title} ${name.first} ${name.last}";
  }
}
