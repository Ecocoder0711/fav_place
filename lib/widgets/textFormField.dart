import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  final String hintText;
  final String lableText;
  final TextEditingController mycontroller;
  const Textformfield({
    super.key,
    required this.hintText,
    required this.lableText,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        labelText: lableText,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
