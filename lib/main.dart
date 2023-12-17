import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/view/city_page.dart';
import 'package:weather_application/provider/theme_provider.dart';
import 'package:weather_application/provider/weather_provider.dart';
import 'package:weather_application/view/homepage.dart';
import 'package:weather_application/view/search_page.dart';
import 'package:weather_application/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).themeModel.isDark == true)
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: 'splash',
        routes: {
          'homepage': (context) => HomePage(),
          'splash': (context) => Splash(),
          'search': (context) => Search_page(),
          'city': (context) => managecity()
        },
      ),
    );
  }
}
