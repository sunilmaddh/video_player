import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vedio_player/controller/youtube_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoScreen extends StatefulWidget {
 const YoutubeVideoScreen({super.key, required this.videoId,});
final String videoId;

  @override
  // ignore: library_private_types_in_public_api
  _YoutubeVideoScreenState createState() => _YoutubeVideoScreenState();
}
class _YoutubeVideoScreenState extends State<YoutubeVideoScreen> {
  final _videoCotroller=Get.find<YoutubeController>();
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
     _videoCotroller.getSuggestedVideoIds(widget.videoId);
    _controller = YoutubePlayerController(
      initialVideoId:widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    _videoCotroller.playlist.clear();
    _videoCotroller.forbiddenError.value="";
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Player'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            const SizedBox(height: 50,),
          Obx(()=>  _buildSuggestedVideos()),
          ],
        ),
      ),
    );
  }
  Widget _buildSuggestedVideos() {
    if (_videoCotroller.forbiddenError.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(_videoCotroller.forbiddenError.value)),
      );
    } else {
      return ListView.builder(
      shrinkWrap: true,
      itemCount:_videoCotroller.playlist.length,
      itemBuilder: (context, index) {
        final videoId = _videoCotroller.playlist[index].id.videoId;
        final snapshot=_videoCotroller.playlist[index].snippet;
        final tumbnail=_videoCotroller.playlist[index].snippet.thumbnails;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(tumbnail.thumbnailsDefault.url),
            title: Text(snapshot.title),
            onTap: () {
               _controller.load(videoId!);
              
            },
          ),
        );
      },
    );
    }
  }

}
