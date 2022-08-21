import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vegetables/modules/on_boarding/Cuibt/CubitOnBoarding.dart';

class LottieOnBoardingScreen extends StatefulWidget {
  @override
  State<LottieOnBoardingScreen> createState() => _LottieOnBoardingScreenState();
}

class _LottieOnBoardingScreenState extends State<LottieOnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool a = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          a = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: a
          ? Image.asset(CubitOnBoarding.get(context)
              .images[CubitOnBoarding.get(context).index])
          : Lottie.asset(
              CubitOnBoarding.get(context)
                  .lottie[CubitOnBoarding.get(context).index],
              controller: controller,
              addRepaintBoundary: true,
              onLoaded: (com) {
                controller.duration = com.duration;
                controller.forward();
              },
            ),
    );
  }
}
