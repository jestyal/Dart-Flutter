import 'package:flutter_app/screens/helpers/constants.dart';
import 'package:flutter_app/screens/helpers/fetch.dart';

const weatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherFetch {
  Future<dynamic> getWeatherByCoord(double lat, double lon) async {
    FetchHelper fetchData = FetchHelper(
        "$weatherMapURL?lat=$lat&lon=$lon&appid=$openWeatherMapKey&units=metric");

    var decodedData = await fetchData.getData(); //json
    return decodedData;
  }

  Future<dynamic> getWeatherByName(String cityName) async {
    FetchHelper fetchData = FetchHelper(
        "$weatherMapURL?q=$cityName&appid=$openWeatherMapKey&units=metric");

    var decodedData = await fetchData.getData();
    return decodedData;
  }
}