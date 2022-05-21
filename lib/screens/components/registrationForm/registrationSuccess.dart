import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/registrationForm/userPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationSuccess extends StatefulWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

  @override
  _RegistrationSuccessState createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  final routeName = "/registration-success";
  String userName = "";
  String userPass = "";
  bool isLogin = false;

  @override
  void initState() {
    super.initState();

    userName = UserPreferences().getUsername() ?? '';
    userPass = UserPreferences().getPassword() ?? '';
    isLogin = UserPreferences().getIsLogin() ?? false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00beac),
      ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Hello $userName!",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/cat.jpg'),
                )
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout),
                label:  const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00beac),
                ),
                onPressed: () async {
                  await UserPreferences().deleteUsername();
                  await UserPreferences().deletePassword();
                  // await UserPreferences().deleteIsLogin();
                  await UserPreferences().setIsLogin(false);

                  setState(() {
                    userName = '';
                    userPass = '';
                    isLogin = false;
                  });
                  Navigator.pushNamed(
                    context,
                    "/",
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
