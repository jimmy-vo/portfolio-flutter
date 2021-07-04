import 'package:flutter/material.dart';
import 'package:frontend/themes/theme-manager.dart';

// ignore: must_be_immutable
class CardGroup extends StatelessWidget {
  String? title;
  Widget child;
  CardGroup({
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ThemeManager.instance!.getCardHeaderColor(),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      borderOnForeground: true,
      shadowColor: Colors.grey,
      elevation: 30,
      child: Container(
        child: Column(
          children: [
            ...this.title != null
                ? [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          this.title ?? "",
                          style: ThemeManager.instance!.cardHeaderStyle,
                        ),
                      ),
                    )
                  ]
                : [],
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
