import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Addpubli extends StatefulWidget {
  const Addpubli({Key? key}) : super(key: key);

  @override
  State<Addpubli> createState() => _AddpubliState();
}

class _AddpubliState extends State<Addpubli> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  File? _videoFile;
  VideoPlayerController? _videoController;
  bool _isCameraInitialized = false;
  bool _isRecording = false;
  bool _isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final initialCamera = _isFrontCamera
          ? cameras.firstWhere(
              (camera) => camera.lensDirection == CameraLensDirection.front)
          : cameras.first;

      _controller = CameraController(initialCamera, ResolutionPreset.high);
      _initializeControllerFuture = _controller.initialize();
      await _initializeControllerFuture;

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      setState(() {
        _imageFile = File(image.path);
        _videoFile = null;
        _videoController?.dispose();
        _videoController = null;
      });
    } catch (e) {
      print(e);
    }
  }

  void _recordVideo() {
    if (!_isRecording) {
      _startRecording();
    } else {
      _stopRecording();
    }
  }

  void _startRecording() async {
    try {
      await _initializeControllerFuture;
      final Directory tempDir = await getTemporaryDirectory();
      final String tempPath = tempDir.path;
      final String videoPath = '$tempPath/${DateTime.now()}.mp4';
      await _controller.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
    } catch (e) {
      print(e);
    }
  }

  void _stopRecording() async {
    if (_isRecording) {
      try {
        final video = await _controller.stopVideoRecording();
        setState(() {
          _videoFile = File(video.path);
          _isRecording = false;
        });
        // Ajouter ici la logique pour stocker le fichier vidéo dans la base de données
        // par exemple, vous pouvez utiliser le chemin `_videoFile!.path`
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _videoFile = null;
        _videoController?.dispose();
        _videoController = null;
      });
    }
  }

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
        _imageFile = null;
        _videoController = VideoPlayerController.file(_videoFile!)
          ..initialize().then((_) {
            setState(() {});
            _videoController!.play();
          });
      });
    }
  }

  void _toggleCamera() {
    setState(() {
      _isFrontCamera = !_isFrontCamera;
      _initializeCamera();
    });
  }

  Widget _previewWidget() {
    if (_imageFile != null) {
      return Image.file(_imageFile!);
    } else if (_videoFile != null &&
        _videoController != null &&
        _videoController!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: VideoPlayer(_videoController!),
      );
    } else {
      return _isCameraInitialized
          ? CameraPreview(_controller)
          : const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _previewWidget(),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: const Icon(Icons.camera_alt),
                  onPressed: _takePicture,
                  tooltip: 'Prendre une photo',
                ),
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: _isRecording
                      ? const Icon(Icons.stop, color: Colors.red)
                      : const Icon(Icons.videocam),
                  onPressed: _recordVideo,
                  tooltip: _isRecording
                      ? 'Arrêter l\'enregistrement'
                      : 'Enregistrer une vidéo',
                ),
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: const Icon(Icons.photo),
                  onPressed: _pickImage,
                  tooltip: 'Choisir une image',
                ),
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: const Icon(Icons.switch_camera),
                  onPressed: _toggleCamera,
                  tooltip: 'Changer de caméra',
                ),
                // Bouton d'envoi de données
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Ajouter ici la logique pour envoyer les données dans la base de données
                  },
                  tooltip: 'Envoyer les données dans la base de données',
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _stopRecording,
        backgroundColor: Colors.pink,
        child: const Icon(Icons.stop, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
