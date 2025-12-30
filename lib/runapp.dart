import 'package:fav_place/screen/homescreen.dart';
import 'package:flutter/material.dart';

class FavPlace extends StatelessWidget {
  const FavPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Favroite Place",
      home: const Homescreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 254, 211, 155),
        appBarTheme: AppBarTheme(backgroundColor: Colors.orangeAccent),
        textTheme: TextTheme(
          bodyLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          bodyMedium: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          bodySmall: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
