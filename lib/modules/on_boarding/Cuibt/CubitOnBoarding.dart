
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/modules/on_boarding/Cuibt/StateOnBoarding.dart';

class CubitOnBoarding extends Cubit<StateOnBoarding>{
  CubitOnBoarding() :  super(OnBoardingInitialState());

  static CubitOnBoarding get(context) => BlocProvider.of(context);

  int index = 0;

  List<String> lottie = ['asset/lottie/B1.json','asset/lottie/B1.json','asset/lottie/B1.json'];

  List<String> images = ['asset/images/B1.png','asset/images/B2.png','asset/images/B3.png'];

  List<String> Screen_Title = ['E Shopping','Delivery on the way','Delivery Arrived'];
  
  List<String> Screen_Body = ['Explore  top organic fruits & grab them','Get your order by speed delivery','Order is arrived at your Place'];


  void ChangeIndex(int number){
    index = number;
    emit(IndexOnBoardingState());
  }
}