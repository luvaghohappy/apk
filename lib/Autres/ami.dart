import 'package:flutter/material.dart';

class AMIS extends StatefulWidget {
  const AMIS({super.key});

  @override
  State<AMIS> createState() => _AMISState();
}

class _AMISState extends State<AMIS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40),
          ),
          const Text(
            'Vos Amis',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ListTile(
            leading: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/photo.PNG'),
            ),
            title: const Expanded(
              child: Text(
                'happyluvagho@',
                overflow: TextOverflow
                    .ellipsis, 
              ),
            ),
            subtitle: const Text('Amis'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  iconSize: 15,
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    // Action pour le bouton message
                  },
                ),
                IconButton(
                  iconSize: 15,
                  color: Colors.red,
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Action pour le bouton supprimer
                  },
                ),
                IconButton(
                  iconSize: 15,
                  color: Colors.red,
                  icon: const Icon(Icons.block),
                  onPressed: () {
                    // Action pour le bouton bloquer
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
