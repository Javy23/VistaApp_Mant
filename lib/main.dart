import 'package:flutter/material.dart';
import 'package:mvp_all/pages/add.dart';
import 'package:mvp_all/pages/home.dart';
import 'package:mvp_all/pages/landing_page.dart';
import 'package:mvp_all/pages/login.dart';
import 'package:mvp_all/pages/on_boarding.dart';
import 'package:mvp_all/pages/progress_view.dart';
import 'package:mvp_all/pages/recuperar_password.dart';
import 'package:mvp_all/pages/registro.dart';
import 'package:mvp_all/splash/splas_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      //home: ProgressView(),
      initialRoute: '/login',
      routes: {
        '/Splash_View': (context) => const SplashView(),
        '/OnBoarding': (context) => const OnBoarding(),
        '/home': (context) => const HomePage(),
        '/registro': (context) => const Registro(),
        '/login': (context) => const Login(),
        '/recuperar': (context) => const Recuperar(),
        '/ProgressView': (context) => const ProgressView(),
        '/landing': (context) => const Landing(),
        '/add': (context) => const Add(),
      },
    );
  }
}
