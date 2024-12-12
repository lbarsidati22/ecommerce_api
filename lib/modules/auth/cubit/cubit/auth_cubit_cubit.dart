import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_state.dart';
import 'package:ecommerce_api/shared/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  //register
  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLeadinglState());
    Response response = await http
        .post(Uri.parse('https://student.valuxapps.com/api/register'), body: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      print(responseBody);
      emit(RegisterSeccuceState());
    } else {
      emit(
        RegisterErrorState(
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
    emit(LoginLeadinglState());
    try {
      Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          print('User login success and his data is : $data');
          CacheHelper.setCacheToData(
            key: 'token',
            value: data['data']['token'],
          );
          emit(LoginSeccuceState());
        } else {
          print('User error login and his data is : ${data['message']}');
          emit(
            LoginErrorState(
              message: data['message'],
            ),
          );
        }
      }
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }
}
