// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageView extends StatelessWidget {
  String? imageUrl;

  ImageView({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return Spacer();

    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl ?? ""),
        ),
      ),
    );
  }
}
