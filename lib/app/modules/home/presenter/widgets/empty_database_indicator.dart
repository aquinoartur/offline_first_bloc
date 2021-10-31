import 'package:flutter/material.dart';

class EmptyDatabaseIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Ainda não existem dados offline.",
          style: TextStyle(color: Colors.white)),
    );
  }
}
