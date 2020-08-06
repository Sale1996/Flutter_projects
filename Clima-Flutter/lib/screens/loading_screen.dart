import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

const WEATHER_API_KEY = "895084275cd62e1195cab831822794b2";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocationData() async {
    ClimaLocation location = ClimaLocation();
    await location.getCurrentLocation(); //cekamo vrednosti kako bi mogli da
    // ih printamo
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url: "https://api"
            ".openweathermap"
            ".org/data/2.5/weather?lat=$latitude&lon=$longitude&appid"
            "=$WEATHER_API_KEY&units=metric");

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeatherData: weatherData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          size: 100.0,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
