import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vedio_player/controller/youtube_controller.dart';
import 'package:vedio_player/view/youtube_video_screen.dart';
void main() {
  Get.put(YoutubeController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const YoutubeVideoScreen(videoId: "kiHyqKwuPt4")
    );
  }
}

