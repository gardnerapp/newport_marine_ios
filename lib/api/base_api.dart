import 'package:http/http.dart' as http;

//Mother Class for all API Request
//store urls
class BaseAPI{
//TODO use https
  static var baseUrl = "http://localhost:3000/api/";
  var createUserPath = baseUrl + "users";
  var createBoatPath = baseUrl + "boats";
  var loginPath = baseUrl + "login";
  var createAppointmentPath = baseUrl + "appointment";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}