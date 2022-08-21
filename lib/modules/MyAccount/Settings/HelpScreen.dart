import 'package:flutter/material.dart';

import '../../../shared/styles/icon_broken.dart';

class HelpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    'Help',
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

        ],
      ),
    );
  }
}
