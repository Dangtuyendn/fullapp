import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';

class DropDownBT extends StatelessWidget {
 final Widget? icon;
 final List<DropdownMenuItem<String>>? item;
 final Function(String?)? onchange;
  DropDownBT({super.key, this.icon, this.item, this.onchange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        icon:const Icon(Icons.keyboard_arrow_down, color: ColorPalette.backgroundColorbalck,),
        iconSize: 32,
        elevation: 4,
        underline: Container(
          height: 0,
        ),
        items: item,
        onChanged: onchange);
  }
}
