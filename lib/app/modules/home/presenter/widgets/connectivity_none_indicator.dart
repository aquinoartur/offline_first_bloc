import 'package:flutter/material.dart';

class ConnectivityNoneIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Sem conexão de internet:",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            Text("carregando dados locais",
                style: TextStyle(color: Colors.white)),
            SizedBox(height: 15),
            Container(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            )
          ],
        ));
  }
}
