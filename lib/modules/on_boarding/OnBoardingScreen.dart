// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vegetables/modules/Login/LoginScreen.dart';
import 'package:vegetables/modules/on_boarding/Cuibt/CubitOnBoarding.dart';
import 'package:vegetables/modules/on_boarding/Cuibt/StateOnBoarding.dart';
import 'package:vegetables/modules/on_boarding/LottieOnBoarding.dart';

import '../../shared/components/compoents.dart';
import '../../shared/network/remote/cache_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boaedController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<CubitOnBoarding, StateOnBoarding>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  //ممكن تاخدها ك ميثود برا
                  // CacheHelper.saveData(key: 'onBoarding', value: true)
                  //     .then((value) {
                  //   if (value) {
                  //     navigateAndFinish(
                  //       context,
                  //       LoginScreen(),
                  //     );
                  //   }
                  // });

                  navigateAndFinish(
                    context,
                    LoginScreen(),
                  );
                },
                child: const Text(
                  'SKIP',
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: boaedController,
                    onPageChanged: (int index) {
                      CubitOnBoarding.get(context).ChangeIndex(index);
                      if (index == 2) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        isLast = false;
                      }
                    },
                    physics: const BouncingScrollPhysics(),
                    //تطير لون النطة في الحركة
                    itemBuilder: (context, index) => bulidBoardingItem(size),
                    itemCount: 3,
                  ),
                ),
                // SizedBox(
                //   height: 40.0,
                // ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boaedController,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        //هاي لتزين الشكل
                        dotColor: Colors.grey,
                        //طول ولون وعرض النقط
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Color.fromARGB(220, 56, 193, 114),
                        //لون النقطة الي انت فيها
                        spacing: 4,
                        //تباعد عن بعض
                        expansionFactor: 3, //هذا الي بدك تنقل عليه كيف بكبر
                      ),
                    ),
                    const Spacer(),
                    //هاي تخلي المسافة بينهم الي قبل والي بعد الى الاخرى
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          // CacheHelper.saveData(key: 'onBoarding', value: true)
                          //     .then((value) {
                          //   if (value) {
                          //     navigateAndFinish(
                          //       context,
                          //       LoginScreen(),
                          //     );
                          //   }
                          // });

                          navigateAndFinish(
                            context,
                            LoginScreen(),
                          );
                        } else {
                          boaedController.nextPage(
                            duration: const Duration(
                              //التنقل
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn, //شكل التنقل
                          );
                        }
                      },
                      child: const Icon(Icons.arrow_forward_outlined),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bulidBoardingItem(Size size) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LottieOnBoardingScreen(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            CubitOnBoarding.get(context).Screen_Title[CubitOnBoarding.get(context).index],
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            CubitOnBoarding.get(context).Screen_Body[CubitOnBoarding.get(context).index],
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      );
}
