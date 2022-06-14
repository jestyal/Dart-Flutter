import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/components/animations/animationPage.dart';

import 'package:flutter_app/screens/components/catForm/catForm.dart';
import 'package:flutter_app/screens/components/catForm/formSuccess.dart';
import 'package:flutter_app/screens/components/places/placeItem.dart';
import 'package:flutter_app/screens/components/places/placeList.dart';
import 'package:flutter_app/screens/components/registrationForm/loginForm.dart';
import 'package:flutter_app/screens/components/registrationForm/registrationForm.dart';
import 'package:flutter_app/screens/components/registrationForm/registrationPage.dart';
import 'package:flutter_app/screens/components/registrationForm/registrationSuccess.dart';
import 'package:flutter_app/screens/components/registrationForm/userPreferences.dart';
import 'package:flutter_app/screens/components/shoppingCart/shoppingCartPage.dart';

import 'package:flutter_app/screens/week2.dart';
import 'package:flutter_app/screens/week3.dart';
import 'package:flutter_app/screens/week4_flutter.dart';
import 'package:flutter_app/screens/week4_dart.dart';
import 'package:flutter_app/screens/week5_flutter.dart';
import 'package:flutter_app/screens/week_15.dart';
import 'package:flutter_app/screens/week_17.dart';
import 'package:flutter_app/screens/week_6_flutter_1.dart';
import 'package:flutter_app/screens/week_6_flutter_2.dart';
// import 'package:flutter_app/screens/components/homePage.dart'; //weather
import 'package:flutter_app/screens/components/giphy/giphyPage.dart';
import 'package:flutter_app/screens/week_8_dart.dart';
import 'package:flutter_app/screens/week_9_dart.dart';
import 'package:flutter_app/screens/week_9_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() => runApp(const MyApp());

//week_13 login/registration form (shared pref)
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await UserPreferences().init();
//
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  //week 15
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {

  // week_8_flutter_2
  String? selectedPlace;
  String? selectedPlaceInfo;
  String? selectedPlaceImg;

  // week 15
  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

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
      // home: const DatePage(title: 'Intl Demo Home Page'),
      //week_9_flutter
      // home: const SwitchPage(),

      //week_17
      // home: const MapPage(),

      // week 13
      // routes: {
      //   '/': (context) => const RegistrationPage(),
      //   '/login-form': (context) => const LoginForm(),
      //   '/registration-form': (context) => const RegistrationForm(),
      //   '/registration-success': (context) => const RegistrationSuccess(),
      // },

      //week 14
      // home: const ShoppingPage(),

      //week 15
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   _locale ??= deviceLocale;
      //   return _locale;
      // },
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      // locale: _locale,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const ShopCard(),
      // },

      //week 16
      home: const AnimationPage(),


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
