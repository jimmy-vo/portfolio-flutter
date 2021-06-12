import 'package:frontend/layouts/horizontal-slidable/template.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section.dart';
import 'package:frontend/page-stacks/achivement.dart';
import 'package:frontend/page-stacks/experience.dart';
import 'package:frontend/page-stacks/skills.dart';
import 'package:frontend/page-stacks/summary.dart';
import 'package:frontend/page-stacks/volunteer.dart';

class HorizontalSlidableManager {
  List<HorizontalSlidablePage> widgets = [];
  late List<Section> sections;
  Function(int)? moveToPage;

  HorizontalSlidableManager({
    required Contact contact,
    required this.sections,
  }) {
    this.widgets.add(
          HorizontalSlidableSummary(
            sections: sections,
            contact: contact,
            moveToPage: moveToPage,
          ),
        );
    this.widgets.add(HorizontalSlidableExperience(sections: sections));
    this.widgets.add(HorizontalSlidableSkills(sections: sections));
    this.widgets.add(HorizontalSlidableAchivement(sections: sections));
    this.widgets.add(HorizontalSlidableVolunteer(sections: sections));
  }

  String getName(int index) {
    return this.widgets[index].name;
  }
}
