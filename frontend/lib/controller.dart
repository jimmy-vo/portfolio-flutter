import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/environment.dart';
import 'package:frontend/models/section.dart';

class Controller with ChangeNotifier {
  Map<String, Section> sectionMap = {};
  List<Section> sections = [];
  bool isReady = false;

  Controller() {
    this.setUp().then((value) => notifyListeners());
  }

  void notify() {
    notifyListeners();
  }

  Future setUp() async {
    this.isReady = false;

    final String response = await rootBundle.loadString('assets/sections.json');
    Iterable<dynamic> decodedJson =
        await json.decode(response) as Iterable<dynamic>;

    this.sections = await decodedJson.map((e) => Section.fromJson(e)).toList();

    // filter out isConfigMatched == false
    this.sections.forEach((item) {
      item.items = item.items!
          .where((element) => Environment.isConfigMatched(element.config))
          .toList()
          .reversed
          .toList();
    });

    for (Section section in sections) {
      sectionMap.putIfAbsent(section.name as String, () => section);
    }
    this.isReady = true;
  }
}
