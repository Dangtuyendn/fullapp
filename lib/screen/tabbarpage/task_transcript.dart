import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/data/transcript/transcript.dart';

class TaskTranscript extends StatelessWidget {
  final Transcript? transcript;
  final String? textName;
  final int? test;
  final int? testn;
  const TaskTranscript(
      {super.key, this.textName, this.test, this.testn, this.transcript});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h / 16,
      color: transcript!.id! % 2 == 0
          ? ColorPalette.azure3
          : ColorPalette.textblur,
      child: Row(
        children: [
          //subject
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(textName!),
          )),

          //test
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(test.toString()),
          )),

          //testn
          Expanded(
              child: Align(
            alignment: Alignment.center,
            child: Text(testn.toString()),
          ))
        ],
      ),
    );
  }
}
