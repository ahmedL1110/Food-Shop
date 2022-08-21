import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetables/layout/Cubit/CubitBloc.dart';
import 'package:vegetables/layout/Cubit/StateBloc.dart';

import '../../../shared/components/compoents.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var usermodel = SocialCubit.get(context).usermodel;
        // var profileImage = SocialCubit.get(context).profileImage;
        // var coverImage = SocialCubit.get(context).coverImage;
        var namecontroller = TextEditingController();
        var biocontroller = TextEditingController();
        var phonecontroller = TextEditingController();

        // namecontroller.text = usermodel?.name;
        // biocontroller.text = usermodel?.bio;
        // phonecontroller.text = usermodel?.phone;
        // ignore: unused_local_variable

        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  onPressed: () {
                    print(LayoutCubit.get(context).usermodel?.uId);
                  },
                  child: Text(
                    'UPDATE',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                IconBroken.Arrow___Left_2,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (false) LinearProgressIndicator(),
                  if (true)
                    SizedBox(
                      height: 10.0,
                    ),
                  Container(
                    height: size.height * 0.29,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                height: size.height * 0.21,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://img.freepik.com/free-vector/delivery-service-customer-door_107791-11385.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                LayoutCubit.get(context).getCoverImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  defailTextFild(
                      controller: namecontroller,
                      type: TextInputType.name,
                      stringError: 'name must not be empty',
                      //lable: 'Name',
                      prefix: IconBroken.User,
                      onchanged: (String) {
                        //usermodel.name = namecontroller.text;
                      },
                      size: size,
                      hintText: 'Name'),
                  SizedBox(
                    height: 15.0,
                  ),
                  defailTextFild(
                      controller: phonecontroller,
                      type: TextInputType.phone,
                      stringError: 'phone must not be empty',
                      prefix: IconBroken.Call,
                      onchanged: (String) {
                        // usermodel.phone = phonecontroller.text;
                      },
                      hintText: 'Phone',
                      size: size),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
