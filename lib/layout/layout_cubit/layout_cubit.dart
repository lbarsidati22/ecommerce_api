import 'dart:convert';

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:ecommerce_api/model/banner_model.dart';
import 'package:ecommerce_api/model/category_model.dart';
import 'package:ecommerce_api/model/prudact_model.dart';
import 'package:ecommerce_api/model/user_model.dart';
import 'package:ecommerce_api/modules/screens/cart_screen.dart';
import 'package:ecommerce_api/modules/screens/category_screen.dart';
import 'package:ecommerce_api/modules/screens/favorite_screen.dart';
import 'package:ecommerce_api/modules/screens/home_screen.dart';
import 'package:ecommerce_api/modules/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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

  List<BannerModel> banners = [];
  void getBannersData() async {
    emit(GetBannersLeadingSatate());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(
          BannerModel.fromJson(data: item),
        );
      }
      emit(GetBannersSuccsessSatate());
      print('your banners response : $responseBody');
    } else {
      emit(
        GetBannersErrorSatate(
          error: responseBody['message'],
        ),
      );
    }
  }

  List<CategoryModel> categories = [];
  void getCategoryData() async {
    emit(GetCategoryLeadingSatate());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/categories'),
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(
          CategoryModel.fromJson(data: item),
        );
      }
      emit(GetCategorySuccsessSatate());
      print('your category response : $responseBody');
    } else {
      emit(
        GetBannersErrorSatate(
          error: responseBody['message'],
        ),
      );
    }
  }

  List<PrudactModel> prudacts = [];
  void getPrudactData() async {
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/home'),
      headers: {
        'Authorization': token!,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        prudacts.add(
          PrudactModel.fromJson(data: item),
        );
      }
      print('prudact is here : $responseBody');
      emit(GetPrudactSuccsessSatate());
    } else {
      print('prudact is error : $responseBody');
      emit(GetPrudactErrorSatate());
    }
  }
}