import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vegetables/layout/Cubit/StateBloc.dart';

import '../../layout/Cubit/CubitBloc.dart';
import '../../models/ProductModel/product_model.dart';
import '../../shared/components/compoents.dart';
import '../../shared/styles/icon_broken.dart';
import '../HOME/ProducerScreen.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      LayoutCubit.get(context).getFavouriteProduct();
      return BlocConsumer<LayoutCubit, LayoutState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LayoutCubit.get(context);
            return Scaffold(
              body: Column(
                children: [
                  if(cubit.currenIndex == 3)
                    Container(
                      width: double.infinity,
                      height: size.height * 0.13,
                      color: Colors.lightGreen,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: size.height * 0.05,
                          start: size.width * 0.005,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                IconBroken.Arrow___Left_2,
                              ),
                            ),
                            Text(
                              'Favourites',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if(cubit.currenIndex != 3)
                  Container(
                    width: double.infinity,
                    height: size.height * 0.13,
                    color: Colors.lightGreen,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: size.height * 0.08,
                        start: size.width * 0.05,
                      ),
                      child: Text(
                        'Favourites',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildFavourite(size: size,productModel: cubit.productModel[index]);
                      },
                      separatorBuilder: (context, index) =>Padding(
                        padding:  EdgeInsetsDirectional.only(bottom: size.width * 0.04),
                        child: Container(
                                  color: Colors.grey[300],
                                  width: double.infinity,
                                  height: 1,
                                ),
                      ),
                      itemCount: cubit.productModel.length,
                    ),
                    // child: SingleChildScrollView(
                    //   physics: BouncingScrollPhysics(),
                    //   child: Column(
                    //     children: [
                    //       buildFavourite(size: size),
                    //       Container(
                    //         color: Colors.grey[300],
                    //         width: double.infinity,
                    //         height: 1,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ],
              ),
            );
          },);
    },);
  }
}

Widget buildFavourite({required Size size,required ProductModel productModel})=>Padding(
  padding: EdgeInsetsDirectional.only(
      start: size.width * 0.04,
      //top: size.width * 0.06,
      bottom: size.width * 0.04
  ),
  child: Row(
    children: [
      Container(
        width: size.width * 0.28,
        height: size.height * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: NetworkImage(
              productModel.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: size.width * 0.05,
      ),
      Container(
        width: size.width * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(productModel.name,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600)),
                Spacer(),
                Text(
                  productModel.mass,
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: size.width * 0.04,
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.008,
            ),
            Text(
              productModel.title,
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(
              height: size.height * 0.008,
            ),
            RatingBar.builder(
                initialRating:  double.parse(productModel.rating),
                minRating: 1,
                maxRating: 5,
                itemCount: 5,
                itemSize: 17,
                allowHalfRating: true,
                itemBuilder: (context, _) =>
                const Icon(
                  Icons.star,
                  //size: 16,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {}),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              height: size.height * 0.04,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      //homeCubit.increaseNumber();
                    },
                    child: Stack(
                      alignment:
                      AlignmentDirectional.center,
                      children: [
                        Container(
                          width: size.width * 0.081,
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(7),
                              color: Colors.black),
                          child: Text(''),
                        ),
                        Container(
                          width: size.width * 0.08,
                          height: size.height * 0.039,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(7),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                        size.width * 0.035),
                    child: Text(
                      '1',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //homeCubit.increaseNumber();
                    },
                    child: Stack(
                      alignment:
                      AlignmentDirectional.center,
                      children: [
                        Container(
                          width: size.width * 0.081,
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(7),
                              color: Colors.black),
                          child: Text(''),
                        ),
                        Container(
                          width: size.width * 0.08,
                          height: size.height * 0.039,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(7),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width * 0.18,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(7),
                        color: Color.fromARGB(
                            226, 95, 70, 10),
                      ),
                      child: const Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  ),
);
