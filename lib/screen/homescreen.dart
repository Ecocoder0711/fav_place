import 'package:fav_place/screen/add_fav_screen.dart';
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
    super.initState();
    _checkFirstTime();
  }

  /*
  {
  "key" : "VALUE",
  "isFirstTime" : true/false;
  }
  */

  Future<void> _checkFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isFirstTime = prefs.getBool("isFirstTime") ?? true;

    if (isFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showdialog();
      });
      prefs.setBool("isFirstTime", false);
    }
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Welcome!", style: Theme.of(context).textTheme.bodyLarge),
          content: Text(
            "Thanks for installing app \nTake a photo of your fav place \nadd a note",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddFavScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
