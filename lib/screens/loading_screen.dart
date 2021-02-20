import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

const apiKey = '3ba056cfdcec9d5ea1b6b685aec10b86';
// const uri = ''

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double lon;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    lon = location.longitude;
    getData();
  }

  Future<void> getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       getLocation();
        //       //Get the current location
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
