import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:flutter_app/screens/helpers/weather.dart';
import 'package:flutter_app/screens/components/searchForm.dart';
import 'package:flutter_app/screens/components/weatherCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Geolocator _geolocator = Geolocator()..forceAndroidLocationManager;
  late Position _position;
  late String _city;
  late int _temp;
  late String _icon;
  late String _desc;
  late Color _color;
  final WeatherFetch _weatherFetch = WeatherFetch();

  @override
  void initState() {
    _temp = 0;
    _icon = "04n";
    _city = "";
    _color = Colors.white;
    super.initState();
    _getCurrent();
  }

  /* Render data */
  void updateData(weatherData) {
    setState(() {
      if (weatherData != null) {
        debugPrint(jsonEncode(weatherData));
        //{"temp":10.49,"feels_like":5.54,"temp_min":10,"temp_max":11,"pressure":1009,"humidity":61}
        _temp = weatherData['main']['temp'].toInt();
        _icon = weatherData['weather'][0]['icon'];
        _desc = weatherData['main']['feels_like'].toString();
        _color = _getBackgroudColor(_temp);
      } else {
        _temp = 0;
        _city = "In the middle of nowhere";
        _icon = "04n";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Search(parentCallback: _changeCity),
                      Text(
                        _city,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto'),
                      ),
                      //Text(''),
                      if (_city != "")
                        WeatherCard(
                          title: _desc,
                          temperature: _temp,
                          iconCode: _icon,
                        )
                    ])),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0, 1.0],
                    colors: [_color, Colors.white]))));
  }

  _getCurrent() {
    _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _position = position;
      });

      _getCityAndWeatherFromLatLng();
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  _getCityAndWeatherFromLatLng() async {
    try {
      //get place name
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _position.latitude, _position.longitude);
      debugPrint(jsonEncode(p));
      Placemark place = p[0];
      //get weather info
      var dataDecoded = await _weatherFetch.getWeatherByCoord(
          _position.latitude, _position.longitude);
      updateData(dataDecoded);
      setState(() {
        _city = place.locality;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  _getBackgroudColor(temp) {
    if (temp > 25) return Colors.orange;
    if (temp > 15) return Colors.yellow;
    if (temp <= 0) return Colors.blue;
    return Colors.green;
  }

  _changeCity(city) async {
    debugPrint(city);
    try {
      //get weather info
      var dataDecoded = await _weatherFetch.getWeatherByName(city);
      updateData(dataDecoded);
      setState(() {
        _city = city;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}