import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isNewUser = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        // title: const Text("Registration"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00beac),
        // backgroundColor: const Color(0xFFda5c36),
      ),
      backgroundColor: const Color(0xFF00ceb9),
      // backgroundColor: const Color(0xFFf5683d),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.end,
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
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isNewUser,
                  onChanged: (newValue) {
                    setState(() {
                      isNewUser = newValue!;
                    });
                  },
                ),
                const Text("Remember password"),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  print(_nameController.text);
                  print(_passwordController.text);
                },
              ),
            ),

            Row(
              children: [
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

// class SwitchBtnState extends InheritedWidget {
//   const SwitchBtnState({
//     Key? key,
//     required this.isSwitched,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   final bool isSwitched;
//
//   static SwitchBtnState of(BuildContext context) {
//     final SwitchBtnState? result =
//     context.dependOnInheritedWidgetOfExactType<SwitchBtnState>();
//     return result!;
//   }
//
//   @override
//   bool updateShouldNotify(SwitchBtnState oldWidget) =>
//       isSwitched != oldWidget.isSwitched;
// }
