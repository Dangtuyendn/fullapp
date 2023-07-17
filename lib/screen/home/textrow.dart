import 'package:flutter/material.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/core/dismension.dart';

class TextRow extends StatelessWidget {
  const TextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: padinglr, right: padinglr, top: pading16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Explore Category",
              style: TextStyles.defaultStyle.textwhite18,
            ),
            Text(
              "See All",
              style: TextStyles.defaultStyle.blue,
            ),
          ],
        ));
  }
}
