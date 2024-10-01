import 'package:http/http.dart' as http;

abstract class ApiServices{
  Future<http.Response?> get(String videoId);
}