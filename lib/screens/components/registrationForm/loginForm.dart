import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/registrationForm/userPreferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final routeName = "/login-form";
  final formKey = GlobalKey<FormState>();
  String name = "";
  String password = "";
  bool isLogin = false;

  @override
  void initState() {
    super.initState();

    name = UserPreferences().getUsername() ?? '';
    password = UserPreferences().getPassword() ?? '';
    isLogin = UserPreferences().getIsLogin() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00beac),
      ),
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF00ceb9),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                initialValue: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username *',
                  suffixIcon: Icon(Icons.person),
                ),
                onChanged: (name) => setState(() => this.name = name),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                initialValue: password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password *',
                  suffixIcon: Icon(Icons.key),
                ),
                onChanged: (password) => setState(() => this.password = password),
              ),
            ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: isNewUser,
            //       onChanged: (newValue) {
            //         setState(() {
            //           isNewUser = newValue!;
            //         });
            //       },
            //     ),
            //     const Text("Remember password"),
            //   ],
            // ),
            // TextButton(
            //   onPressed: () {},
            //   child: const Text('Forgot Password'),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00beac),
                ),
                onPressed: () async {
                  await UserPreferences().setUsername(name);
                  await UserPreferences().setPassword(password);
                  await UserPreferences().setIsLogin(true);

                  if (name.isNotEmpty && password.isNotEmpty) {
                    Navigator.pushNamed(
                      context,
                      "/registration-success",
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Enter Username and Password")));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
