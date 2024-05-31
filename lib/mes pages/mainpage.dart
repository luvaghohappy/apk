import 'package:apk/add.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Mymainpage extends StatefulWidget {
  const Mymainpage({Key? key}) : super(key: key);

  @override
  State<Mymainpage> createState() => _MymainpageState();
}

class _MymainpageState extends State<Mymainpage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              children: [
                const Text(
                  'Mposholo',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 200),
                ),
                IconButton(
                  iconSize: 27,
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('Diversite'), // Diversity
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('Partage'), // Sharing
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text('Publicite'), // Advertising
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 3,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/photo.PNG'),
              ),
              title: Text('Happyluvagho@'),
              trailing: Icon(Icons.more_horiz_outlined),
            ),
            Row(
              children: const [
                Text(
                    'Bonjour les amis me voici de retour'), // Hello friends, here I am back
              ],
            ),
            Container(
              height: h * 0.3,
              width: w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/photo.PNG'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.black12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_down_alt_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.message_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/photo.PNG'),
              ),
              title: Text('Happyluvagho@'),
              trailing: Icon(Icons.more_horiz_outlined),
            ),
            Row(
              children: const [
                Text(
                    'Bonjour les amis ma musique'), // Hello friends, here is my music
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoFullScreenPage(controller: _controller),
                  ),
                );
              },
              child: Container(
                height: h * 0.3,
                width: w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : const Center(child: CircularProgressIndicator()),
                    IconButton(
                      iconSize: 64,
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            const ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/photo.PNG'),
              ),
              title: Text('Happyluvagho@'),
              trailing: Icon(Icons.more_horiz_outlined),
            ),
            Row(
              children: const [
                Text('Bonjour les amis voici mes nouveaux pub'),
              ],
            ),
            Container(
              height: h * 0.3,
              width: w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image.png'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: Colors.black12),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_down_alt_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.message_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                  ),
                  IconButton(
                    iconSize: 18,
                    color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Addpubli(),
          ));
        },
        backgroundColor: Colors.pink,
        child: const Icon(Icons.videocam, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class VideoFullScreenPage extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoFullScreenPage({Key? key, required this.controller})
      : super(key: key);

  @override
  _VideoFullScreenPageState createState() => _VideoFullScreenPageState();
}

class _VideoFullScreenPageState extends State<VideoFullScreenPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
    widget.controller.setLooping(true);
    widget.controller.play();
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    widget.controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            child: AspectRatio(
              aspectRatio: widget.controller.value.aspectRatio,
              child: VideoPlayer(widget.controller),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    // Action for favorite button
                  },
                  icon: const Icon(Icons.favorite_border_outlined,
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    // Action for dislike button
                  },
                  icon: const Icon(Icons.thumb_down_alt_outlined,
                      color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    // Action for comment button
                  },
                  icon: const Icon(Icons.message_outlined, color: Colors.white),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                IconButton(
                  iconSize: 25,
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
