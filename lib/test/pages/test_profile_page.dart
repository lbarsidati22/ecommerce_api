// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_cubit.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestProfilePage extends StatelessWidget {
  const TestProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestLayoutCubit, TestLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TestLayoutCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${cubit.testUserModel!.name}'),
            Text('${cubit.testUserModel!.email}'),
          ],
        );
      },
    );
  }
}
