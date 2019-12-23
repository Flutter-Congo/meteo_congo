import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meteo_app/models/forecast.dart';
import 'package:meteo_app/util/icons.dart';

class WeatherItem extends StatelessWidget {
  final Forecast forecast;
  WeatherItem({this.forecast});

  @override
  Widget build(BuildContext context) {
    if(forecast==null) return Container(); else return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: <Widget>[
        Text( DateFormat("EEE").format(forecast.date)),
        SizedBox(
          height: 15,
        ),
        Icon(getIcon(forecast.weather)),
        SizedBox(
          height: 22,
        ),
        Text("${forecast.temp.round()}°"),
      ],
    );
  }
}