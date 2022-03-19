import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IdeasPage extends StatelessWidget {
  const IdeasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
            centerTitle: true,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 5; i++) const ContactItem(),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50.0),
            image: const DecorationImage(
              image: AssetImage('assets/images/avatars/ava1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Имя Фамилия",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Teл: +7 900 000 00 00"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("14.01.1993"),
            ),
          ],
        ),
      ],
    );
  }
}
