import 'dart:io' show File;

class FavPlace {
  final String id;
  final String favname;
  final String notes;
  final File images;

  FavPlace({
    required this.id,
    required this.favname,
    required this.notes,
    required this.images,
  });
}
