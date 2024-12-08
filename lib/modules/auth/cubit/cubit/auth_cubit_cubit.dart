import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_api/modules/auth/cubit/cubit/auth_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  //register
  void register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String imageUrl,
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
      emit(RegisterSeccuceState());
    } else {
      emit(
        RegisterErrorState(
          message: responseBody['message'],
        ),
      );
    }
  }
}
