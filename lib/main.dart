import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/screens/components/catForm/catForm.dart';
import 'package:flutter_app/screens/components/catForm/formSuccess.dart';
import 'package:flutter_app/screens/components/places/placeItem.dart';
import 'package:flutter_app/screens/components/places/placeList.dart';

import 'package:flutter_app/screens/week2.dart';
import 'package:flutter_app/screens/week3.dart';
import 'package:flutter_app/screens/week4_flutter.dart';
import 'package:flutter_app/screens/week4_dart.dart';
import 'package:flutter_app/screens/week5_flutter.dart';
import 'package:flutter_app/screens/week_6_flutter_1.dart';
import 'package:flutter_app/screens/week_6_flutter_2.dart';
// import 'package:flutter_app/screens/components/homePage.dart'; //weather
import 'package:flutter_app/screens/components/giphy/giphyPage.dart';
import 'package:flutter_app/screens/week_8_dart.dart';
import 'package:flutter_app/screens/week_9_dart.dart'; //giphy


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // week_8_flutter_2
  String? selectedPlace;
  String? selectedPlaceInfo;
  String? selectedPlaceImg;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const CongratulationWiget(), //week_2
      // home: const BalloonsWidget(), //week_3
      // home: const TextSizeWidget(), //week_4_flutter
      // home: const ContactsPage(), //week_4_dart
      // home: Scaffold(
      //   appBar: AppBar(title: const Text('Форма'), centerTitle: true),
      //   body: const QuestionnaireForm(), //week_5_flutter
      // ),
      // home: const IdeasPage(), //week_6_flutter_1
      // home: const ButterfliesList(), //week_6_flutter_2
      // home: const HomePage(), //week_7_flutter_1
      // home: const GiphyPage(), //week_7_flutter_2

      //week_8_flutter_1
      // routes: {
      //   '/': (context) => const CatForm(),
      //   const FormSuccess().routeName: (context) => const FormSuccess(),
      // },

      //Navigator 2.0 week_8_flutter_2
      // home: Navigator(
      //   pages: [
      //     MaterialPage(child: PlaceList(getSelectedPlace, getSelectedPlaceInfo, getSelectedPlaceImg)),
      //
      //     if (selectedPlace != null)
      //       MaterialPage(child: PlaceItem(selectedPlace!, selectedPlaceInfo!, selectedPlaceImg!))
      //   ],
      //   onPopPage: (route, result) {
      //     return route.didPop(result);
      //   },
      // ),

      //week_8_dart
      // home: Scaffold(
      //   appBar: AppBar(title: const Text("Butterflies"), centerTitle: true),
      //   body: const Butterflies(),
      // ),

      //week_9_dart
      home: const DatePage(title: 'Intl Demo Home Page'),

    );
  }

  // week_8_flutter_2
  void getSelectedPlace(place) {
    setState(() {
      selectedPlace = place;
    });
  }

  void getSelectedPlaceInfo(placeInfo) {
    setState(() {
      selectedPlaceInfo = placeInfo;

    });
  }

  void getSelectedPlaceImg(placeImg) {
    setState(() {
      selectedPlaceImg = placeImg;
    });
  }

}

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
