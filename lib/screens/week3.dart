import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalloonsWidget extends StatelessWidget {
  const BalloonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      // ),
      // home: const MyHomePage(title: 'Первое приложение'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Balloons"),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(30),
            color: Colors.lightBlueAccent,
            child: Stack(children: const <Widget>[
              Align(
                alignment: FractionalOffset(0.1, 0.2),
                child: RedBalloon(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RedBalloon(),
              ),
              Align(
                alignment: FractionalOffset(0.8, 0.2),
                child: BlueBalloon(),
              ),
              Align(
                alignment: FractionalOffset(0.1, 0.7),
                child: BlueBalloon(),
              ),
              Align(
                alignment: FractionalOffset(0.8, 0.8),
                child: BlueBalloon(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BlueBalloon(),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: BlueBalloon(),
              ),
              Center(
                child: BlueBalloon(),
              ),
            ])),
      ),
    );
  }
}

class BlueBalloon extends StatelessWidget {
  const BlueBalloon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        border: Border.all(),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}

class RedBalloon extends StatelessWidget {
  const RedBalloon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        border: Border.all(),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
