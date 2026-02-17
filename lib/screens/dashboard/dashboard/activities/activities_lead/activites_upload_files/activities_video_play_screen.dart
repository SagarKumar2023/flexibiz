import 'dart:io';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  final File videoFile;

  const VideoPlayScreen({super.key, required this.videoFile});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.file(widget.videoFile);

    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      await _controller.initialize();
      setState(() {});
      _controller.play();
    } catch (e) {
      debugPrint("Video init error: $e");
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: -8,
        backgroundColor: ColorUtils.primary,
        title: TextWidget(
          text: "video".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Center(
          child: _controller.value.isInitialized ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : TextWidget(
            text: "Loading...",
            fontSize: 15,
            textColor: ColorUtils.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100)),
        backgroundColor: ColorUtils.primary,
        onPressed:(){
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Image(
          image: AssetImage(_controller.value.isPlaying
              ? ImagesUtils.playAudioIcon:ImagesUtils.pauseAudioIcon),
          height: 20,
          color: ColorUtils.white,
        ),
      ),
    );
  }
}
