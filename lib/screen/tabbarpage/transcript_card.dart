import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/transcript/transcript.dart';

class TranscriptCard extends StatelessWidget {
  final ListController controller = Get.find();
  final Transcript? transcript;

  TranscriptCard({super.key, this.transcript});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h / 16,
      color: ColorPalette.azure3,
      child: Row(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(
              '${transcript!.nameSubject}',
              style: TextStyles.defaultStyle.ggfont20,
            ),
          )),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text('${transcript!.testOne}'),
          )),
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text('${transcript!.testTwo}'),
          ))
        ],
      ),
    );
  }
}
