import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vegetables/modules/HOME/ProducerScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/styles/icon_broken.dart';

import '../../layout/Cubit/CubitBloc.dart';
import '../../layout/Cubit/StateBloc.dart';
import '../../models/ProductModel/product_model.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
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
                        'Notification',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildFavourite(context,size: size,productModel: cubit.productModel[index]);
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
              ),
            ],
          ),
        );
      },
    );
  }
}
Widget buildFavourite(context,{required Size size,required ProductModel productModel})=>Padding(
  padding: EdgeInsetsDirectional.only(
      start: size.width * 0.04,
      //top: size.width * 0.06,
      bottom: size.width * 0.04
  ),
  child: Row(
    children: [
      Container(
        width: size.width * 0.23,
        height: size.height * 0.11,
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Text(
              //productModel.title,
              'Rate this Product\nRate this Product',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              //productModel.title,
              'Delivered on 24 Feb 2021.',
              style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500),
            ),
          ],
        ),
      )
    ],
  ),
);

