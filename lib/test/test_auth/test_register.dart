// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/test/test_auth/cubit/cubit/test_auth_cubit.dart';
import 'package:ecommerce_api/test/test_auth/cubit/cubit/test_auth_state.dart';
import 'package:ecommerce_api/test/test_auth/cubit/test_login.dart';
import 'package:ecommerce_api/test/test_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestRegister extends StatelessWidget {
  TestRegister({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestAuthCubit, TestAuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var testCubit = BlocProvider.of<TestAuthCubit>(context);
        return Form(
          key: formKey,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  testFormFaild(
                    controller: nameController,
                    icon: Icons.email,
                    hintText: 'UserName',
                    label: 'UserName',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  testFormFaild(
                    controller: phoneController,
                    icon: Icons.phone,
                    hintText: 'Phone',
                    label: 'Phone',
                  ),
                  SizedBox(
                    height: 10,
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
                      if (formKey.currentState!.validate()) {
                        testCubit.register(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text);
                      }
                    },
                    child: state is TestRegisterLeading
                        ? CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : Text(
                            'Sign Up',
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
                        'Already have an account ?',
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
                              builder: (context) => TestLogin(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
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
