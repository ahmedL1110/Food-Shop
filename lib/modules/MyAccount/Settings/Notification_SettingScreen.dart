import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:platform_settings_ui/platform_settings_ui.dart';

import '../../../layout/Cubit/CubitBloc.dart';
import '../../../layout/Cubit/StateBloc.dart';
import '../../../shared/styles/icon_broken.dart';

class NotificationSettingScreen extends StatelessWidget {
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
                        'Notification Setting',
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
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.022, horizontal: 20.0),
                height: size.height * 0.1,
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_sharp,
                      size: size.width * .09,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: size.width * 0.06,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Account',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Text('You will receive daily updates',style: Theme.of(context).textTheme.caption,),
                      ],
                    ),
                    Spacer(),
                    FlutterSwitch(
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.white,
                      inactiveToggleColor: Colors.grey[700],
                      inactiveSwitchBorder: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),

                      width: 47.0,
                      height: 22.0,
                      toggleSize: 14.0,
                      value: LayoutCubit.get(context).NotificationSetting1,
                      onToggle: (s1) {
                        LayoutCubit.get(context).changeNotificationSetting1(s1);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[300],
                width: double.infinity,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.022, horizontal: 20.0),
                height: size.height * 0.1,
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications_sharp,
                      size: size.width * .09,
                      color: Colors.lightGreen,
                    ),
                    SizedBox(
                      width: size.width * 0.06,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pramotional Notifications',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.0)),
                        SizedBox(
                          height: size.height * 0.008,
                        ),
                        Text('You will receive daily updates',style: Theme.of(context).textTheme.caption,),
                      ],
                    ),
                    Spacer(),
                    FlutterSwitch(
                      activeColor: Colors.lightGreen,
                      inactiveColor: Colors.white,
                      inactiveToggleColor: Colors.grey[700],
                      inactiveSwitchBorder: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),

                      width: 47.0,
                      height: 22.0,
                      toggleSize: 14.0,
                      value: LayoutCubit.get(context).NotificationSetting2,
                      onToggle: (s2) {
                        LayoutCubit.get(context).changeNotificationSetting2(s2);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
