import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/transcript/transcript.dart';

// ignore_for_file: prefer_const_constructors
class WholeYear extends StatelessWidget {
  final ListController controller = Get.find();
  WholeYear({super.key});

  @override
  Widget build(BuildContext context) {
    
    // int sum=transcriptIndex;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      'Semester 1',
                      style: TextStyles.defaultStyle.ggfontblack16,
                    ),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Semester 2',
                      style: TextStyles.defaultStyle.ggfontblack16,
                    ),
                  )),
                  Expanded(
                      child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Ranked',
                      style: TextStyles.defaultStyle.ggfontblack16,
                    ),
                  ))
                ],
              ),
              //pace
            ),

            //body
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.listRow.length,
                    itemBuilder: (_, index) {
                      Transcript transcriptIndex = controller.listRow[index];
                      double sum = ((transcriptIndex.testOne)! +
                              (transcriptIndex.testTwo)!) /
                          2;
                      double sumn = ((transcriptIndex.testThree)! +
                              (transcriptIndex.testFour)!) /
                          2;
                      double total = (sum + sumn) / 2;
                      return Container(
                        height: h / 15,
                        color: ColorPalette.azure3,
                        child: Row(
                          children: [
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${transcriptIndex.nameSubject}',
                                style: TextStyles.defaultStyle.ggfontblack16,
                              ),
                            )),

                            //semester 1
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: _semesterOne(transcriptIndex, sum),
                              // child:MyWidget(transcript: transcriptIndex,)
                            )),
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: _semesterTwo(sumn),
                            )),
                            Expanded(
                                child: Align(
                              alignment: Alignment.center,
                              child: totalYear(total),
                            ))
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }

//semester 1
  _semesterOne(transcriptIndex, double sum) {
    if (sum > 0.0 && sum <= 4.9) {
      return Text('D');
    } else if (sum > 4.9 && sum <= 6.5) {
      return Text('C');
    } else if (sum > 6.5 && sum <= 8.5) {
      return Text('B');
    } else
      return Text('A');
  }

//semester 2
  _semesterTwo(double sumn) {
    if (sumn > 0.0 && sumn <= 4.9) {
      return Text('D');
    } else if (sumn > 4.9 && sumn <= 6.5) {
      return Text('C');
    } else if (sumn > 6.5 && sumn <= 8.5) {
      return Text('B');
    } else
      return Text('A');
  }

//total
  totalYear(double total) {
    if (total > 0.0 && total <= 4.9) {
      return Text('D');
    } else if (total > 4.9 && total <= 6.5) {
      return Text('C');
    } else if (total > 6.5 && total <= 8.5) {
      return Text('B');
    } else
      return Text('A');
  }
}
