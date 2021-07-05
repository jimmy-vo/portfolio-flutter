import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/controllers/profile.controller.dart';
import 'package:frontend/views/flex-grid.dart';
import 'package:frontend/views/profile/item.dart';
import 'package:frontend/views/profile/section-list.dart';
import 'package:provider/provider.dart';

class StaticLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
        builder: (_, ProfileController controller, __) {
      if (!controller.isReady)
        return Center(child: CircularProgressIndicator());

      return ListView(children: [
        SectionListView(section: controller.experience),
        FlexGridView(
          maxColumnWidth: 500,
          children: (controller.skills.items ?? [])
              .map((e) => ItemView(
                    sectionItem: e,
                    sectionId: controller.skills.id,
                  ))
              .toList(),
        ),
        SectionListView(section: controller.education),
        SectionListView(section: controller.achivements),
        SectionListView(section: controller.activities),
      ]);
    });
  }
}
