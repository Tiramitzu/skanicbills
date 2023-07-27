// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:skanicbills/database/get_user.dart';
import 'package:skanicbills/util.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final box = GetStorage();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) => emailController.text = value!,
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password (Min. 6 Character)");
        }
        return null;
      },
      onSaved: (value) => passwordController.text = value!,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 32.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );

    final loginButton = RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 48, 48, 48),
          child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            minWidth: width,
            onPressed: () => signIn(emailController.text, passwordController.text),
            child: const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );

    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(200, 17, 65, 139),
                  Color.fromARGB(255, 17, 66, 139),
                  Color.fromARGB(255, 17, 66, 139),
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(36),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Center(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset('assets/images/skanic.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 45),
                      emailField,
                      const SizedBox(height: 25),
                      passwordField,
                      const SizedBox(height: 35),
                      loginButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await getUserData(email, Util().securePassword('TiraIsTheBest$email', password)).then(
          (value) => {
            if (value.isNotEmpty)
              {
                box.write('id', value[0].id),
                box.write('username', value[0].username),
                box.write('email', value[0].email),
                box.write('name', value[0].name),
                box.write('phone', value[0].phone),
                box.write('address', value[0].address),
                box.write('level', value[0].level),
                box.write('profile_picture', value[0].profilePicture),
                if (value[0].level == 4)
                  {
                    box.write('nisn', value[0].nisn),
                    box.write('nis', value[0].nis),
                    box.write('grade', value[0].grade),
                    box.write('major', value[0].major),
                    box.write('class', value[0].sClass),
                  },
                Fluttertoast.showToast(
                  msg: 'Login Success',
                  webShowClose: true,
                  timeInSecForIosWeb: 5,
                ),
                Util().getStatus()
              }
            else
              Fluttertoast.showToast(
                msg: 'Your email or password is incorrect',
                webShowClose: true,
                timeInSecForIosWeb: 5,
              )
          },
        );
      } catch (e) {
        print(e);
        // Fluttertoast.showToast(msg: 'Your email or password is incorrect');
      }
    }
  }
}
