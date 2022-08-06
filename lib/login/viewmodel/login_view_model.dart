import 'package:flutter/material.dart';

import '../../network/api_response.dart';
import '../data/login_repository.dart';
import '../data/user.dart';

class LoginViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  login(String username, String password) async {
    _apiResponse = ApiResponse.loading('Signing in');
    notifyListeners();
    try {
      User user = await LoginRepository().login(username, password);
      _apiResponse = ApiResponse.completed(user);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
