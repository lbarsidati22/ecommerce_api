// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  myFormFeild(
                    controller: nameController,
                    iconData: Icons.person,
                    label: 'User',
                    type: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  myFormFeild(
                    controller: emailController,
                    iconData: Icons.mail,
                    label: 'Email',
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  myFormFeild(
                    controller: passwordController,
                    iconData: Icons.lock,
                    label: 'Password',
                    type: TextInputType.number,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  myFormFeild(
                    controller: phoneController,
                    iconData: Icons.phone,
                    label: 'Phone',
                    type: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
