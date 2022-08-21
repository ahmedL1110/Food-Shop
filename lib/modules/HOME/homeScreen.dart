import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vegetables/layout/Cubit/CubitBloc.dart';
import 'package:vegetables/layout/Cubit/StateBloc.dart';
import 'package:vegetables/models/ProductModel/product_model.dart';
import 'package:vegetables/modules/HOME/NotificationScreen.dart';

import '../../shared/components/compoents.dart';
import '../../shared/styles/icon_broken.dart';
import 'ProducerScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(children: [
          // Stack(
          //   alignment: Alignment.bottomCenter,
          //   children: [
          //     Stack(
          //       alignment: Alignment.bottomCenter,
          //       children: [
          //         Container(
          //           color: Colors.lightGreen,
          //           width: size.width,
          //           height: size.height * 0.232,
          //           child: Padding(
          //             padding: EdgeInsetsDirectional.only(
          //                 top: size.height * 0.08, start: size.width * .03),
          //             child: Text(
          //               'Fruit Market',
          //               style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 32,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //         ),
          //         Container(
          //           color: Colors.white,
          //           width: size.width,
          //           height: size.height * 0.05,
          //         )
          //       ],
          //     ),
          //     Padding(
          //       padding: EdgeInsetsDirectional.only(
          //           start: size.width * .01,
          //           end: size.width * .01,
          //           bottom: size.height * 0.01),
          //       child: defailTextFild(
          //         controller: searchController,
          //         type: TextInputType.text,
          //         onchanged: (String value) {
          //           // cubit.getSearch(value);
          //           // if(value.isEmpty){
          //           //   print(value);
          //           //   cubit.search=[];
          //           // }
          //         },
          //         stringError: 'Search must not be empyt',
          //         hintText: 'Search',
          //         prefix: Icons.search_rounded,
          //         size: size,
          //       ),
          //     ),
          //   ],
          // ),
          Container(
            height: size.height * 0.215,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    height: size.height * 0.18,
                    color: Colors.lightGreen,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            'Fruit Market',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          // IconButton(
                          //   onPressed: () {
                          //     LayoutCubit.get(context).sendtt();
                          //   },
                          //   icon: const Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          // SizedBox(
                          //   width: size.width*0.2,
                          // ),
                          IconButton(
                            onPressed: () {
                              navigateTo(context, NotificationScreen());
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset.fromDirection(1.5, 10),
                            spreadRadius: 0,
                            blurRadius: 10.0),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.black12,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.black12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!LayoutCubit.get(context).productModelStoneFruits.isEmpty)
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                color: Colors.grey[250],
                child: DefaultTabController(
                  length: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        ButtonsTabBar(
                          backgroundColor: Colors.lightGreen,
                          unselectedBackgroundColor: Colors.white30,
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          elevation: 0.0,
                          radius: 10,
                          buttonMargin: EdgeInsets.all(10),
                          duration: 1,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          tabs: const [
                            Tab(
                              text: 'Vegetables',
                            ),
                            Tab(
                              text: 'Fruits',
                            ),
                            Tab(
                              text: 'Dry Fruits',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: size.width * .05,
                                  top: size.height * .02,
                                ),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      buildHome2(
                                        size: size,
                                        title: 'Organic Vegetables',
                                        code: '(20% Off)',
                                        body: 'Pick up from organic farms',
                                        model: LayoutCubit.get(context)
                                            .productModelOrganicVegetables,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome2(
                                        size: size,
                                        title: 'Mixed Vegetable Pack',
                                        code: '(10% Off)',
                                        body: 'Vegetable mix fresh pack',
                                        model: LayoutCubit.get(context)
                                            .productModelMixedVegetables,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome2(
                                        size: size,
                                        title: 'Allium Vegetabels',
                                        code: '(20% Off)',
                                        body: 'Fresh Allium Vegetables',
                                        model: LayoutCubit.get(context)
                                            .productModelAlliumVegetables,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome(
                                        size: size,
                                        title: 'Root Vegetabels',
                                        code: '(5% Off)',
                                        body: 'Fresh Root Vegetables',
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: size.width * .05,
                                  top: size.height * .02,
                                ),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      buildHome2(
                                        size: size,
                                        title: 'Organic Fruits',
                                        code: '(20% Off)',
                                        body: 'Pick up from organic farms',
                                        model: LayoutCubit.get(context)
                                            .productModelOrganicFruits,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome2(
                                        size: size,
                                        title: 'Mixed Fruit Pack',
                                        code: '(10% Off)',
                                        body: 'Fruit mix fresh pack',
                                        model: LayoutCubit.get(context)
                                            .productModelMixedFruits,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome2(
                                          size: size,
                                          title: 'Stone Fruits',
                                          code: '(20% Off)',
                                          body: 'Fresh Stone Fruits',
                                          model: LayoutCubit.get(context)
                                              .productModelStoneFruits,),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome(
                                        size: size,
                                        title: 'Melons',
                                        code: '(5% Off)',
                                        body: 'Fresh Melons Fruits',
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                  start: size.width * .05,
                                  top: size.height * .02,
                                ),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      buildHome(
                                        size: size,
                                        title: 'Organic Dry Fruits',
                                        code: '(20% Off)',
                                        body: 'Pick up from organic farms',
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome(
                                        size: size,
                                        title: 'Mixed Dry Fruit Pack',
                                        code: '(10% Off)',
                                        body: 'Dry Fruit mix fresh pack',
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome(
                                        size: size,
                                        title: 'Stone Dry Fruits',
                                        code: '(20% Off)',
                                        body: 'Fresh Stone Dry Fruits',
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      buildHome(
                                        size: size,
                                        title: 'Melons',
                                        code: '(5% Off)',
                                        body: 'Fresh Melons Dry Fruits',
                                      ),
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          if (LayoutCubit.get(context).productModelStoneFruits.isEmpty)
            Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.35,
                    ),
                    Container(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          color: Colors.lightGreen,
                        )),
                  ],
                )),
        ]);
      },
    );
  }
}

Widget buildHome2(
        {required Size size,
        required String title,
        required String code,
        required String body,
        required List<ProductModel> model}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: size.width * .02,
            ),
            Text(
              code,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.008,
        ),
        Text(
          body,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
//بدي احجمه عشان يزبط
          height: size.height * 0.315,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              //طريق الحركة
              itemBuilder: (context, index) =>
                  buildGridProduct2(size, context, model[index]),
              separatorBuilder: (context, index) => SizedBox(
                    width: size.width * .04,
                  ),
              itemCount: model.length),
        ),
      ],
    );

Widget buildGridProduct2(Size size, context, ProductModel model) => InkWell(
      highlightColor: Colors.lightGreen.withOpacity(0.3),
      splashColor: Colors.red.withOpacity(0.5),
      onTap: () {
        navigateTo(context, ProducerScreen());
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  width: size.width * 0.30,
                  height: size.height * 0.218,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                        model.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 5, top: 7),
                  child: Container(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: InkWell(
                        onTap: () {
                          //print(uId);
                          LayoutCubit.get(context).CheckFavourite(model: model);
                        },
                        child: Icon(
                          IconBroken.Heart,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.006,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                    initialRating: double.parse(model.rating),
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    itemSize: 17,
                    allowHalfRating: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      //size: 16,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (value) {}),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  model.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  model.mass,
                  style: const TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                ],
            ),
          ],
        ),
      ),
    );
