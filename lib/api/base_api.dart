import 'package:http/http.dart' as http;

//Mother Class for all API Request URL's
class BaseAPI{
//TODO use https
// Production API http://g2po.hatchboxapp.com/api/
// dev http://localhost:3000/api/

  static var baseUrl = "http://localhost:3000/api/";
  var resetPasswordPath = "http://localhost:3000/password_resets"; // POST with email of user
  var createUserPath = baseUrl + "users";
  var createBoatPath = baseUrl + "boats";
  var loginPath = baseUrl + "login";
  var createAppointmentPath = baseUrl + "appointments";
  var userAppointmentsIndex = baseUrl + "users/";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}