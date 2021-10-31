import 'package:flutter/material.dart';

class SearchErrorWidget extends StatelessWidget {
  const SearchErrorWidget({
    this.onPressed,
  });

  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Falha ao acessar o Servidor.",
          style: TextStyle(color: Colors.white),
        ),
        IconButton(
            onPressed: () {
              onPressed!();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.indigo,
            ))
      ],
    ));
  }
}
