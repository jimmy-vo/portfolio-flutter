// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-manager.dart';

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
        boxShadow: [
          BoxShadow(
            color:
                ThemeManager.instance!.getOrganizationColor().withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
        border: Border.all(
          color: ThemeManager.instance!.getOrganizationColor(),
          width: 2,
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageUrl ?? ""),
        ),
      ),
    );
  }
}
