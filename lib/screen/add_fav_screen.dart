import 'dart:io';

import 'package:fav_place/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFavScreen extends StatefulWidget {
  const AddFavScreen({super.key});

  @override
  State<AddFavScreen> createState() => _AddFavScreenState();
}

class _AddFavScreenState extends State<AddFavScreen> {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
