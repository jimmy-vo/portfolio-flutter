import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LinkText extends StatefulWidget {
  double? size;
  String text;
  String url;
  LinkText({
    this.size,
    required this.text,
    required this.url,
  });
  @override
  LinkTextState createState() => LinkTextState();
}

class LinkTextState extends State<LinkText> {
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: widget.text,
                  style: TextStyle(
                    fontSize: widget.size,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      // var url = "https://flutter-examples.com";
                      // if (await canLaunch(url)) {
                      //   await launch(url);
                      // } else {
                      //   throw 'Could not launch $url';
                      // }
                    }),
            ])));
  }
}
