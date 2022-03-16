import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() => runApp(MyApp());

/*----------------------- WEEK 4 Flutter ---------------------*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextSizeWidget(),
    );
  }
}

class TextSizeWidget extends StatefulWidget {
  const TextSizeWidget({Key? key}) : super(key: key);

  @override
  State<TextSizeWidget> createState() => _TextSizeWidgetState();
}

class _TextSizeWidgetState extends State<TextSizeWidget> {
  double initialFontSize = 18;

  void increment() {
    setState(() {
      initialFontSize++;
    });
  }

  void decrement() {
    setState(() {
      initialFontSize--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Text Size Widget"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    decrement();
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 60),
                  ),
                  child: const Text('-'),
                ),
                TextField(
                  controller: TextEditingController()..text = initialFontSize.toString(),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    labelText: "Размер шрифта",
                  ),
                  onChanged: (String font) {
                    double newFont = double.parse(font);
                    setState(() {
                      initialFontSize = newFont;
                    });
                  },
                ),
                TextButton(
                  onPressed: () {
                    increment();
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 60),
                  ),
                  child: const Text('+'),
                ),

                Text(
                    "Винни-пух и пятачок отдыхали на веточке дуба. Пух сказал: ”Интересно, как долго мы ещё будем здесь торчать?” Пятачок ответил: ” Я думаю, ещё лет десять.",
                    style: TextStyle(
                        fontSize: initialFontSize,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*----------------------- / WEEK 4 Flutter ---------------------*/


/*-----------------------  WEEK 4 Dart ---------------------*/

/*----------------------- / WEEK 4 Dart ---------------------*/

/*----------------------- WEEK 3 ---------------------*/
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

/*----------------------- / WEEK 3 ---------------------*/

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

/*----------------------- WEEK 2 ---------------------*/
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
} /*----------------------- / WEEK 2 ---------------------*/
