import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/subject/subject.dart';

class SubjectCard extends StatelessWidget {
  final Subject? subject;
  const SubjectCard({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h / 4.5,
      padding: const EdgeInsets.only(
          left: pading24, right: pading24, bottom: pading24),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: pading10, horizontal: pading12),
        width: w,
        decoration: BoxDecoration(
            color: ColorPalette.colorWhite,
            borderRadius: BorderRadius.circular(pading12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //day & period
            Text(
              '${subject!.day}',
              style: TextStyles.defaultStyle.ggfontbl20,
            ),
            const Divider(
              height: 2,
              color: ColorPalette.backgroundColorbalck,
            ),
            Row(
              children: [
                //time
                Container(
                  width: w / 2.3,
                  height: h / 9,
                  // decoration:
                  //     const BoxDecoration(color: ColorPalette.greenColor),
                  alignment: Alignment.center,
                  child: _getTimer(subject!.period),
                ),
                //title & sub title
                SizedBox(
                  width: w / 2.7,
                  height: h / 9,
                  // decoration: const BoxDecoration(color: ColorPalette.azure3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${subject!.nameSubject}',
                        style: TextStyles.defaultStyle.ggfontsubheaderblue,
                      ),
                      const SizedBox(
                        height: pading16,
                      ),
                      Text(
                        'Room: ${subject!.room}',
                        style: TextStyles.defaultStyle.ggfontgrey20,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Back Ground Color
  _getTimer(int? no) {
    switch (no) {
      case 1:
        return Text(
          '7:00',
          style: TextStyles.defaultStyle.ggfontheaderblue,
        );
      case 2:
        return Text('8:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 3:
        return Text('9:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 4:
        return Text('10:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 5:
        return Text('11:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 6:
        return Text('13:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 7:
        return Text('14:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 8:
        return Text('15:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      case 9:
        return Text('16:00', style: TextStyles.defaultStyle.ggfontheaderblue);
      default:
        return Text('17:00', style: TextStyles.defaultStyle.ggfontheaderblue);
    }
  }
}
