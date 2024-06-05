import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'translations/messages.dart';
import 'firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Créez une instance de Messages pour charger les traductions
  final messages = Messages();
  await messages.loadTranslations();
  runApp(MyApp(messages: messages));
}

class MyApp extends StatelessWidget {
  final Messages messages;

  const MyApp({required this.messages, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      translations: messages,
      locale: const Locale('fr', 'FR'), // Langue par défaut
      fallbackLocale: const Locale('en', 'US'),
      home: const Homepage(),
    );
  }
}
