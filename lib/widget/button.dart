import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/textstyle.dart';

class Button extends StatelessWidget {
 final String label;
 final Color? color;
 final Function()? onTap;

  Button({required this.label, this.color, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            color: _setColor(context, label: label),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyles.defaultStyle.ggfont20,
        ),
      ),
    );
  }

  _setColor(BuildContext context, {String? label}) {
    if (label == 'Delete') {
      return ColorPalette.redColor;
    } else if (label == 'Close') {
      return ColorPalette.textblur;
    } else {
      return ColorPalette.blue1;
    }
  }
}
