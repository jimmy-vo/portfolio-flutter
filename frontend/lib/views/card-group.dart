import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

// ignore: must_be_immutable
class CardGroup extends StatelessWidget {
  String title;
  Widget child;
  CardGroup({
    required this.title,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(this.title, style: TextStyleBase.cardTitle),
            ),
          ),
          child
        ],
      ),
    );
  }
}
