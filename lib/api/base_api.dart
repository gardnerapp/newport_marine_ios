import 'package:http/http.dart' as http;

//Mother Class for all API Request URL's
class BaseAPI{

// Production API https://newportmarine.app
// dev http://localhost:3000/api/

  static var baseUrl = "https://newportmarine.app/api/";
  var resetPasswordPath = "https://newportmarine.app/password_resets"; // POST with email of user
  var createUserPath = baseUrl + "users";
  var createBoatPath = baseUrl + "boats";
  var loginPath = baseUrl + "login";
  var createAppointmentPath = baseUrl + "appointments";
  var userAppointmentsIndex = baseUrl + "users/";

  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}