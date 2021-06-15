import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:frontend/controllers/base.controller.dart';
import 'package:frontend/environment.dart';
import 'package:frontend/models/contact.dart';
import 'package:frontend/models/section.dart';

class ProfileController extends BaseController {
  List<Section> sections = [];
  late Contact contact;
  late Section experience;
  late Section achivements;
  late Section skills;
  late Section education;
  late Section activities;
  bool isReady = false;

  ProfileController() {
    this.load().then((value) => notifyListeners());
  }

  void notify() {
    notifyListeners();
  }

  Future load() async {
    this.isReady = false;

    await loadSections();
    await loadContact();
    this.experience = sections.firstWhere((element) => element.id == 1);
    this.education = sections.firstWhere((element) => element.id == 3);
    this.skills = sections.firstWhere((element) => element.id == 2);
    this.achivements = sections.firstWhere((element) => element.id == 4);
    this.activities = sections.firstWhere((element) => element.id == 5);

    this.isReady = true;
  }

  Future loadContact() async {
    final String response = await rootBundle.loadString('assets/contact.json');
    dynamic decodedJson = await json.decode(response) as dynamic;

    this.contact = await Contact.fromJson(decodedJson);

    // filter out isConfigMatched == false
    this.contact.social = this
        .contact
        .social
        .where((element) => Environment.isConfigMatched(element.config))
        .toList();
  }

  Future loadSections() async {
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
  }
}
