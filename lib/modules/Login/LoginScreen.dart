import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/modules/Login/cubit/LoginCubit.dart';
import 'package:vegetables/modules/Login/cubit/LoginState.dart';

import '../../layout/layoutScreen.dart';
import '../../shared/components/compoents.dart';
import '../../shared/network/remote/cache_helper.dart';
import '../Resgister/ResgisterScreen.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              showToast(text: state.error, state: ToastStates.ERROR);
            } else if (state is LoginSuccessState) {
              CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
                navigateAndFinish(context, LayoutScreen());
              }).catchError((error) {
                print(error.toString());
              });
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
                          height: size.height * 0.35,
                        ),
                        Text(
                          'Fruit Market',
                          style: TextStyle(
                              fontSize: 44.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(210, 56, 193, 114)),
                        ),
                        SizedBox(height: size.height * 0.04),
                        DefailTextFild(
                          size: size,
                          type: TextInputType.emailAddress,
                          stringError: 'please enter your email address',
                          hintText: 'Email Address',
                          prefix: Icons.email_outlined,
                          controller: email,
                        ),
                        DefailTextFild(
                          isPassword: LoginCubit.get(context).isPassword,
                          size: size,
                          controller: password,
                          type: TextInputType.visiblePassword,
                          stringError: 'please enter your password',
                          hintText: 'Password',
                          prefix: Icons.lock,
                          suffix: LoginCubit.get(context).suffix,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        if (state is! LoginLoadingState)
                          DefaultBotton(
                              size: size,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                      email: email.text,
                                      password: password.text);

                                }
                              },
                              text: 'LOGIN')
                        else
                          Center(
                            child: CircularProgressIndicator(
                              color: Colors.lightGreen,
                            ),
                          ),
                        SizedBox(height: size.height * 0.03),
                        DefaultText(
                          login: true,
                          context: context,
                          widgetTo: ResgisterScreen(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
