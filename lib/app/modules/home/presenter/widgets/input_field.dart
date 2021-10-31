import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputField(this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
