import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/provider/theme_provider.dart';
import 'package:weather_application/provider/weather_provider.dart';

class managecity extends StatefulWidget {
  const managecity({super.key});

  @override
  State<managecity> createState() => _managecityState();
}

class _managecityState extends State<managecity> {
  @override
  Widget build(BuildContext context) {
    var weather = Provider.of<WeatherProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Manage Cities"),
          actions: [IconButton(
              onPressed: () {
                theme.changetheme();
              },
              icon: (theme.themeModel.isDark == false)
                  ? Icon(Icons.dark_mode_outlined)
                  : Icon(Icons.light_mode))],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('search');
          },
          child: Icon(Icons.add),
        ),
        body: (weather.cities.isNotEmpty)
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Container(
                  height: 80,
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [Colors.blue,Colors.deepPurpleAccent])
                  ),
                  child: ListTile(
                      title: Text("${weather.city}"),
                      subtitle: Text(
                          "Min : ${weather.day['mintemp_c']}°/Max : ${weather.day['maxtemp_c']}°"),
                      leading: IconButton(
                          onPressed: () {
                            weather.removecity(index);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Succesfully Removed From city List"),
                              backgroundColor: Colors.green,
                            ));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      // trailing: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.delete,
                      //     color: Colors.red,
                      //   ),
                      // )),
                      trailing: Column(
                        children: [
                          Text("${weather.current['temp_c']}°",style: TextStyle(fontSize: 20),),
                          Text("${weather.current['condition']['text']}",style: TextStyle(fontSize: 15),)
                        ],
                      )),
                ),
              )
            : Center(
                child: Text("City List is Empty"),
              ));
  }
}
