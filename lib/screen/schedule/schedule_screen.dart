import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/schedule/schedule.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/button.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:get/get.dart';
import 'package:studentapp/screen/schedule/add_taskbar.dart';
import 'package:studentapp/screen/schedule/schedule_card.dart';

class ScheduleScreen extends StatelessWidget {
  final ListController controller = Get.find();
  ScheduleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BackGroundHome(image: 'assets/images/backgroundmain.jpg'),
          BackGroundHome(image: 'assets/images/backgroundgradient.jpg'),
          Column(
            children: [
              //appbar
              AppBarContainer(
                text: 'Schudele',
                ontap: () {
                  Get.to(() => MainApp());
                },
                icon: const Icon(
                  Icons.schedule,
                  color: ColorPalette.colorWhite,
                ),
              ),
              //Row date time, add button
              _addTaskBar(context),
              //timeline
              _selectCalendar(context),
              //Task
              // _showTasks(context, Schedule)
              _showTasks(context)
            ],
          ),
        ],
      ),
    );
  }

//show task
  _showTasks(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.builder(
          itemCount: controller.listSchedule.length,
          itemBuilder: (_, index) {
            Schedule schedule = controller.listSchedule[index];
            print(schedule.toJson());
            if (schedule.repeat == 'Daily') {
              return _card(context, index, schedule);
            }
            if (schedule.date ==
                DateFormat.yMd().format(controller.selectDateTime.value)) {
              return _card(context, index, schedule);
            } else {
              return Container();
            }
          })),
    );
  }

//card
  _card(context, index, schedule) {
    return AnimationConfiguration.staggeredList(
        position: index,
        child: SlideAnimation(
            child: FadeInAnimation(
                child: Row(
          children: [
            GestureDetector(
              onTap: () {
                //show bottom sheet
                _showBottomSheet(
                    // context, controller.listSchedule[index])
                    context,
                    schedule);
              },
              //card
              child: ScheduleCard(schedule: schedule),
            ),
          ],
        ))));
  }

//add Task Bar
  _addTaskBar(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      width: w,
      height: h / 10,
      child: Row(
        children: [
          // date now
          Container(
            width: w / 1.7,
            padding: const EdgeInsets.symmetric(horizontal: padinglr),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //date time & Today
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: TextStyles.defaultStyle.ggfontsubheader,
                ),
                Text(
                  "Today",
                  style: TextStyles.defaultStyle.ggfontheader,
                )
              ],
            ),
          ),

          //button add
          SizedBox(
            width: w / 2.5,
            height: h / 9,
            child: Container(
              margin: const EdgeInsets.only(
                  top: padingcategory, bottom: padingcategory, right: pading24),
              child: Button(
                label: '+Add Task',
                // onTap: () => Get.to(AddTaskBarScreen()),
                onTap: () {
                  //call addtaskbar
                  Get.to(() => AddTaskBarScreen());
                  // update view ui
                  controller.getSchedule();
                },
              ),
            ),
          )
        ],
      ),
    );
  }

//select Calendar
  _selectCalendar(context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(bottom: pading12),
      padding: const EdgeInsets.only(left: padingcategory),
      child: DatePicker(
        DateTime.now(),
        height: h / 7,
        width: w / 5,
        initialSelectedDate: DateTime.now(),
        selectionColor: ColorPalette.blue1,
        selectedTextColor: ColorPalette.colorWhite,
        dateTextStyle: TextStyles.defaultStyle.ggfontsubheader,
        dayTextStyle: TextStyles.defaultStyle.ggfontgrey20,
        monthTextStyle: TextStyles.defaultStyle.ggfontgrey16,
        // onDateChange: (selectedDate) {
        //   controller.selectDateTime.value = selectedDate;
        //   // controller.onchangeDate(selectedDate);
        // },
        onDateChange: ((selectedDate) {
          controller.onchangeDate(selectedDate);
          controller.getSchedule();
        }),
      ),
    );
  }

//showbottom sheet
  _showBottomSheet(BuildContext context, Schedule schedule) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(
          top: padingcategory,
          left: pading20,
          right: pading20,
          bottom: pading10),
      height: schedule.isCompleted == 1
          ? MediaQuery.of(context).size.height / 3.5
          : MediaQuery.of(context).size.height / 2.5,
      color: ColorPalette.colorWhite,
      child: Column(
        children: [
          Container(
            width: button,
            height: padingcategory,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(pading12),
                color: ColorPalette.textblur),
          ),
          const Spacer(),
          schedule.isCompleted == 1
              ? Container()
              : _bottomSheetButton(
                  label: 'Task Completed',
                  onTap: () {
                    controller.updateComplete(schedule.id!);
                  },
                  color: ColorPalette.blue1,
                  context: context,
                ),

          const SizedBox(
            height: pading20,
          ),

          // button delete
          _bottomSheetButton(
            label: 'Delete Task',
            onTap: () {
              // call func delete
              controller.deleteShedule(schedule);
              Get.back();
            },
            color: ColorPalette.pinkColor,
            context: context,
          ),
          _bottomSheetButton(
            label: 'Close',
            onTap: () {
              Get.back();
            },
            color: ColorPalette.colorWhite,
            isClose: true,
            context: context,
          ),
        ],
      ),
    ));
  }

// Button Bottomsheet
  _bottomSheetButton(
      {required String label,
      required Function()? onTap,
      required Color color,
      //change color  background button
      bool isClose = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: padingcategory),
        width: MediaQuery.of(context).size.width / 1.3,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              //bool isClose: true return borderColor is backgroundColorbalck
              color:
                  isClose == true ? ColorPalette.backgroundColorbalck : color,
            ),
            borderRadius: BorderRadius.circular(pading20),
            color: isClose == true ? ColorPalette.colorWhite : color),
        child: Center(
          child: Text(
            label,
            // style: isClose
            //     ? TextStyles.defaultStyle.ggfontblack16
            //     : TextStyles.defaultStyle.ggfont16,
            style: isClose
                ? TextStyles.defaultStyle.ggfontblack16
                : TextStyles.defaultStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
