import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apk/translations/controleur.dart';

class Leslangues extends StatefulWidget {
  const Leslangues({Key? key}) : super(key: key);

  @override
  State<Leslangues> createState() => _LeslanguesState();
}

class _LeslanguesState extends State<Leslangues> {
  // Liste des langues prises en charge
  final List<Map<String, String>> languages = [
    {'name': 'Français', 'code': 'fr', 'countryCode': 'FR'},
    {'name': 'English', 'code': 'en', 'countryCode': 'US'},
    {'name': 'Swahili', 'code': 'sw', 'countryCode': 'KE'},
  ];

  // Langue sélectionnée par défaut
  Map<String, String> selectedLanguage = {
    'name': 'Français',
    'code': 'fr',
    'countryCode': 'FR'
  };

  final LocaleController localeController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'choose_language'.tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: languages.map((language) {
                return CheckboxListTile(
                  title: Text(language['name']!),
                  value: selectedLanguage['code'] == language['code'],
                  onChanged: (bool? value) {
                    if (value == true) {
                      setState(() {
                        selectedLanguage = language;
                      });
                      // Appel de la fonction pour changer la langue de l'application
                      localeController.changeLocale(
                          language['code']!, language['countryCode']!);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
