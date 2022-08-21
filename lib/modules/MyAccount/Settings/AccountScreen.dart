import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vegetables/modules/Favourite/FavouriteScreen.dart';
import 'package:vegetables/modules/MyAccount/MyOrderScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/Language_SettingScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/Notification_SettingScreen.dart';
import 'package:vegetables/modules/Shopping_cart/AddressScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/styles/icon_broken.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    'Account Setting',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          buildAccount(context,
              size: size, title: 'Security', icon: Icons.security_sharp),
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1,
          ),
          buildAccount(context, 
              size: size, title: 'Deactivate Account', icon: Icons.dangerous),
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1,
          ),
          buildAccount(context,
              size: size, title: 'Delete Account', icon: Icons.delete),
        ],
      ),
    );
  }
}

Widget buildAccount(BuildContext context,
        {required Size size, required String title, required IconData icon}) =>
    InkWell(
      onTap: (){
        //navigateTo(context, Screento);
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
