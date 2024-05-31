import 'package:apk/Autres/langue.dart';
import 'package:flutter/material.dart';

import '../Autres/ami.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'COMPTES',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/photo.PNG'),
              ),
              title: const Text('Happyluvagho@'),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 60),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: const [
                  Text(
                    'Parametres et Confidentialite',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  Icon(Icons.settings)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15,
                child: Icon(Icons.security_outlined),
              ),
              title: Text('Securite du compte'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Leslangues(),
                ));
              },
              leading: const CircleAvatar(
                radius: 15,
                child: Icon(Icons.language_outlined),
              ),
              title: const Text('Langue'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 15,
                child: Icon(Icons.policy_outlined),
              ),
              title: Text('Politique'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 88, 6, 6),
                radius: 15,
                child: Icon(Icons.archive_outlined),
              ),
              title: Text('Archive'),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AMIS(),
                ));
              },
              leading: const CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                radius: 15,
                child: Icon(Icons.person_4_outlined),
              ),
              title: const Text('Vos amis'),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 15,
                child: Icon(Icons.apple_outlined),
              ),
              title: Text("A propos d'Apk"),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 15,
                child: Icon(Icons.account_circle),
              ),
              title: Text('Changer compte'),
            ),
          ],
        ),
      ),
    );
  }
}
