import 'package:flutter/material.dart';

// class TextFormFieldWiget extends StatelessWidget {
//   final Icon icon;
//   final String hintext;
//   final Color boderColor;
//   final Color enableColor;
//   final Color focusedColor;
//   final Color disableColor;
//   const TextFormFieldWiget({
//     super.key,
//     required this.icon,
//     required this.hintext,
//     required this.boderColor,
//     required this.enableColor,
//     required this.focusedColor,
//     required this.disableColor
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: InputDecoration(
//           prefixIcon: icon,
//           hintText: hintext,
//           border: OutlineInputBorder(borderSide: BorderSide(color: boderColor)),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color:enableColor ),
//           ),
//           focusedBorder:
//               OutlineInputBorder(borderSide: BorderSide(color: focusedColor)),
//           disabledBorder:
//               OutlineInputBorder(borderSide: BorderSide(color: disableColor))),
//     );
//   }
// }

class TextFormFieldWiget extends StatelessWidget {
  final Icon icon;
  final String hintext;
  final String? obsCureText;
  final String? suFfixIcon;
  final TextEditingController? textcontroller;
   const TextFormFieldWiget({
    super.key,
    required this.icon,
    required this.hintext,
    this.obsCureText,
    this.suFfixIcon,
    this.textcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textcontroller,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintext,
        ));
  }
}
