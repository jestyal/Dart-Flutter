import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/registrationForm/userPreferences.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final routeName = "/registration-form";
  String name = "";
  String password = "";
  String confirmPassword = "";
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
        title: const Text("Registration"),
        centerTitle: true,
        backgroundColor: const Color(0xFFda5c36),
      ),
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf5683d),
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
                "Registration",
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
                ),
                onChanged: (password) => setState(() => this.password = password),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                initialValue: confirmPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password *',
                ),
                onChanged: (confirmPassword) => setState(() => this.confirmPassword = confirmPassword),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Sing up'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFda5c36),
                ),
                onPressed: () async {
                  await UserPreferences().setUsername(name);
                  await UserPreferences().setPassword(password);
                  await UserPreferences().setIsLogin(true);

                  if (name.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty && confirmPassword == password) {
                    Navigator.pushNamed(
                      context,
                      "/registration-success",
                    );
                  }
                  else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Enter username and password\nPassword does not match the entered password")));
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
