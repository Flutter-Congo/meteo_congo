import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meteo_app/models/city.dart';
import 'package:meteo_app/models/forecast.dart';
import 'package:meteo_app/util/api.dart';
import 'package:meteo_app/util/icons.dart';
import 'package:meteo_app/widgets/weather_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  City city;
  daysWeather() async {
    List<Forecast> list = await Api.get5DaysWeather("Brazzaville");
    setState(() {
      city.day = list;
      city.current= list.last;
    });
  }

  currentWeather() async {
    Forecast now = await Api.getCurrentWeather("Brazzaville");
    setState(() {
      city.current = now;
    });
  }

  @override
  void initState() {
    city = City(
      name: "Brazzaville",
      date: DateTime.now(),
    );

    daysWeather();
    //currentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          "Metéo Congo by Flutter",
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //height: MediaQuery.of(context).size.height * .25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .4 - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            city.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(DateFormat("EEEE d MMMM ").format(city.date),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    ),
                    if (city.current != null)
                      Container(
                        alignment: Alignment.topRight,
                        width: MediaQuery.of(context).size.width * .6 - 20,
                        child: Text(
                          city.current.temp.round().toString() + "°",
                          maxLines: 1,
                          style: TextStyle(fontSize: 130, color: Colors.white),
                        ),
                      )
                  ],
                ),
              ),
              Expanded(
                child: city.current == null
                    ? Container()
                    : Center(
                        child: Icon(
                          getIcon(city.current.weather),
                          color: Colors.white,
                          size: 150,
                        ),
                      ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: city.day == null ? buildLoader() : buildForecast(),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  buildForecast() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Prévision (5 prochains jours)"),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: city.day.map((item) {
              return WeatherItem(
                forecast: item,
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
