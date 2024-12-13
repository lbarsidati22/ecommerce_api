// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
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
              ? Column(
                  children: [
                    Text('UserName : ${cubit.userModel!.name}'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Gmail : ${cubit.userModel!.email}')
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
