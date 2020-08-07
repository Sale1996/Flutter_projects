import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeatherData;

  LocationScreen({this.locationWeatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String weatherIcon;
  String cityName;
  String description;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    setUIdata(widget.locationWeatherData); //pristup "nadklasi" preko widgets
    super.initState();
  }

  void setUIdata(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        description = "Unable to get weather data";
        cityName = '';
        return;
      }
      int weatherCode = weatherData["weather"][0]["id"];
      weatherIcon = weatherModel.getWeatherIcon(weatherCode);
      double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      description = weatherModel.getMessage(temperature);
      cityName = weatherData["name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      setUIdata(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var returnedCityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (returnedCityName != null) {
                        var weatherData = await weatherModel
                            .getWeatherByCityName(returnedCityName);
                        setUIdata(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  description + " in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
