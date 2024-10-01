import 'package:get/get.dart';
import 'package:vedio_player/model/youtube_video_playlist.dart';
import 'package:vedio_player/services/youtube_api.dart';
class YoutubeController extends  GetxController{
RxList<VideoItem> playlist=<VideoItem>[].obs;
  RxString forbiddenError="".obs;

Future<void> getSuggestedVideoIds(String videoId) async {
   Map<String, dynamic>  responseData=await YoutubeApi().fetchVideoListApi(videoId);
   int statusCode=responseData["responseCode"];
   print(statusCode);
  if (statusCode == 200) { 
    var data= responseData['response'];
    YoutubeVideoPlayList youtubeVideoPlayList =  data;
  playlist.value=  youtubeVideoPlayList.items;
     print( youtubeVideoPlayList.items);
     print(youtubeVideoPlayList.items);
     print(youtubeVideoPlayList);
    forbiddenError.value="";
  }else if(statusCode==403){
  forbiddenError.value="The request cannot be completed because you have exceeded";
  }
   else {
    throw Exception('Failed to load related videos');
  }
}

}