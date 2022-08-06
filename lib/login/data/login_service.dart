import 'package:http/http.dart' as http;
import 'package:remote_ps/network/api_const.dart';

class LoginService {
  Future<http.Response> loginCall(String username, String password) async {
    return http.post(Uri.parse(ApiConst.base + ApiConst.login),
        headers: ApiConst.headers,
        body: {'email': username, 'password': password});
  }
}
