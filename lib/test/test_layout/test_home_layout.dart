// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/test/pages/test_home.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_cubit.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestHomeLayout extends StatelessWidget {
  const TestHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestLayoutCubit, TestLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TestLayoutCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainBackgroundColor,
            title: InkWell(
              splashColor: Colors.grey,
              onTap: () {},
              child: SvgPicture.asset(
                'images/logo.svg',
                height: 60,
                color: Colors.white,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changNavBar(index: index);
            },
            selectedItemColor: primaryColor,
            unselectedItemColor: secondaryColor,
            backgroundColor: bodyBackgroundColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
          backgroundColor: mainBackgroundColor,
          body: cubit.testScreens[cubit.currentIndex],
        );
      },
    );
  }
}
