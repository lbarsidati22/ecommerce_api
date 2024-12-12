import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_api/test/test_auth/cubit/cubit/test_auth_state.dart';
import 'package:ecommerce_api/test/test_helper/test_cache_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TestAuthCubit extends Cubit<TestAuthState> {
  TestAuthCubit() : super(TestAuthInitial());
  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(TestRegisterLeading());
    Response response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/register'),
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      print(responseBody);
      emit(TestRegisterSuccsess());
    } else {
      emit(
        TestRegisterError(
          message: responseBody['message'],
        ),
      );
      print(responseBody);
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(TestLoginLeading());
      Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == true) {
          print('login is true and this your data : $responseBody');
          TestCacheHelper.setData(
            key: 'token',
            value: responseBody['data']['token'],
          );
          emit(TestLoginSuccsess());
        } else {
          print(
              'login is true and this your data : ${responseBody['message']}');
          emit(
            TestLoginError(
              message: responseBody['message'],
            ),
          );
        }
      }
    } catch (e) {
      emit(
        TestLoginError(
          message: e.toString(),
        ),
      );
    }
  }
}
