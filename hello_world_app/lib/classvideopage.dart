import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ClassVideoPage extends StatefulWidget {
  const ClassVideoPage({Key? key}) : super(key: key);

  @override
  State<ClassVideoPage> createState() => _ClassVideoPageState();
}

class _ClassVideoPageState extends State<ClassVideoPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      _videoPlayerController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/flutterapitest12122002.appspot.com/o/videos%2FWhatsApp%20Video%202024-09-07%20at%207.41.59%20AM.mp4?alt=media&token=190d81ed-5bab-43fe-8409-e3fc97a54af5',
      );

      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        autoPlay: false,
        looping: false,
        showControlsOnInitialize: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.blue,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.grey.shade300,
        ),
        placeholder: Container(
          color: Colors.grey[200],
          child: const Center(
            child:
                Icon(Icons.play_circle_outline, size: 64, color: Colors.grey),
          ),
        ),
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
      );

      setState(() {
        _isInitialized = true;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error loading video: $error';
        print('Error initializing video player: $error');
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Widget _buildVideoPlayer() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Text(
          _errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (_isInitialized && _chewieController != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Chewie(controller: _chewieController!),
      );
    }

    return const Center(
      child: Text('Video not available'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Class Video",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Video Player
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: _buildVideoPlayer(),
            ),
            const SizedBox(height: 16),

            // Equipment Tags
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text("Exercise Ball")),
                Chip(label: Text("2 x Fusion Balls")),
                Chip(label: Text("Yoga Mat")),
              ],
            ),
            const SizedBox(height: 16),

            // Video description and preparation text
            const Text(
              "23 minutes - Equipment Used",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "The video for this class runs for 23 minutes, but we recommend setting aside 35-40 minutes to fully engage with the session. This additional time allows you to comfortably repeat exercises as needed.",
            ),
            const SizedBox(height: 16),
            const Text(
              "This session is crafted to introduce young dancers to the core elements of ballet technique...",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
