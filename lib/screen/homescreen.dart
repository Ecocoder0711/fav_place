import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    _checkFirstTime();
    super.initState();
  }

  void _checkFirstTime() {
    final bool isFirstTime = true;

    if (isFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showdialog();
      });
    }
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Welcome!", style: Theme.of(context).textTheme.bodyLarge),
          content: Text(
            "Thanks for installing app \n Take a photo of your fav place \n add a note",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Got it"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Favorite Places",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            child: Text("Fav Place"),
          );
        },
      ),
    );
  }
}
