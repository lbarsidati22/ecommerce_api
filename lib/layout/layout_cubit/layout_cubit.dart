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
import 'package:ecommerce_api/shared/cache_helper.dart';
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
  Future<void> getUserData() async {
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
        //  print('response is :$responseData');
        userModel = UserModel.formJson(data: responseData['data']);
        emit(GetUserSuccsessSatate());
      } else {
        //  print('response is :$responseData');
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
        headers: {
          'lang': "en",
        });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['data']) {
        categories.add(
          CategoryModel.fromJson(data: item),
        );
      }
      emit(GetCategorySuccsessSatate());
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
        'lang': "en",
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['products']) {
        prudacts.add(
          PrudactModel.fromJson(data: item),
        );
      }

      emit(GetPrudactSuccsessSatate());
    } else {
      print('prudact is error : $responseBody');
      emit(GetPrudactErrorSatate());
    }
  }

  List<PrudactModel> fillterAllPrudacts = [];
  void filterPrudact({required String input}) {
    fillterAllPrudacts = prudacts
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FillterPrudactSuccsesState());
  }

  List<PrudactModel> favorits = [];
  Set<String> favoritsID = {};
  Future<void> getFavorite() async {
    favorits.clear();
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/favorites'),
      headers: {
        "lang": "en",
        "Authorization": token!,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      emit(GetFavoriteSuccsessState());
      for (var item in responseBody['data']['data']) {
        // print('favorite response is ${responseBody['data']}');
        favorits.add(PrudactModel.fromJson(data: item['product']));
        favoritsID.add(item['product']['id'].toString());
      }
      print('your favorite number is ${favorits.length}');
    } else {
      emit(GetFavoriteErrorState());
    }
  }

  void addOrRemoveFavorite({required String prudactId}) async {
    Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {
          'Authorization': token!,
          'lang': 'en',
        },
        body: {
          'product_id': prudactId,
        });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      if (favoritsID.contains(prudactId) == true) {
        favoritsID.remove(prudactId);
      } else {
        favoritsID.add(prudactId);
      }
      await getFavorite();
      emit(AddOrRemoveFavoriteSuccessState());
    } else {
      emit(AddOrRemoveFavoriteErrorState());
    }
  }

  int totalPrice = 0;
  List<PrudactModel> carts = [];
  Set<String> cartsID = {};
  Future<void> getCarts() async {
    carts.clear();
    Response response = await http.get(
      Uri.parse('https://student.valuxapps.com/api/carts'),
      headers: {
        'lang': 'en',
        'Authorization': token!,
      },
    );
    var responseBody = jsonDecode(response.body);
    totalPrice = responseBody['data']['total'].toInt();
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['cart_items']) {
        cartsID.add(item['product']['id'].toString());
        carts.add(PrudactModel.fromJson(data: item['product']));
      }
      totalPrice = responseBody['data']['total'];
      //succcess
      print('carts lingth is : ${carts.length}');
      emit(GetCartsSuccsessState());
    } else {
      //error
      emit(GetCartsErrorState());
    }
  }

  void addOrRemoveCarts({required String id}) async {
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/carts'),
      headers: {
        'Authorization': token!,
      },
      body: {
        'product_id': id,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      cartsID.contains(id) == true ? cartsID.remove(id) : cartsID.add(id);
      //succsess
      await getCarts();
      emit(AddOrRemoveCartsSuccessState());
    } else {
      emit(AddOrRemoveCartsErrorState());
      //filed
    }
  }

  void changePassword({
    required String userCurrentPassword,
    required String newPassword,
  }) async {
    emit(ChangPasswordLeadingState());
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/change-password'),
      headers: {
        'Authorization': token!,
        'lang': 'en',
      },
      body: {
        'current_password': userCurrentPassword,
        'new_password': newPassword,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (responseBody['status'] == true) {
        await CacheHelper.setCacheToData(key: 'password', value: newPassword);
        currentPassword = await CacheHelper.getCacheData(key: 'password');
        emit(ChangPasswordSuccsessState());
      } else {
        emit(ChangPasswordErrorsState(
            error: 'error is ${responseBody['message']}'));
      }
    } else {
      emit(ChangPasswordErrorsState(
          error: 'something rong , try again leter !'));
    }
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      Response response = await http.put(
        Uri.parse('https://student.valuxapps.com/api/update-profile'),
        headers: {
          'Authorization': token!,
        },
        body: {
          'name': name,
          'phone': phone,
          'email': phone,
        },
      );
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        emit(UpdateUserSuccsessState());
        getUserData();
      } else {
        emit(UpdateUserErrorsState(error: responseBody['message']));
      }
    } catch (e) {
      emit(UpdateUserErrorsState(error: e.toString()));
    }
  }
}
