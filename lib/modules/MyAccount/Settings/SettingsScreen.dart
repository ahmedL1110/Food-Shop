import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vegetables/modules/Favourite/FavouriteScreen.dart';
import 'package:vegetables/modules/MyAccount/MyOrderScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/AccountScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/Language_SettingScreen.dart';
import 'package:vegetables/modules/MyAccount/Settings/Notification_SettingScreen.dart';
import 'package:vegetables/modules/Shopping_cart/AddressScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
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
                    'Settings',
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
          buildMyAccount(context, AccountScreen(),
              size: size, title: 'Account', icon: Icons.account_circle),
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1,
          ),
          buildMyAccount(context, NotificationSettingScreen(),
              size: size, title: 'Notification', icon: Icons.notifications_sharp),
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1,
          ),
          buildMyAccount(context, LanguageSettingScreen(),
              size: size, title: 'Language', icon: Icons.language_sharp),
          Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1,
          ),
          buildMyAccount(context, AddressScreen(),
              size: size, title: 'Change Address', icon: Icons.place_outlined),
        ],
      ),
    );
  }
}
