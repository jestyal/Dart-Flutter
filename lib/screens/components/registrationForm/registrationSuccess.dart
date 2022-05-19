import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

  final routeName = "/registration-success";

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
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Hello, USER!",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/cat.jpg'),
                )
            ),
          ],
        ),
      ),
    );
  }
}
