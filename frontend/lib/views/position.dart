import 'package:flutter/material.dart';
import 'package:frontend/models/section-item-description.dart';
import 'package:frontend/models/section-item.dart';
import 'package:frontend/views/description.dart';

class PositionView extends StatelessWidget {
  SectionItem data;

  PositionView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    List<SectionItemDescription> descriptions = this.data.descriptions ?? [];
    // return Text(this.data.title ?? "");
    return Card(
      child: Row(
        children: [
          PositionHeaderView(data: this.data),
          // ListView(
          //   shrinkWrap: true,
          //   physics: ScrollPhysics(),
          //   children:
          //       descriptions.map((e) => DescriptionView(data: e)).toList(),
          // ),
        ],
      ),
    );
  }
}

class PositionPicture extends StatelessWidget {
  late SectionItem data;

  PositionPicture({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.0,
      height: 96.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        ),
      ),
    );
  }
}

class PositionHeaderView extends StatelessWidget {
  late SectionItem data;

  PositionHeaderView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          PositionPicture(data: this.data),
          PositionInfoView(data: this.data)
        ],
      ),
    );
  }
}

class PositionInfoView extends StatelessWidget {
  SectionItem data;

  PositionInfoView({required this.data}) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(this.data.title ?? ""),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(this.data.organization ?? ""),
            Text(this.data.date ?? ""),
          ],
        ),
        Text(this.data.location ?? ""),
      ],
    );
  }
}
