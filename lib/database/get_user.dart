import 'dart:convert';

import 'package:skanicbills/models/user.dart';

import 'package:http/http.dart' as http;

Future<List<UserModel>> getUserData(String email, String password) async {
  var urlU = "https://syah-warid.000webhostapp.com/get.php?q=SELECT * FROM users WHERE email='$email' AND password='$password';";
  http.Response responseU = await http.get(Uri.parse(urlU));
  var dataU = jsonDecode(responseU.body);

  List<UserModel> userList = [];

  if (dataU.runtimeType == bool) return userList;

  UserModel user = UserModel(
    id: int.parse(dataU['id'].toString()),
    username: dataU['username'].toString(),
    email: dataU['email'].toString(),
    password: dataU['password'].toString(),
    name: dataU['name'].toString(),
    phone: int.parse(dataU['phone'].toString()),
    address: dataU['address'].toString(),
    level: int.parse(dataU['level'].toString()),
    profilePicture: dataU['profile_picture'].toString(),
    nisn: 0,
    nis: 0,
    major: 0,
    grade: 0,
    sClass: 0,
  );

  var urlS = 'https://syah-warid.000webhostapp.com/get.php?q=SELECT * FROM student_details WHERE user_id=${user.id};';
  http.Response responseS = await http.get(Uri.parse(urlS));
  var dataS = jsonDecode(responseS.body);

  if (dataS.runtimeType != bool) {
    user.nisn = int.parse(dataS['nisn'].toString());
    user.nis = int.parse(dataS['nis'].toString());
    user.major = int.parse(dataS['major'].toString());
    user.grade = int.parse(dataS['grade'].toString());
    user.sClass = int.parse(dataS['class'].toString());
  }

  userList.add(user);

  return userList;
}
