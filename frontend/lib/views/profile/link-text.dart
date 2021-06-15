import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-manager.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class LinkText extends StatefulWidget {
  String text;
  String url;
  LinkText({
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
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.text,
              style: ThemeManager.instance!.linkTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  var url = widget.url;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
