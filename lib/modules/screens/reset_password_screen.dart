// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (state is ChangPasswordSuccsessState) {
          showSnackBarItem(context, 'change password Succsess', true);
          Navigator.pop(context);
        } else if (state is ChangPasswordErrorsState) {
          showSnackBarItem(context, state.error, false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Chang Password'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                      controller: currentPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Current password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                      controller: newPasswordController,
                      decoration: InputDecoration(
                        hintText: 'new password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      color: Colors.grey,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minWidth: double.infinity,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (currentPasswordController.text.trim() ==
                              currentPassword) {
                            if (newPasswordController.text.length >= 6) {
                              cubit.changePassword(
                                userCurrentPassword: currentPassword!,
                                newPassword: newPasswordController.text.trim(),
                              );
                            } else {
                              showSnackBarItem(context,
                                  'password most br at lest 6 numbers', false);
                            }
                          } else {
                            showSnackBarItem(
                                context,
                                'please verefi ypur password and try again leter',
                                false);
                          }
                        }
                      },
                      child: state is ChangPasswordLeadingState
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'update',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void showSnackBarItem(
    BuildContext context, String message, bool forSuccsessOrError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: forSuccsessOrError ? Colors.green : Colors.red,
      content: Text(message),
    ),
  );
}
