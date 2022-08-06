import 'package:remote_ps/login/data/login_service.dart';
import 'package:remote_ps/login/data/user.dart';
import 'package:remote_ps/network/api_executor.dart';

class LoginRepository {
  final LoginService loginService = LoginService();

  Future<User> login(String username,String password) async {
    var response = await ApiExecutor.execute(() => loginService.loginCall(username, password));
    User user = User.fromJson(response['data']);
    return user;
  }
}
