import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../network/api_response.dart';
import '../../data/user.dart';
import '../../viewmodel/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget getLoginWidget(BuildContext context, ApiResponse response) {
    User? user = response.data as User?;
    switch (response.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Center(
            child: Text((response.data as User?)?.accessToken ?? 'Done'));
      case Status.ERROR:
        return Center(
          child: Text(response.message ?? 'Please try again latter!!!'),
        );
      case Status.INITIAL:
        return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                  opacity: .7),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 270, 10, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'User name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder()),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Provider.of<LoginViewModel>(context, listen: false)
                                .login(nameController.text,
                                    passwordController.text);
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Does not have account?',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        TextButton(
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                    ),
                  ],
                )));
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
