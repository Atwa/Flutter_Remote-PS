import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_ps/login/view/screen/login_screen.dart';
import 'package:remote_ps/login/viewmodel/login_view_model.dart';
import 'package:remote_ps/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Media Player',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Remote PS'),
          ),
          body: Routes.loginRoute(context),
        ),
      ),
    );
  }
}
