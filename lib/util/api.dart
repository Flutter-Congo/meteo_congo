import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meteo_app/models/forecast.dart';

class Api {
  static String apikey = "7ac4fcbf25b67b21dbad9ff2e77eb061";

  static getData(String api_url) async {
    Response response = await http.get(api_url + "&appid=" + apikey);
    var data = json.decode(response.body);
    return data;
  }

  static get5DaysWeather(String city) async {
    String url =
        "http://api.openweathermap.org/data/2.5/forecast/daily?q=${city}&units=metric&cnt=5";

    dynamic data =  await getData(url);
    List<Forecast> forecast=[];



    for (dynamic item in data["list"]) {
      forecast.add(Forecast.fromJSON(item));
    }
    return forecast;
  }


  static getCurrentWeather(String city) async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric";

    dynamic data =  await getData(url);
    Forecast forecast= Forecast(
      temp: data["main"]["temp"]  as double,
      weather: data["weather"][0]["icon"],
      date: data["main"]["dt"],
    );

    return forecast;
  }
}
