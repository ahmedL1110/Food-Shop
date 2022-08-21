import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_settings_ui/platform_settings_ui.dart';

import '../../../layout/Cubit/CubitBloc.dart';
import '../../../layout/Cubit/StateBloc.dart';
import '../../../shared/styles/icon_broken.dart';

class LanguageSettingScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    List<String> subTitle = ["French", "English", "Spanish"];
    int groupValue = 0;
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
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
                        'Language Setting',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: SettingsList(
                    children: [
                      SettingsSection(
                        title: 'Language',
                        children: [
                          SettingsTile(
                            title: "Language",
                            subTitle: subTitle[LayoutCubit.get(context).LanguageIndex],
                            icon: const Icon(Icons.language,size: 35,),
                            showChevron: true,
                            editType: EditType.list,
                            listEditTypeView: ListEditTypeView(
                              title: "Language",
                              groupValue: LayoutCubit.get(context).LanguageIndex,
                              onChanged: (value) {
                                LayoutCubit.get(context).changeLanguage(value);
                              },
                              children: [
                                ListEditTile<int>(
                                    title: Text("🇫🇷 ${subTitle[0]}"), value: 0),
                                ListEditTile<int>(
                                    title: Text("🇬🇧 ${subTitle[1]}"), value: 1),
                                ListEditTile<int>(
                                    title: Text("🇪🇸 ${subTitle[2]}"), value: 2),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}