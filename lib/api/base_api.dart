import 'package:http/http.dart' as http;
//Mother Class for all API Request
class BaseAPI{
//TODO use https
  String baseUrl = "http://localhost:3000/api/";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };


  //methods for to && from JSON
}