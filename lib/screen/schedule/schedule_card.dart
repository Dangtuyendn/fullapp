import 'package:flutter/material.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/schedule/schedule.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule? schedule;
  const ScheduleCard({super.key, this.schedule});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: pading20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: pading12),
      child: Container(
        padding: const EdgeInsets.all(pading10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(pading12),
          color: _getBGClr(schedule?.color ?? 0),
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //total
                Text(
                  schedule?.title ?? '',
                  style: TextStyles.defaultStyle.ggfont16,
                ),
                const SizedBox(
                  height: 12,
                ),

                //startTime_endTime
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: ColorPalette.colorWhite,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${schedule!.startTime}-${schedule!.endTime}',
                      style: TextStyles.defaultStyle.ggfont12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: pading12,
                ),
                //note
                Text(
                  schedule?.note ?? '',
                  style: TextStyles.defaultStyle.ggfont16,
                )
              ],
            )),
            //Line
            Container(
              margin: const EdgeInsets.symmetric(horizontal: pading10),
              height: 60,
              width: 0.5,
              color: ColorPalette.textblur,
            ),
            //Status
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                schedule!.isCompleted == 1 ? 'COMPLETED' : 'TODO',
                style: TextStyles.defaultStyle.ggfont10,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Back Ground Color
  _getBGClr(int no) {
    switch (no) {
      case 0:
        return ColorPalette.blue1;
      case 1:
        return ColorPalette.redColor;
      case 2:
        return ColorPalette.yellowColor;
      default:
        return ColorPalette.textblur;
    }
  }
}
