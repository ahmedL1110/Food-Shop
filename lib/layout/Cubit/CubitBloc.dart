import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vegetables/modules/Favourite/FavouriteScreen.dart';
import 'package:vegetables/modules/HOME/homeScreen.dart';
import 'package:vegetables/modules/MyAccount/MyAccountScreen.dart';
import 'package:vegetables/modules/Shopping_cart/ShoppingCartScreen.dart';
import 'package:vegetables/shared/components/constants.dart';

import '../../models/ProductModel/product_model.dart';
import '../../models/UserModel/user_model.dart';
import '../../shared/network/remote/cache_helper.dart';
import 'StateBloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  UserModel? usermodel;

  changeAddress(String st){
    address = st;
    emit(ChangeAddressState());
  }

  int LanguageIndex = CacheHelper.getData(key: 'LanguageIndex')??1;
  changeLanguage(int i){
    LanguageIndex = i;
    CacheHelper.saveData(key: 'LanguageIndex',value: i);
    emit(ChangeLanguageState());
  }

  bool NotificationSetting1 = CacheHelper.getData(key: 'NotificationSetting1')??false;
  changeNotificationSetting1(bool s1){
    NotificationSetting1 = s1;
    CacheHelper.saveData(key: 'NotificationSetting1',value: s1);
    emit(ChangeNotificationSetting1State());
  }

  bool NotificationSetting2 = CacheHelper.getData(key: 'NotificationSetting2')??false;
  changeNotificationSetting2(bool s2){
    NotificationSetting2 = s2;
    CacheHelper.saveData(key: 'NotificationSetting2',value: s2);
    emit(ChangeNotificationSetting2State());
  }

  Future<void> getUserData() async {
    print('1');
    emit(GetUserLoadingState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      // print(value.data());
      usermodel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }

  int currenIndex = 0;

  String address = '';

  List<Widget> screen = [
    HomeScreen(),
    ShoppingCartScreen(),
    FavouriteScreen(),
    MyAccountScreen(),
  ];

  void changeBottomNac(int index) {
    currenIndex = index;
    emit(ChangeBottomNavState());
  }

  List<ProductModel> productModelOrganicVegetables = [];

  void getOrganicVegetablesProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Vegetables')
        .doc('1')
        .collection('Organic')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelOrganicVegetables
            .add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelMixedVegetables = [];

  void getMixedVegetablesProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Vegetables')
        .doc('1')
        .collection('Mixed')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelMixedVegetables.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelAlliumVegetables = [];

  void getStoneVegetablesProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Vegetables')
        .doc('1')
        .collection('Allium')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelAlliumVegetables.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelRootVegetables = [];

  void getMelonsVegetablesProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Vegetables')
        .doc('1')
        .collection('Root')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelRootVegetables.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelOrganicFruits = [];

  void getOrganicFruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Fruits')
        .doc('1')
        .collection('Organic')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelOrganicFruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelMixedFruits = [];

  void getMixedFruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Fruits')
        .doc('1')
        .collection('Mixed')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelMixedFruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelStoneFruits = [];

  void getStoneFruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Fruits')
        .doc('1')
        .collection('Stone')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelStoneFruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelMelonsFruits = [];

  void getMelonsFruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Fruits')
        .doc('1')
        .collection('Melons')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelMelonsFruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelOrganicDry_Fruits = [];

  void getOrganicDry_FruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Dry_Fruits')
        .doc('1')
        .collection('Organic')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelOrganicDry_Fruits
            .add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelMixedDry_Fruits = [];

  void getMixedDry_FruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Dry_Fruits')
        .doc('1')
        .collection('Mixed')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelMixedDry_Fruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelStoneDry_Fruits = [];

  void getStoneDry_FruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Dry_Fruits')
        .doc('1')
        .collection('Stone')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelStoneDry_Fruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  List<ProductModel> productModelMelonsDry_Fruits = [];

  void getMelonsDry_FruitsProduct() {
    emit(GetProductsLoadingState());
    FirebaseFirestore.instance
        .collection('Dry_Fruits')
        .doc('1')
        .collection('Melons')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        productModelMelonsDry_Fruits.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductsSuccessState());
    });
  }

  bool isFavourite = false;

  void CheckFavourite({
    required ProductModel model,
  }) {
    isFavourite = false;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('favourite')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.id == model.uId) {
          deleteFavouriteProduct(model: model);
          isFavourite = true;
        }
      });
      if (!isFavourite) {
        sendFavouriteProduct(model: model);
      }
    }).catchError((error) {
      emit(CheckFavouriteErrorState(error));
    });
  }

  List<ProductModel> productModel = [];

  void getFavouriteProduct() {
    emit(GetFavouriteLoadingState());
    productModel = [];
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('favourite')
        .snapshots()
        .listen((event) {
      productModel = [];
      event.docs.forEach((element) {
        productModel.add(ProductModel.fromJson(element.data()));
      });
      emit(GetFavouriteSuccessState());
    });
  }

  void sendFavouriteProduct({
    required ProductModel model,
  }) {
    String uid = model.uId;
    emit(SetFavouriteLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('favourite')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      print('wwwwwwwwwwwwwwww');
      emit(SetFavouriteSuccessState());
    }).catchError((error) {
      emit(SetFavouriteErrorState(error.toString()));
    });
  }

  void deleteFavouriteProduct({
    required ProductModel model,
  }) {
    emit(DeleteFavouriteLoadingState());
    String s = model.uId;
    String name = model.name;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('favourite')
        .doc(s)
        .delete()
        .then((value) {
      print('aaaaaaaaaaaaaaa');
      emit(DeleteFavouriteSuccessState());
    }).catchError((error) {
      emit(DeleteFavouriteErrorState(error.toString()));
    });
  }
  ProductModel a = ProductModel(
   image: 'https://cdn.tridge.com/fulfillment_image/e8/aa/f9/e8aaf9844669a76c390a0e913afc1c78b130ab20/Vietnam_Cashew_Nut_Kernel.jpg',
    mass: '80 per/kg',
    name: 'Cashew Nuts',
    rating: '5',
    title: 'Pick up from organic farms',
    uId: 'aa',
  );
  void sendtt(
  ) {
    emit(SetFavouriteLoadingState());
    FirebaseFirestore.instance
        .collection('Dry_Fruits')
        .doc('1')
        .collection('Indehiscent')
        .doc()
        .set(a.toMap())
        .then((value) {
      print('wwwwwwwwwwwwwwww');
      emit(SetFavouriteSuccessState());
    }).catchError((error) {
      emit(SetFavouriteErrorState(error.toString()));
    });
  }
  String StringcoverImage ='';
  String coverImageUrl = '';
  File? coverImage;
  final ImagePicker picker = ImagePicker();
  Future<void> getCoverImage() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    print(pickedFile);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      StringcoverImage = '${Uri.file(coverImage!.path).pathSegments.last}';
      print('hh$StringcoverImage');
    } else {
      print('No image selected');
    }
  }
  Future<void> UpcoverImage() async {
    await FirebaseStorage.instance.ref()
        .child('users/$StringcoverImage')
        .putFile(coverImage!)
        .then((p0) async {
      await p0.ref.getDownloadURL().then((value) {
        coverImageUrl = value;
        emit(UoloadCoverSuccessState());
      }).catchError((error) {
        print(error);
        emit(UoloadCoverErrorState());
      });
    }).catchError((error) {
       emit(UoloadCoverErrorState());
      print(error);
    });
    print('AAAAAAAAAAAAAAAAAAAAAAAAA$coverImageUrl');
  }
}
