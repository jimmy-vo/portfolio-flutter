// // ignore: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:frontend/layouts/horizontal-slidable/template.dart';
// import 'package:frontend/models/section.dart';
// import 'package:frontend/views/flex-grid.dart';
// import 'package:frontend/views/profile/item.dart';

// // ignore: must_be_immutable
// class SkillsPageStack extends HorizontalSlidablePage {
//   SkillsPageStack({required List<Section> sections}) {
//     Section skills = sections.firstWhere((element) => element.id == 2);
//     super.icon = Icons.lightbulb_outline_rounded;
//     super.name = skills.name ?? "";
//     super.children = [
//       HorizontalSlidablePageFragment(
//         sectionId: skills.id,
//         sectionItemId: skills.items![0].id,
//         child: FlexGridView(
//           maxColumnWidth: 500,
//           children: (skills.items ?? [])
//               .map((e) => ItemView(
//                     data: e,
//                   ))
//               .toList(),
//         ),
//       )
//     ];
//   }
// }
