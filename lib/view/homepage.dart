import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/helper/api_helper.dart';
import 'package:weather_application/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<WeatherProvider>(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/homepage.jpg"), fit: BoxFit.fitHeight)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      weather.location['name'],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Icon(Icons.location_on_outlined)
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ))
              ],
            ),
          ),
          // Text("${weather.current['temp_c']}")
        ],
      ),
    ));
  }
}
