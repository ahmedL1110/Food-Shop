import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vegetables/layout/Cubit/CubitBloc.dart';
import 'package:vegetables/modules/Shopping_cart/AddressScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/network/remote/cache_helper.dart';

import '../../layout/Cubit/StateBloc.dart';
import '../../shared/styles/icon_broken.dart';

class ShoppingCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
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
                        'Shopping Cart',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: size.height * 0.07,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Icon(Icons.place),
                    Container(
                      width: size.width * 0.5,
                      child: Text(
                        '${CacheHelper.getData(key: 'address')}',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Icon(IconBroken.Arrow___Down_2),
                    Spacer(),
                    InkWell(
                      child: Text(
                        'Change Address',
                        style: TextStyle(fontSize: 13.0, color: Colors.blue),
                      ),
                      onTap: () {
                        navigateTo(context, AddressScreen());
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  color: Colors.grey[250],
                  child: DefaultTabController(
                    length: 3,
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
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return buildShoppingCart(size: size);
                                },
                                separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: size.width * 0.04),
                                  child: Container(
                                    color: Colors.grey[300],
                                    width: double.infinity,
                                    height: 1,
                                  ),
                                ),
                                itemCount: 2,
                              ),
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return buildShoppingCart(size: size);
                                },
                                separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: size.width * 0.04),
                                  child: Container(
                                    color: Colors.grey[300],
                                    width: double.infinity,
                                    height: 1,
                                  ),
                                ),
                                itemCount: 2,
                              ),
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return buildShoppingCart(size: size);
                                },
                                separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      bottom: size.width * 0.04),
                                  child: Container(
                                    color: Colors.grey[300],
                                    width: double.infinity,
                                    height: 1,
                                  ),
                                ),
                                itemCount: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(size.width * 0.04),
                          child: Container(
                            height: size.height * 0.053,
                            child: Row(
                              children: [
                                Text(
                                  'Total- Rs 570',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0),
                                ),
                                Spacer(),
                                Container(
                                  height: size.height * 0.053,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: size.width * 0.4,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: ElevatedButton(
                                      child: Text(
                                        'Place Order',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.lightGreen,
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
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

Widget buildShoppingCart({required Size size}) => Padding(
      padding: EdgeInsetsDirectional.only(
          start: size.width * 0.04,
          //top: size.width * 0.06,
          bottom: size.width * 0.04),
      child: Row(
        children: [
          Container(
            width: size.width * 0.28,
            height: size.height * 0.14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                  'https://blog-images.pharmeasy.in/2021/05/20204137/shutterstock_1284082165-1.jpg',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Onion',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'Rs 60 Saved',
                      style:
                          TextStyle(fontSize: 10.0, color: Colors.lightGreen),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        IconBroken.Delete,
                      ),
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
                  'Rs 260',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 12.0),
                ),
                SizedBox(
                  height: size.height * 0.008,
                ),
                Text(
                  '130 Per/ kg',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: size.height * 0.04,
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          //HomeCubit.get(context).increaseNumber();
                        },
                        child: Container(
                          height: size.height * 0.035,
                          width: size.width * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                7,
                              ),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset.fromDirection(0, 0),
                                    spreadRadius: 0.8)
                              ]),
                          child: const Center(
                            child: Icon(Iconsax.minus),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.035),
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
                          //HomeCubit.get(context).increaseNumber();
                        },
                        child: Container(
                          height: size.height * 0.035,
                          width: size.width * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                7,
                              ),
                              color: Colors.white,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset.fromDirection(0, 0),
                                    spreadRadius: 0.8)
                              ]),
                          child: const Center(
                            child: Icon(Iconsax.add),
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
