import 'package:meteo_app/models/forecast.dart';

class City {
  final String name;
   List<Forecast> week;
   List<Forecast> day;
   Forecast current;
  final DateTime date;

  City({
    this.name,
    this.date,
    this.current,
    this.week,
    this.day,
  });
}