import 'package:fav_place/model/fav_place_model.dart';
import 'package:fav_place/screen/fav_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:fav_place/providers/fav_place_provider.dart';
import 'package:fav_place/screen/add_fav_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
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
    final List<FavPlace> places = ref.watch(favPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Favorite Places",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
      body: places.isEmpty
          ? const Center(child: Text("No favorite places yet."))
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final FavPlace place = places[index];
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FavDetailScreen(favPlace: place),
                    ),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.hardEdge,
                    elevation: 4,
                    color: Colors.white70,
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: Image.file(
                        place.images,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(place.favname),
                      subtitle: Text(
                        place.notes,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(favPlaceProvider.notifier)
                              .removePlace(place);
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                  ),
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


/*
Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.file(
                            place[index].images,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(children: [Text(place[index].favname)]),
                        ),
                      ],
                    ),

 */