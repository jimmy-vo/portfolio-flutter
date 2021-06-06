import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/models/section.dart';

class Controller with ChangeNotifier {
  Section? experiences = null;
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
    List<Section> sections =
        await decodedJson.map((e) => Section.fromJson(e)).toList();

    this.experiences =
        sections.firstWhereOrNull((e) => e.name == 'Work And Experience');

    this.isReady = true;
  }
}
