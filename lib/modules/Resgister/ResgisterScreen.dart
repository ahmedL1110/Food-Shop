import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/modules/Login/LoginScreen.dart';
import 'package:vegetables/modules/Resgister/cubit/RegisterCubit.dart';
import 'package:vegetables/modules/Resgister/cubit/RegisterState.dart';

import '../../layout/layoutScreen.dart';
import '../../shared/components/compoents.dart';
import '../../shared/network/remote/cache_helper.dart';

class ResgisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is CreateUserSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              navigateAndFinish(context, LayoutScreen());
              }).catchError((error) {
                print(error.toString());
              });
          } else if (state is CreateUseErrorState) {
            showToast(text: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 0,
              toolbarHeight: 0,
            ),
            body: Container(
              width: double.infinity,
              height: size.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/images/L1.png',
                        height: size.height * 0.3,
                      ),
                      //SizedBox(height: size.height*0.1,),
                      //Text('Fruit Market',style: TextStyle(fontSize: 44.0,fontWeight: FontWeight.bold,color: Color.fromARGB(210, 56, 193, 114)),),
                      SizedBox(height: size.height * 0.04),
                      DefailTextFild(
                        size: size,
                        type: TextInputType.name,
                        stringError: 'please enter your user name',
                        hintText: 'User Name',
                        prefix: Icons.person,
                        controller: name,
                      ),
                      DefailTextFild(
                        size: size,
                        type: TextInputType.emailAddress,
                        stringError: 'please enter your email address',
                        hintText: 'Email Address',
                        prefix: Icons.email_outlined,
                        controller: email,
                      ),
                      DefailTextFild(
                          isPassword: RegisterCubit.get(context).isPassword,
                          size: size,
                          controller: password,
                          type: TextInputType.visiblePassword,
                          stringError: 'please enter your password',
                          hintText: 'Password',
                          prefix: Icons.lock,
                          suffix: RegisterCubit.get(context).suffix,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          }),
                      DefailTextFild(
                        size: size,
                        controller: phone,
                        type: TextInputType.phone,
                        stringError: 'please enter your phone',
                        hintText: 'Phone',
                        prefix: Icons.phone,
                      ),

                      SizedBox(
                        height: size.height * .02,
                      ),
                      if (state is! RegisterLoadingState)
                        DefaultBotton(
                            size: size,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                    name: name.text,
                                    phone: phone.text,
                                    email: email.text,
                                    password: password.text);
                              }
                            },
                            text: 'SIGNUP')
                      else
                        Center(
                          child: CircularProgressIndicator(
                            color: Color.fromARGB(210, 56, 193, 114),
                          ),
                        ),
                      SizedBox(height: size.height * 0.03),
                      DefaultText(
                        login: false,
                        context: context,
                        widgetTo: LoginScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
