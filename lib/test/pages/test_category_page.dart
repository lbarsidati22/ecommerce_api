// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_cubit.dart';
import 'package:ecommerce_api/test/test_model/test_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCategoryPage extends StatelessWidget {
  const TestCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TestCategoryModel> categoryData =
        BlocProvider.of<TestLayoutCubit>(context).categories;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: GridView.builder(
          itemCount: categoryData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              shadowColor: Colors.white,
              color: Colors.grey.shade900,
              child: Column(
                children: [
                  Text(
                    categoryData[index].title!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        categoryData[index].image!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
