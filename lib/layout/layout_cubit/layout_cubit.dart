import 'dart:convert';

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/modules/screens/cart_screen.dart';
import 'package:ecommerce_api/modules/screens/category_screen.dart';
import 'package:ecommerce_api/modules/screens/favorite_screen.dart';
import 'package:ecommerce_api/modules/screens/home_screen.dart';
import 'package:ecommerce_api/modules/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());
  List<Widget> myScreens = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int bottomIndex = 0;
  void changBottomNav({required int index}) {
    bottomIndex = index;
    emit(ChangNavBarSatate());
  }

  UserModel? userModel;
  void getUserData() async {
    try {
      emit(GetUserLeadingSatate());
      http.Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/profile'),
        headers: {
          'Authorization': token!,
          'lang': 'ar',
        },
      );
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        print('response is :$responseData');
        userModel = UserModel.formJson(data: responseData['data']);
        emit(GetUserSuccsessSatate());
      } else {
        print('response is :$responseData');
        emit(
          GetUserErrorSatate(error: responseData['message']),
        );
      }
    } catch (e) {
      emit(
        GetUserErrorSatate(
          error: e.toString(),
        ),
      );
    }
  }
}
