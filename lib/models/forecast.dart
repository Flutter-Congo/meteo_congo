class Forecast {
  final DateTime date;
  final String weather;
  final double temp;

  Forecast({
    this.date,
    this.weather,
    this.temp,
  });

  factory Forecast.fromJSON( Map<String, dynamic> json){
    //print (json["dt"]);
    return Forecast(
      date: new DateTime.fromMillisecondsSinceEpoch(json["dt"]),
      temp: json["temp"]["day"] as double,
      weather: json["weather"][0]["icon"],
    );
  }
}
