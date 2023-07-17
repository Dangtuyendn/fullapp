import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/transcript/transcript.dart';
import 'package:studentapp/screen/tabbarpage/task_transcript.dart';
import 'package:studentapp/screen/tabbarpage/wholeyear_tab.dart';

class SemesterOne extends StatelessWidget {
  
  final ListController controller = Get.find();
  SemesterOne({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
                children: [
                  Expanded(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Subject',
                      style: TextStyles.defaultStyle.ggfontblack16,
                    ),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Midterm test',
                      style: TextStyles.defaultStyle.ggfontblack16,
                    ),
                  )),
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
              //pace
            ),

            //Show list transcript
            Obx(() => Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    // itemCount: controller.list.length,
                    itemCount: controller.listRow.length,
                    itemBuilder: (_, index) {
                      Transcript selectIndex = controller.listRow[index];
                      // return TranscriptCard(
                      //   transcript: selectIndex,
                      // );

                      return TaskTranscript(
                        transcript: selectIndex,
                        textName: selectIndex.nameSubject,
                        test: selectIndex.testOne,
                        testn: selectIndex.testTwo,
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
