// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:skanicbills/database/set-user.dart';
import 'package:skanicbills/routes.dart';
import 'package:skanicbills/screens/login.dart';
import 'package:skanicbills/util.dart';
// import 'package:skanicbills/dashboard/student.dart';

void main() async {
  await GetStorage.init();

  // String password =
  //     securePassword('TiraIsTheBest.tia@tira.asia', 'Polisitidur01?');

  // setUserData('tia@tira.asia', 'tiramitzu', password, 'Tiara Renata',
  //     85256958090, 'Jalan', 0, 'https://i.ibb.co/n7N6yD2/pfp.png');
  // final box = GetStorage();

  // box.write('email', 'tia@tira.asia');
  // box.write('profile_picture', 'https://i.ibb.co/n7N6yD2/pfp.png');
  // box.write('level', 0);

  Util().getStatus();
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: loginRoute,
      home: const Login(),
    );
  }
}
