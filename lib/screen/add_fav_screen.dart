import 'dart:io';

import 'package:fav_place/model/fav_place_model.dart';
import 'package:fav_place/providers/fav_place_provider.dart';
import 'package:fav_place/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddFavScreen extends ConsumerStatefulWidget {
  const AddFavScreen({super.key});

  @override
  ConsumerState<AddFavScreen> createState() => _AddFavScreenState();
}

class _AddFavScreenState extends ConsumerState<AddFavScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  Future<void> _pickImage() async {
    //open camera & click image
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);

    if (pickedImage == null) return;

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Favorite Place",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // image
                _selectedImage == null
                    ? ElevatedButton(
                        onPressed: _pickImage,
                        child: Text('Click Photo'),
                      )
                    : Image.file(
                        _selectedImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                SizedBox(height: 20),
                // form
                Textformfield(
                  hintText: 'Name of Your Favorite Place',
                  lableText: 'Favorite Place',
                  mycontroller: _titleController,
                ),
                SizedBox(height: 22),
                Textformfield(
                  hintText: 'Your Short Note',
                  lableText: 'Note',
                  mycontroller: _noteController,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.orange),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter a place name'),
                            ),
                          );
                          return;
                        }

                        if (_selectedImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please take a photo')),
                          );
                          return;
                        }
                        FavPlace place = FavPlace(
                          id: DateTime.now().toString(),
                          favname: _titleController.text,
                          notes: _noteController.text,
                          images: _selectedImage!,
                        );
                        ref.read(favPlaceProvider.notifier).addPlace(place);
                        Navigator.of(context).pop();
                      },
                      child: Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
