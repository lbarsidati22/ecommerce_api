// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              'images/logo.svg',
              height: 60,
              color: mainColor,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: mainColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changBottomNav(index: index);
            },
            currentIndex: cubit.bottomIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_sharp,
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile'),
            ],
          ),
          body: cubit.myScreens[cubit.bottomIndex],
        );
      },
    );
  }
}
