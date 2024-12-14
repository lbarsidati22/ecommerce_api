// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_cubit.dart';
import 'package:ecommerce_api/test/test_layout/test_lyout_cubit/test_layout_state.dart';
import 'package:ecommerce_api/test/test_model/test_prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestLayoutCubit, TestLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<TestLayoutCubit>(context);
        return Scaffold(
          backgroundColor: mainBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.close),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                cubit.banners.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 150,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.banners.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  cubit.banners[index].image!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                cubit.categories.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(cubit.categories[index].image!),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 5,
                            );
                          },
                          itemCount: cubit.categories.length,
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Prudact',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                cubit.prudacts.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cubit.prudacts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          return prudactItem(
                            model: cubit.prudacts[index],
                          );
                        },
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget prudactItem({required TestPrudactModel model}) {
  return Card(
    elevation: 2,
    shadowColor: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.network(
                  model.image!,
                )),
          ),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            model.name!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '${model.price}\$',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${model.oldPrice}\$',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.favorite,
                  size: 19,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
