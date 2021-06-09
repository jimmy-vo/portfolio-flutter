// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/models/contact-social.dart';
import 'package:frontend/views/flex-grid.dart';
import 'package:frontend/views/link-text.dart';

// ignore: must_be_immutable
class SocialView extends StatelessWidget {
  List<ContactSocial> contactSocial;
  SocialView({required this.contactSocial});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FlexGridView<ContactSocial>(
        items: this.contactSocial,
        maxColumnWidth: 210,
        wrapperWidth: MediaQuery.of(context).size.width - 100,
        builder: (dynamic e) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: SocialIconView(imageUrl: e.icon),
              ),
              LinkText(text: e.text, url: e.url, size: 12)
            ],
          ),
        ) as Widget,
      ),
    );
  }
}

// ignore: must_be_immutable
class SocialIconView extends StatelessWidget {
  String? imageUrl;

  SocialIconView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return Spacer();

    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl ?? ""),
        ),
      ),
    );
  }
}
