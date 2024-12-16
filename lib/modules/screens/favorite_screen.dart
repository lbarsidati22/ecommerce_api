// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        return Scaffold(
          body: cubit.favorits.isEmpty
              ? Center(
                  child: Text('Don\'t have a favorite'),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 14),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.favoritsID.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.grey.shade200,
                              elevation: 8,
                              shadowColor: Colors.black,
                              child: Container(
                                margin: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.network(
                                        width: 130,
                                        height: 90,
                                        fit: BoxFit.fill,
                                        cubit.favorits[index].image!,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                cubit.favorits[index].name!,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                  '${cubit.favorits[index].price} \$'),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: MaterialButton(
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              color: Colors.red,
                                              onPressed: () {
                                                cubit.addOrRemoveFavorite(
                                                    prudactId: cubit
                                                        .favorits[index].id!
                                                        .toString());
                                              },
                                              child: Text(
                                                'Remove',
                                              ),
                                            ),
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
                    ],
                  ),
                ),
        );
      },
    );
  }
}
