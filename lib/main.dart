import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/layout/Cubit/CubitBloc.dart';
import 'package:vegetables/layout/Cubit/StateBloc.dart';
import 'package:vegetables/layout/layoutScreen.dart';
import 'package:vegetables/shared/components/constants.dart';
import 'package:vegetables/shared/network/remote/cache_helper.dart';
import 'package:vegetables/shared/styles/themes.dart';

import 'modules/on_boarding/Cuibt/CubitOnBoarding.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider(
        create: (context) => CubitOnBoarding(),
    ),
         BlocProvider(
           create: (context) => LayoutCubit()..getUserData()..getOrganicDry_FruitsProduct()..getOrganicFruitsProduct()..getOrganicVegetablesProduct()
           ..getMelonsDry_FruitsProduct()..getMelonsFruitsProduct()..getMelonsVegetablesProduct()
           ..getStoneDry_FruitsProduct()..getStoneFruitsProduct()..getStoneVegetablesProduct()
           ..getMixedDry_FruitsProduct()..getMixedFruitsProduct()..getMixedVegetablesProduct(),
         ),
    ],
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ligthTheme,
            themeMode: ThemeMode.light,
            home: LayoutScreen(),
          );
        },),
    );
  }
}
