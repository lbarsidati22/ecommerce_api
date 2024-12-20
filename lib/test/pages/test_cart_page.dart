// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_cubit.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCartPage extends StatelessWidget {
  const TestCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestLayoutCubit, TestLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TestLayoutCubit>(context);
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cubit.carts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Card(
                      elevation: 6,
                      shadowColor: Colors.white,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              fit: BoxFit.fill,
                              cubit.carts[index].image!,
                              height: 110,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  cubit.carts[index].name!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${cubit.carts[index].price!}\$',
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${cubit.carts[index].oldPrice!}\$',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cubit.addOrRemoveFavorite(
                                            prudactId: cubit.carts[index].id
                                                .toString());
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 28,
                                        color: cubit.favoritID.contains(cubit
                                                .carts[index].id
                                                .toString())
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cubit.addOrRemoveCarts(
                                            prudactId: cubit.carts[index].id!
                                                .toString());
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 28,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              child: Card(
                color: Colors.green,
                child: Align(
                  child: Text('total price : ${cubit.totalPrice}'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
