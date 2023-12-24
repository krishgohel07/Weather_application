import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/helper/api_helper.dart';
import 'package:weather_application/provider/weather_provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata(context).then((value) => Timer(Duration(seconds: 1), () {
          Navigator.of(context).pushReplacementNamed('homepage');
        }));
  }

  Future<void> getdata(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false).fetchimage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/logo.jpg")),
        color: Colors.blue,
      ),
    ));
  }
}
