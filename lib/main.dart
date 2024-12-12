// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_api/modules/auth/login_screen.dart';
import 'package:ecommerce_api/modules/auth/register_screen.dart';
import 'package:ecommerce_api/modules/screens/splash_screen.dart';
import 'package:ecommerce_api/my_bloc_observer.dart';
import 'package:ecommerce_api/test/pages/test_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
