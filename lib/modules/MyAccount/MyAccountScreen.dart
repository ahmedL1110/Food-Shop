import 'package:flutter/material.dart';
import 'package:vegetables/layout/Cubit/CubitBloc.dart';
import 'package:vegetables/modules/Favourite/FavouriteScreen.dart';
import 'package:vegetables/modules/MyAccount/MyOrderScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/EditProfileScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/SettingsScreen.dart';
import 'package:vegetables/modules/Shopping_cart/ShoppingCartScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/styles/icon_broken.dart';

import '../on_boarding/OnBoardingScreen.dart';

class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * .28,
                  color: Colors.lightGreen,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: size.height * 0.068,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                          radius: size.height * 0.067,
                          backgroundImage: NetworkImage('${LayoutCubit.get(context).usermodel?.image}'),),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      '${LayoutCubit.get(context).usermodel?.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      '${LayoutCubit.get(context).usermodel?.phone}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.04, horizontal: size.width * 0.05),
              child: IconButton(
                onPressed: () {
                  navigateTo(context, EditProfileScreen());
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * 0.005,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildMyAccount(context, MyOrderScreen(),
                    size: size, title: 'My Orders', icon: IconBroken.Bag_2),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                buildMyAccount(context, FavouriteScreen(),
                    size: size, title: 'Favourites', icon: Icons.favorite),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                buildMyAccount(context, SettingsScreen(),
                    size: size, title: 'Setting', icon: Icons.settings),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                buildMyAccount(context, ShoppingCartScreen(),
                    size: size, title: 'My Cart', icon: Icons.shopping_cart),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                buildMyAccount(context, MyOrderScreen(),
                    size: size, title: 'Refer a Friend', icon: Icons.share),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                buildMyAccount(context, MyOrderScreen(),
                    size: size, title: 'Help', icon: Icons.help),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1,
                ),
                buildMyAccountt(context, OnBoardingScreen(),
                    size: size, title: 'Log Out', icon: Icons.logout_outlined),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
Widget buildMyAccountt(BuildContext context,Widget Screento,
    {required Size size, required String title, required IconData icon}) =>
    InkWell(
      onTap: (){
        navigateAndFinish(context, Screento);
      },
      child: Padding(
        padding:
        EdgeInsets.symmetric(vertical: size.height * 0.022, horizontal: 20.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: size.width * .09,
              color: Colors.lightGreen,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
