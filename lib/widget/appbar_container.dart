import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/home/category.dart';

class AppBarContainer extends StatelessWidget {
  AppBarContainer(
      {super.key,
      this.color,
      required this.text,
      this.icon,
      this.category,
      this.ontap,
      this.iconBack});
  final Category? category;
  final String text;
  final Icon? icon;
  final Icon? iconBack;
  final Color? color;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: color,
      padding: const EdgeInsets.only(
        left: pading24,
        right: pading24,
        bottom: pading24,
        top: padingappbar50,
      ),
      width: w,
      child: Row(
        children: [
          //icon back
          GestureDetector(
              onTap: ontap,
              child: text == 'Setting' || text == 'Profile'
                  ? Container()
                  : Icon(
                      Icons.arrow_back,
                      // color: text == 'Add Transcript'
                      //     ? ColorPalette.backgroundColorbalck
                      //     : ColorPalette.colorWhite,
                      color: text == 'Add Transcript'
                          ? ColorPalette.backgroundColorbalck
                          : ColorPalette.colorWhite,
                    )
              // iconBack==null ? Container():iconBack
              //  const Icon(
              //   Icons.arrow_back,
              //   color: ColorPalette.colorWhite,
              // ),
              ),

          const SizedBox(
            width: padingRow,
          ),

          //text
          Text(
            text,
            style: text == 'Add Transcript'
                ? TextStyles.defaultStyle.ggfontheaderblack23
                : TextStyles.defaultStyle.textheader,
          ),
          Expanded(child: Align(alignment: Alignment.centerRight, child: icon))
        ],
      ),
    );
  }
}
