
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart'; 

IconData getIcon(String icon){
  switch (icon) {
    case "01d":
      return WeatherIcons.wi_day_sunny;
      break; 
    case "02d":
      return WeatherIcons.wi_day_cloudy;
      break; 
    case "03d":
      return WeatherIcons.wi_cloud;
      break; 
    case "04d":
      return WeatherIcons.wi_cloudy;
      break; 
    case "09d":
      return WeatherIcons.wi_showers;
      break; 
    case "10d":
      return WeatherIcons.wi_day_showers;
      break; 
    case "11d":
      return WeatherIcons.wi_thunderstorm; 
      break; 
    case "50d":
      return WeatherIcons.wi_windy;
      break; 
    case "01n":
      return WeatherIcons.wi_moon_new;
      break; 
    case "02n":
      return WeatherIcons.wi_night_cloudy;
      break; 
    case "03n":
      return WeatherIcons.wi_cloud;
      break; 
    case "04n":
      return WeatherIcons.wi_cloudy;
      break; 
    case "09n":
      return WeatherIcons.wi_showers;
      break; 
    case "10n":
      return WeatherIcons.wi_night_showers;
      break; 
    case "11n":
      return WeatherIcons.wi_thunderstorm; 
      break; 
    case "50n":
      return WeatherIcons.wi_windy;
      break; 
  }
}