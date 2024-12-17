// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_cubit.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestFavoritePage extends StatelessWidget {
  const TestFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestLayoutCubit, TestLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TestLayoutCubit>(context);
        return Scaffold(
          backgroundColor: mainBackgroundColor,
          body: cubit.favorits.isEmpty
              ? Center(child: Text('Don\'t have a favorite'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cubit.favorits.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shadowColor: Colors.white,
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 110,
                                        cubit.favorits[index].image!,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                '${cubit.favorits[index].name}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                  '${cubit.favorits[index].price}'),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: MaterialButton(
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              color: Colors.blue,
                                              onPressed: () {
                                                cubit.addOrRemoveFavorite(
                                                    prudactId: cubit
                                                        .favorits[index].id
                                                        .toString());
                                              },
                                              child: Text('Remove'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
