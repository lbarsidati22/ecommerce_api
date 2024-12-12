// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_api/test/pages/test_home.dart';
import 'package:ecommerce_api/test/test_auth/cubit/cubit/test_auth_cubit.dart';
import 'package:ecommerce_api/test/test_auth/cubit/cubit/test_auth_state.dart';
import 'package:ecommerce_api/test/test_auth/cubit/test_login.dart';
import 'package:ecommerce_api/test/test_auth/test_register.dart';
import 'package:ecommerce_api/test/test_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestLogin extends StatelessWidget {
  TestLogin({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKry = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestAuthCubit, TestAuthState>(
      listener: (context, state) {
        if (state is TestLoginSuccsess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TestHome(),
            ),
          );
        } else if (state is TestLoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.red,
                child: Text(state.message),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        var testCubit = BlocProvider.of<TestAuthCubit>(context);
        return Form(
          key: formKry,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  testFormFaild(
                    controller: emailController,
                    icon: Icons.email,
                    hintText: 'Email',
                    label: 'Email',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  testFormFaild(
                    controller: passwordController,
                    icon: Icons.lock,
                    hintText: 'Password',
                    label: 'Password',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.grey,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {
                      if (formKry.currentState!.validate() == true) {
                        testCubit.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    child: state is TestLoginLeading
                        ? CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestRegister(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
