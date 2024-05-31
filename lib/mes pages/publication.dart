import 'package:flutter/material.dart';

class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  // Variable d'état pour déterminer ce qui doit être affiché
  // 0: images, 1: vidéos, 2: publicités
  int _selectedContent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Text(
                  'Mon Compte',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 100),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/photo.PNG'),
          ),
          const Text('Happyluvagho@'),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: [
                Column(
                  children: const [
                    Text(
                      '353',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text('Amis')
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                Column(
                  children: const [
                    Text(
                      '353',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text('Like')
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                Column(
                  children: const [
                    Text(
                      '353',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text('Commentaires')
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'Live',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                IconButton(
                  iconSize: 20,
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                IconButton(
                  iconSize: 20,
                  onPressed: () {},
                  icon: const Icon(Icons.message_rounded),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedContent = 0; // Afficher les images
                  });
                },
                child: const Text('Image'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedContent = 2; // Afficher les publicités
                  });
                },
                child: const Text('Publicite'),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedContent = 1; // Afficher les vidéos
                  });
                },
                child: const Text('Vidéo'),
              ),
            ],
          ),
          Expanded(
            child: _selectedContent == 0
                ? ImageContent()
                : (_selectedContent == 1 ? VideoContent() : PubliciteContent()),
          ),
        ],
      ),
    );
  }
}

class ImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Card(
              child: Image.network(
                'https://png.pngtree.com/thumb_back/fh260/background/20230511/pngtree-nature-background-sunset-wallpaer-with-beautiful-flower-farms-image_2592160.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                iconSize: 15,
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Logique pour supprimer l'élément
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class PubliciteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Card(
              child: Image.network(
                'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/sport-shoes-collection-ad-design-template-00716ff715301f2562b692e400094406_screen.jpg?ts=1651738700',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                iconSize: 15,
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Logique pour supprimer l'élément
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class VideoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Card(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.black,
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Vidéo ${index + 1}'),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                iconSize: 15,
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Logique pour supprimer l'élément
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
