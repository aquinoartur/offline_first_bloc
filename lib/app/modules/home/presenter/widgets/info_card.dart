import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int id;
  final int index;
  final String url;
  final Color color;
  final bool isRemote;
  const InfoCard({
    required this.title,
    required this.id,
    required this.index,
    required this.url,
    required this.color,
    required this.isRemote,
  });

  void _launchURL() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: color,
        elevation: 20,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "$title",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  isRemote
                      ? IconButton(
                          onPressed: _launchURL,
                          icon: Icon(
                            Icons.search,
                            color: color == Colors.indigo
                                ? Colors.black
                                : Colors.blue,
                            size: 18,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "id:${id.toString()}",
                    style: TextStyle(
                        color: color == Colors.indigo
                            ? Colors.black
                            : Colors.grey),
                  ),
                  Text(
                    "${index.toString()}",
                    style: TextStyle(
                        color: color == Colors.indigo
                            ? Colors.white
                            : Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
