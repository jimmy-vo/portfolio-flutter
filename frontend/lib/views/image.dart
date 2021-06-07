// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/models/section-item.dart';

// ignore: must_be_immutable
class ImageView extends StatelessWidget {
  late SectionItem data;

  ImageView({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageUrl = this.data.image;
    if (imageUrl == null) return Spacer();

    return Container(
      width: 96.0,
      height: 96.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
