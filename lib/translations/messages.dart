import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Messages extends Translations {
  Map<String, Map<String, String>> translations = {};

  Messages() {
    loadTranslations();
  }

  Future<void> loadTranslations() async {
    final enUS = await rootBundle.loadString('assets/lang/en_US.json');
    final frFR = await rootBundle.loadString('assets/lang/fr_FR.json');
    final swKE = await rootBundle.loadString('assets/lang/sw_KE.json');

    translations = {
      'en_US': Map<String, String>.from(json.decode(enUS)),
      'fr_FR': Map<String, String>.from(json.decode(frFR)),
      'sw_KE': Map<String, String>.from(json.decode(swKE)),
    };
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
