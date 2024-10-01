import 'package:flutter/material.dart';
import 'package:vedio_player/constant/credential.dart';
import 'package:vedio_player/utils/api_services.dart';
import 'package:http/http.dart' as http;
class BaseClients extends ApiServices{
  http.Response customResponse = http.Response("Something went wrong", 1000);
  @override
  Future<http.Response?> get(String videoId) async{
    
   String url = "https://www.googleapis.com/youtube/v3/search""?key=${Credential.apiKey}""&channelId=${Credential.channalId}" "&part=snippet,id""&order=date" "&maxResults=50""&type=video";
try{
Uri uri=Uri.parse(url);
http.Response? response=await http.get(uri);
   return response;
}catch(e){
debugPrint(e.toString());
}
return customResponse;
  }


  }