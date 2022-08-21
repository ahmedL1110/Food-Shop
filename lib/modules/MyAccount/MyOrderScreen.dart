import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vegetables/modules/HOME/ProducerScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/styles/icon_broken.dart';

import '../../layout/Cubit/CubitBloc.dart';
import '../../layout/Cubit/StateBloc.dart';
import '../../models/ProductModel/product_model.dart';

class MyOrderScreen extends StatelessWidget {
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
                        'My Orders',
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
                InkWell(
                  onTap: () {
                    navigateTo(context, ProducerScreen());
                  },
                  child: Icon(
                      IconBroken.Arrow___Right_2,
                    ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.008,
            ),

            RatingBar.builder(
                initialRating:  0,
                minRating: 1,
                maxRating: 5,
                itemCount: 5,
                itemSize: size.width*0.065,
                allowHalfRating: true,
                itemBuilder: (context, _) =>
                const Icon(
                  Icons.star,
                  //size: 16,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {}),
            SizedBox(
              height: size.height * 0.008,
            ),
            Text(
              //productModel.title,
              'Rate this Product ',
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(
              height: size.height * 0.008,
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

