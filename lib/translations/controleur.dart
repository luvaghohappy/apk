import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocaleController extends GetxController {
  void changeLocale(String langCode, String countryCode) {
    Locale locale = Locale(langCode, countryCode);
    Get.updateLocale(locale);
  }
}
