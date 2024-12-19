// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:ecommerce_api/modules/screens/reset_password_screen.dart';
import 'package:ecommerce_api/modules/screens/update_user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<LayoutCubit>(context);
        return Scaffold(
          body: cubit.userModel != null
              ? Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.network(
                          height: 100,
                          width: 100,
                          cubit.userModel!.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('UserName : ${cubit.userModel!.name}'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Gmail : ${cubit.userModel!.email}'),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text('Edit Password'),
                      ),
                      MaterialButton(
                        color: Colors.white,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateUserDataScreen(),
                            ),
                          );
                        },
                        child: Text('Edit Profile'),
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
