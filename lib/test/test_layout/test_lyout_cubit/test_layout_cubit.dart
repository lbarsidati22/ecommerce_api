import 'dart:convert';

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:ecommerce_api/test/pages/test_cart_page.dart';
import 'package:ecommerce_api/test/pages/test_category_page.dart';
import 'package:ecommerce_api/test/pages/test_favorite_page.dart';
import 'package:ecommerce_api/test/pages/test_home.dart';
import 'package:ecommerce_api/test/pages/test_profile_page.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_state.dart';
import 'package:ecommerce_api/test/test_model/test_banners_model.dart';
import 'package:ecommerce_api/test/test_model/test_category_model.dart';
import 'package:ecommerce_api/test/test_model/test_prudact_model.dart';
import 'package:ecommerce_api/test/test_model/test_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TestLayoutCubit extends Cubit<TestLayoutState> {
  TestLayoutCubit() : super(TestLayouttInitialState());
  int currentIndex = 0;
  void changNavBar({required int index}) {
    currentIndex = index;
    emit(TestLayoutnavBarState());
  }

  List<Widget> testScreens = [
    TestHome(),
    TestCategoryPage(),
    TestFavoritePage(),
    TestCartPage(),
    TestProfilePage(),
  ];
  TestUserModel? testUserModel;
  void getUserData() async {
    try {
      emit(TestgetUserDataLeading());
      Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/profile'),
        headers: {
          'Authorization': testToken!,
        },
      );
      var responseBody = jsonDecode(response.body);
      print('profile response is $responseBody');
      if (responseBody['status'] == true) {
        testUserModel = TestUserModel.fromJson(data: responseBody['data']);

        emit(TestgetUserDataSuccsess());
      } else {
        emit(TestgetUserDataError(error: responseBody['message']));
      }
    } catch (e) {
      emit(
        TestgetUserDataError(
          error: e.toString(),
        ),
      );
    }
  }

  List<TestBannersModel> banners = [];
  void getBannersData() async {
    emit(TestgetBannersDataLeading());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/banners'),
    );
    var responseBody = jsonDecode(response.body);
    print('your banners response is $responseBody');
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']) {
        banners.add(
          TestBannersModel.formJson(data: item),
        );
      }
    } else {
      emit(
        TestgetBannersDataError(
          error: responseBody['message'],
        ),
      );
    }
  }

  List<TestCategoryModel> categories = [];
  void getCategoryData() async {
    emit(TestgetCategoryDataLeading());
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/categories'),
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(
          TestCategoryModel.fromJson(data: item),
        );
        print('response category is : $responseBody');
        emit(TestgetCategoryDataSuccsess());
      }
    } else {
      emit(
        TestgetCategoryDataError(
          error: responseBody['message'],
        ),
      );
    }
  }

  List<TestPrudactModel> prudacts = [];
  void getPrudactData() async {
    try {
      emit(TestgetPrudactDataLeading());
      Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/home'),
      );
      var responseBody = jsonDecode(response.body);
      print('response prudacts is : $responseBody');
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']['products']) {
          prudacts.add(TestPrudactModel.fromJson(data: item));
          emit(TestgetPrudactDataSuccsess());
        }
        print(responseBody['data']['products']);
      } else {
        emit(
          TestgetPrudactDataError(
            error: responseBody['message'],
          ),
        );
      }
    } catch (e) {
      emit(
        TestgetPrudactDataError(
          error: e.toString(),
        ),
      );
    }
  }
}
