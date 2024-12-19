// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:ecommerce_api/modules/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateUserDataScreen extends StatelessWidget {
  UpdateUserDataScreen({super.key});
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context);
    namecontroller.text = cubit.userModel!.name!;
    emailcontroller.text = cubit.userModel!.email!;
    phonecontroller.text = cubit.userModel!.phone!;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        if (state is UpdateUserSuccsessState) {
          Navigator.pop(context);
          showSnackBarItem(context, 'data update succsess', true);
        } else if (state is UpdateUserErrorsState) {
          showSnackBarItem(context, 'error is ${state.error}', false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('update data'),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: 'User name',
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
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'User email',
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
                    controller: phonecontroller,
                    decoration: InputDecoration(
                      hintText: 'User phone',
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
                        cubit.updateUserData(
                            name: emailcontroller.text,
                            email: emailcontroller.text,
                            phone: phonecontroller.text);
                      } else {
                        showSnackBarItem(
                            context, 'please enter all data', false);
                      }
                    },
                    child: state is UpdateUserLeadingState
                        ? Center(child: CircularProgressIndicator())
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
        );
      },
    );
  }
}
