import 'package:vedio_player/model/youtube_video_playlist.dart';
import 'package:vedio_player/utils/base_clients.dart';
import 'package:http/http.dart' as http;
class YoutubeApi {
  final _baseClient=BaseClients();
  Future<Map<String,dynamic>> fetchVideoListApi(String videoId)async{
    http.Response? response=await _baseClient.get(videoId);
    Map<String, dynamic>  responseData={
      "responseCode":response!.statusCode
    };
     response.statusCode!;
    if(response.statusCode==200){
       responseData.putIfAbsent('response', ()=>youtubeVideoPlayListFromJson(response.body));
    }
    return responseData;
  }
  
}