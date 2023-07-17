import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/transcript/transcript.dart';
import 'package:studentapp/screen/tabbarpage/task_transcript.dart';

class SemesterTwo extends StatelessWidget {
  final ListController controller = Get.find();
  final Transcript? transcript;
  SemesterTwo({super.key, this.transcript});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(color: ColorPalette.textblur),
      child: Column(
        children: [
          //Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: padingcategory),
            width: w,
            height: h / 12,
            decoration: const BoxDecoration(color: ColorPalette.colorWhite),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //header Subject
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Subject',
                    style: TextStyles.defaultStyle.ggfontblack16,
                  ),
                )),
                //header midterm1
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Midterm test',
                    style: TextStyles.defaultStyle.ggfontblack16,
                  ),
                )),
                //header final
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Final Test',
                    style: TextStyles.defaultStyle.ggfontblack16,
                  ),
                ))
              ],
            ),
          ),

          //Show list transcript
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.listRow.length,
                  itemBuilder: (_, index) {
                    // Transcript selectIndex = controller.list[index];
                    Transcript selectIndex = controller.listRow[index];
                    return TaskTranscript(
                      transcript: selectIndex,
                      textName: selectIndex.nameSubject,
                      test: selectIndex.testThree,
                      testn: selectIndex.testFour,
                    );
                  }))
        ],
      ),
    );
  }
}
