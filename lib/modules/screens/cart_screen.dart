// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        return cubit.carts.isEmpty
            ? Center(
                child: Text('Don\'t have a carts'),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cubit.carts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 6,
                              shadowColor: Colors.black,
                              color: Colors.grey.shade300,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network(
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                      cubit.carts[index].image!,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          cubit.carts[index].name!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                '${cubit.carts[index].price!} \$  '),
                                            Text(
                                              '${cubit.carts[index].oldprice!} \$',
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MaterialButton(
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              onPressed: () {
                                                cubit.addOrRemoveFavorite(
                                                    prudactId: cubit
                                                        .carts[index].id
                                                        .toString());
                                              },
                                              child: Icon(
                                                Icons.favorite,
                                                size: 28,
                                                color: cubit.favoritsID
                                                        .contains(cubit
                                                            .carts[index].id
                                                            .toString())
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                cubit.addOrRemoveCarts(
                                                    id: cubit.carts[index].id!
                                                        .toString());
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                size: 27,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          'total Price :\$${cubit.totalPrice} ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
