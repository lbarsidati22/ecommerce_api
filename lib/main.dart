// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_screen.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_api/modules/auth/login_screen.dart';
import 'package:ecommerce_api/modules/auth/register_screen.dart';
import 'package:ecommerce_api/modules/screens/home_screen.dart';
import 'package:ecommerce_api/modules/screens/profile_screen.dart';
import 'package:ecommerce_api/modules/screens/splash_screen.dart';
import 'package:ecommerce_api/my_bloc_observer.dart';
import 'package:ecommerce_api/shared/cache_helper.dart';
import 'package:ecommerce_api/test/pages/test_home.dart';
import 'package:ecommerce_api/test/pages/test_splash.dart';
import 'package:ecommerce_api/test/test_auth/cubit/cubit/test_auth_cubit.dart';
import 'package:ecommerce_api/test/test_auth/cubit/test_login.dart';
import 'package:ecommerce_api/test/test_auth/test_register.dart';
import 'package:ecommerce_api/test/test_helper/test_cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // await TestCacheHelper.cacheInite();
  // testToken = TestCacheHelper.getData(key: 'token');
  // print('your token is : $testToken');

  await CacheHelper.cacheInitialtion();
  token = CacheHelper.getCacheData(key: 'token');
  print('token is $token');
  runApp(MyApp());
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
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getUserData()
            ..getBannersData()
            ..getCategoryData()
            ..getPrudactData(),
        ),
        BlocProvider(
          create: (context) => TestAuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        //testToken != null && testToken != '' ? TestHome() : TestLogin()
        //token != null && token != '' ? HomeScreen() : LoginScreen()
        home: LayoutScreen(),
      ),
    );
  }
}
