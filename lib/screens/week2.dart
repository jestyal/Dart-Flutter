import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CongratulationWiget extends StatelessWidget {
  const CongratulationWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Congratulations!"),
            centerTitle: true,
            backgroundColor: Colors.indigoAccent,
          ),
          body: Stack(children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 40),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text("Ослик, \nс Днем Рождения!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Лучший подарок, по-моему, мед.\nКаждый осел это сразу поймет!\nДаже немножечко —\nЧайная ложечка! —\nЭто уже хорошо! —\nНу, а тем более — полный горшок!",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image(
                  image: AssetImage('assets/images/donkey.png'),
                  width: 300,
                  height: 362,
                )),
          ])),
    );
  }
}
