// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_cubit.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_state.dart';
import 'package:ecommerce_api/modules/auth/register_screen.dart';
import 'package:ecommerce_api/modules/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/Mauritania-1.jpg'),
              ),
            ),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSeccuceState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                } else if (state is LoginErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Container(
                        color: Colors.red,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(state.message),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 50),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'login to go your shop',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: formKey,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              myFormFeild(
                                controller: emailController,
                                iconData: Icons.email,
                                label: 'Gmail',
                                type: TextInputType.emailAddress,
                                hintText: 'Email',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              myFormFeild(
                                controller: passwordController,
                                iconData: Icons.lock,
                                label: 'Password',
                                type: TextInputType.number,
                                hintText: 'Password',
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              MaterialButton(
                                padding: EdgeInsets.all(10),
                                color: Colors.green,
                                minWidth: double.infinity,
                                onPressed: () {
                                  if (formKey.currentState!.validate() ==
                                      true) {
                                    BlocProvider.of<AuthCubit>(context).login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: state is LoginLeadinglState
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t hove an account ? ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: 'Forget your password ?  ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(text: 'click herer'),
                              ]))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
