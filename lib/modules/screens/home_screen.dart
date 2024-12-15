// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_api/constants.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_cubit.dart';
import 'package:ecommerce_api/layout/layout_cubit/layout_state.dart';
import 'package:ecommerce_api/model/prudact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final pageController = PageController();
  final mySearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<LayoutCubit>(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: mySearchController,
                  onChanged: (input) {
                    cubit.filterPrudact(input: input);
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 13),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        mySearchController.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                cubit.banners.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      )
                    : SizedBox(
                        height: 145,
                        width: double.infinity,
                        child: PageView.builder(
                            controller: pageController,
                            physics: BouncingScrollPhysics(),
                            itemCount: cubit.banners.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    fit: BoxFit.fill,
                                    cubit.banners[index].url!,
                                  ),
                                ),
                              );
                            }),
                      ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: cubit.banners.length,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect(
                      spacing: 8.0,
                      radius: 30,
                      dotWidth: 10,
                      dotHeight: 10,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: mainColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                cubit.categories.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      )
                    : SizedBox(
                        height: 70,
                        width: double.infinity,
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 15,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: cubit.categories.length,
                          itemBuilder: (context, index) {
                            return CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                cubit.categories[index].url!,
                              ),
                            );
                          },
                        ),
                      ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Prudacts',
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                cubit.prudacts.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      )
                    : GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.fillterAllPrudacts.isEmpty
                            ? cubit.prudacts.length
                            : cubit.fillterAllPrudacts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          return _prudactIem(
                            model: cubit.fillterAllPrudacts.isEmpty
                                ? cubit.prudacts[index]
                                : cubit.fillterAllPrudacts[index],
                          );
                        }),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _prudactIem({required PrudactModel model}) {
  return Card(
    elevation: 5,
    shadowColor: Colors.black,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(model.image!),
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            model.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '${model.price} \$',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      '${model.oldprice} \$',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.favorite),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
