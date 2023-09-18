import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/bloc/register/register_bloc.dart';
import 'package:payment/pages/auth/auth_page.dart';
//import 'package:payment/pages/splash/splash_page.dart';
//import 'package:payment/pages/dashboard/dashboard_page.dart';
//import 'package:payment/pages/auth/auth_page.dart';
import 'package:payment/pages/utils/light_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: light,
        //home: const SplashPage(),
        home: const AuthPage(),
      ),
    );
  }
}
