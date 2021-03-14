import 'package:http/http.dart' as http;

//Mother Class for all API Request URL's
class BaseAPI{
//TODO use https
  static var baseUrl = "http://g2po.hatchboxapp.com/api/";
  var createUserPath = baseUrl + "users";
  var createBoatPath = baseUrl + "boats";
  var loginPath = baseUrl + "login";
  var createAppointmentPath = baseUrl + "appointments";
  var resetPasswordPath = baseUrl + "password_resets"; // POST with email of user
  var userAppointmentsIndex = baseUrl + "users/";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}