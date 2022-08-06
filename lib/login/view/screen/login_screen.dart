import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../network/api_response.dart';
import '../../../utils/routes.dart';
import '../../data/user.dart';
import '../../viewmodel/login_view_model.dart';
import '../widget/login_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget getLoginWidget(BuildContext context, ApiResponse response) {
    User? user = response.data as User?;
    switch (response.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Center(
            child: Text((response.data as User?)?.accessToken ?? 'Done')
        );
      case Status.ERROR:
        return Center(
          child: Text(response.message ?? 'Please try again latter!!!'),
        );
      case Status.INITIAL:
        return const LoginWidget();
      default:
        return const Center(
          child: Text('Signing in'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse response = Provider.of<LoginViewModel>(context).response;
    return Column(
      children: <Widget>[
        Expanded(child: getLoginWidget(context, response)),
      ],
    );
  }
}
