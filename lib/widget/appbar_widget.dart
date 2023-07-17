import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title,  this.titleName});
  // final Widget child;
  final String title;
  final String? titleName;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       SizedBox(
    //         width: w,
    //         height: h,
    //         child: const Image(
    //           image: AssetImage('assets/images/backgroundmain2.jpg'),
    //           fit: BoxFit.fitHeight,
    //         ),
    //       ),
    //       Container(
    //         padding: const EdgeInsets.only(left: padinglr, right: padinglr),
    //         width: w,
    //         height: h / 3,
    //         decoration: const BoxDecoration(
    //             color: ColorPalette.blue1,
    //             borderRadius:
    //                 BorderRadius.only(bottomLeft: Radius.circular(30))),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.only(top: h / 30),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   //text
    //                   Text(
    //                     title,
    //                     style: TextStyles.defaultStyle.textheader,
    //                   ),

    //                   //icon
    //                   IconButton(
    //                     onPressed: () {},
    //                     icon: const Icon(Icons.notifications),
    //                     color: ColorPalette.colorWhite,
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Text(
    //               titleName,
    //               style: TextStyles.defaultStyle.textsplashscreen,
    //             ),
    //             const SizedBox(
    //               height: textField,
    //             ),
    //             Container(
    //               decoration: const BoxDecoration(
    //                   color: ColorPalette.colorWhite,
    //                   borderRadius: BorderRadius.all(Radius.circular(20))),
    //               child: TextFormField(
    //                 decoration: const InputDecoration(
    //                     fillColor: ColorPalette.colorWhite,
    //                     hintText: "Search you topic",
    //                     prefixIcon: Icon(Icons.search),
    //                     suffixIcon: Icon(Icons.mic),
    //                     border: OutlineInputBorder(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(20)))),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    //c2
    return Container(
      padding: const EdgeInsets.only(left: padinglr, right: padinglr),
      width: w,
      height: h / 3,
      decoration: const BoxDecoration(
          color: ColorPalette.blue1,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: h / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //text
                Text(
                  title,
                  style: TextStyles.defaultStyle.textheader,
                ),

                //icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                  color: ColorPalette.colorWhite,
                )
              ],
            ),
          ),
          Text(
            titleName!,
            style: TextStyles.defaultStyle.textsplashscreen,
          ),
          const SizedBox(
            height: textField,
          ),
          Container(
            decoration: const BoxDecoration(
                color: ColorPalette.colorWhite,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextFormField(
              decoration: const InputDecoration(
                  fillColor: ColorPalette.colorWhite,
                  hintText: "Search you topic",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.mic),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          )
        ],
      ),
    );
  }
}
