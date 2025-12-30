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
          bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        ),
      ),
    );
  }
}
