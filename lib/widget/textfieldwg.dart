import 'package:flutter/material.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/textstyle.dart';

class TextFieldWg extends StatelessWidget {
  final String? lableText;
  final String? hinText;
  final String textTitle;
  final TextEditingController? textcontroller;
  final Widget? widget;
  const TextFieldWg(
      {this.lableText,
      this.hinText,
      this.textcontroller,
      this.widget,
      required this.textTitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: padingRow, horizontal: pading24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textTitle,
            style: TextStyles.defaultStyle.ggfont20,
          ),
          Container(
            padding: const EdgeInsets.only(right: pading10),
            margin: const EdgeInsets.only(top: 0),
            height: h / 14,
            decoration: BoxDecoration(
                // color: ColorPalette.colorWhite,
                border: Border.all(color: ColorPalette.azure3, width: 1.0),
                borderRadius:
                    const BorderRadius.all(Radius.circular(pading10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textcontroller,
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: hinText,
                      labelText: lableText,
                      // focusedBorder: UnderlineInputBorder(
                      //     borderSide:
                      //         BorderSide(color: ColorPalette.colorWhite, width: 0)),
                      // enabledBorder: UnderlineInputBorder(
                      //     borderSide:
                      //         BorderSide(color: ColorPalette.colorWhite, width: 0)),

                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                // if widget == null is container null, else container child widget
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
