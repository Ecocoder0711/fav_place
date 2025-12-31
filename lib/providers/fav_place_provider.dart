import 'package:fav_place/model/fav_place_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class FavPlaceNotifer extends StateNotifier<List<FavPlace>> {
  FavPlaceNotifer() : super([]);

  void addPlace(FavPlace place) {
    state = [...state, place]; // Add to a list
    // All widgets listening will rebuild!
  }

  void removePlace(FavPlace place) {
    state = state.where((f) => f.id != place.id).toList();
  }

  List<FavPlace> getFacPlace() {
    return List.from(state);
  }
}

// create a provider
final favPlaceProvider = StateNotifierProvider<FavPlaceNotifer, List<FavPlace>>(
  (ref) {
    return FavPlaceNotifer();
  },
);
