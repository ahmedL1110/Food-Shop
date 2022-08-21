import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/layout/Cubit/StateBloc.dart';
import 'package:vegetables/modules/Shopping_cart/ShoppingCartScreen.dart';
import 'package:vegetables/shared/components/compoents.dart';
import '../shared/styles/icon_broken.dart';
import 'Cubit/CubitBloc.dart';

class LayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        //LayoutCubit.get(context).getUserData();
        return BlocConsumer<LayoutCubit,LayoutState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LayoutCubit.get(context);
            return Scaffold(
              body: cubit.screen[cubit.currenIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currenIndex,
                onTap: (index) {
                  if(index == 1)
                    navigateTo(context, ShoppingCartScreen());
                  else
                  cubit.changeBottomNac(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Home,
                    ),
                    label: 'Home',
                    activeIcon: Icon(
                      IconBroken.Home,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Buy,
                    ),
                    label: 'Shopping cart',
                    activeIcon: Icon(
                      IconBroken.Buy,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Heart,
                    ),
                    label: 'Favourite',
                    activeIcon: Icon(
                      IconBroken.Heart,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Profile,
                    ),
                    label: 'My Account',
                    activeIcon: Icon(
                      IconBroken.Profile,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }
    );
  }
}
