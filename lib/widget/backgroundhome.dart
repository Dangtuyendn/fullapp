import 'package:flutter/material.dart';

class BackGroundHome extends StatelessWidget {
 final  String image;
  BackGroundHome({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
        width: w,
        height: h,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        )
        // child:  Image(
        //   image: AssetImage("assets/images/backgroundmain2.jpg"),
        //   fit: BoxFit.fitHeight,
        // ),
        );
  }
}
