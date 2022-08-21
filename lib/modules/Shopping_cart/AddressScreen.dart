import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/layout/Cubit/CubitBloc.dart';
import 'package:vegetables/shared/components/compoents.dart';
import 'package:vegetables/shared/components/constants.dart';
import 'package:vegetables/shared/network/remote/cache_helper.dart';

import '../../layout/Cubit/StateBloc.dart';
import '../../shared/styles/icon_broken.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String addres = '';
    Size size = MediaQuery.of(context).size;
    var formKey = GlobalKey<FormState>();
    var AddressController = TextEditingController();
    AddressController.text = LayoutCubit.get(context).address;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Change Address',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: size.height * 0.05,
              start: size.width * 0.05,
            ),
            child: Text(
              'Address',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.025,
              horizontal: size.width * 0.06,
            ),
            child: Container(
              height: size.height * 0.18,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset.fromDirection(0, 0),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: AddressController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  onChanged: (s) {
                    addres = s;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Please Enter your new address',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
              child: DefaultBotton(
                  size: size,
                  function: () {
                    LayoutCubit.get(context).changeAddress(addres);
                    CacheHelper.saveData(key: 'address',value: addres);
                  },
                  text: 'CHANGE')),
        ],
      ),
    );
  }
}
