import 'package:flutter/material.dart';

import '../../shared/styles/icon_broken.dart';

class ProducerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('DETAILS'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconBroken.Arrow___Left_2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              height: size.height * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://blog-images.pharmeasy.in/2021/05/20204137/shutterstock_1284082165-1.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Text(
              'Broccoli',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 7),
              child: Text(
                'Broccoli is a green vegetable that vaguely  nutritional Powerhouse of vitamin,fiber and antioxidents.Broccoli contains lutein and which mayPrevent from stress and cellular damage in yourEyes.',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Nutrition',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Fat',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Potassium',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Selenium',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Vitamin B9',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Vitamin A',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Vitamin K',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Zinc',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                CircleAvatar(backgroundColor: Colors.grey,radius: 4.0,),
                SizedBox(
                  width: size.width * 0.04,
                ),
                Text(
                  'Phosphorous',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              children: [
                Text(
                  '# 190 Per/ kg',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Container(
                  width: size.width * 0.4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ElevatedButton(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightGreen,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        textStyle: TextStyle(
                            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget defaultBotton({
    required Size size,
    required Function function,
    required String text,
  }) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ElevatedButton(
            child: Text(
              text.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              function();
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(210, 56, 193, 114),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );

}
