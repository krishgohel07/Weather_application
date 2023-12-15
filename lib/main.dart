import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/provider/weather_provider.dart';
import 'package:weather_application/view/homepage.dart';
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
        )
      ],
      builder: (context, child) => MaterialApp(
        initialRoute: 'splash',
        routes: {
          'homepage': (context) => HomePage(),
          'splash': (context) => Splash()
        },
      ),
    );
  }
}
