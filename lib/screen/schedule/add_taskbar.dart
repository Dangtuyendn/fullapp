import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/screen/schedule/schedule_screen.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/button.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:studentapp/widget/textfieldwg.dart';

class AddTaskBarScreen extends StatelessWidget {
  final ListController controller = Get.find();

  AddTaskBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        BackGroundHome(image: 'assets/images/backgroundgradient.jpg'),
        SizedBox(
          height: h,
          width: w,
          child: SingleChildScrollView(
              child: SizedBox(
            child: Column(
              children: [
                AppBarContainer(
                  text: 'Add Task',
                  ontap: () {
                    Get.to(() => ScheduleScreen());
                  },
                ),

                //title
                TextFieldWg(
                  textTitle: 'Title',
                  hinText: 'title',
                  textcontroller: controller.tittleEdittingController,
                ),

                //Note
                TextFieldWg(
                  textTitle: 'Note',
                  hinText: 'note',
                  textcontroller: controller.noteEdittingController,
                ),

                //Select date
                Obx(() => TextFieldWg(
                      textTitle: 'Date',
                      hinText: DateFormat.yMd()
                          .format(controller.selectDateTime.value)
                          .toString(),
                      widget: GestureDetector(
                        onTap: () {
                          _getCupertino(context);
                        },
                        child: const Icon(Icons.calendar_today_outlined),
                      ),
                    )),

                //StartTime and EndTime
                Row(
                  children: [
                    Expanded(
                      child: Obx(() => TextFieldWg(
                            textTitle: 'Start',
                            // hinText: _startTime,
                            hinText: controller.startTime.value,
                            widget: GestureDetector(
                              onTap: () {
                                _getTime(isStartTime: true, context: context);
                              },
                              child: const Icon(Icons.access_time_rounded),
                            ),
                          )),
                    ),
                    Expanded(
                        child: Obx(
                      () => TextFieldWg(
                        textTitle: 'End',
                        hinText: controller.endTime.value,
                        widget: GestureDetector(
                          onTap: () {
                            _getTime(
                              isStartTime: false,
                              context: context,
                            );
                          },
                          child: const Icon(Icons.access_time_rounded),
                        ),
                      ),
                    ))
                  ],
                ),

                //Dropdownbutton remind
                Obx(() => TextFieldWg(
                      textTitle: 'Remind',
                      hinText: '${controller.selectRemind.value} minutes',
                      widget: DropdownButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: ColorPalette.backgroundColorbalck,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          underline: Container(
                            height: 0,
                          ),
                          items: controller.listRemind
                              .map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text('${value.toString()} '),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // print(_selectRemind.value);
                            controller.selectRemind.value =
                                int.parse(newValue!);
                          }),
                    )),

                //repeat
                Obx(() => TextFieldWg(
                      textTitle: 'Repeat',
                      hinText: controller.selectRepeat.value,
                      widget: DropdownButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: ColorPalette.backgroundColorbalck,
                          ),
                          iconSize: 32,
                          elevation: 4,
                          underline: Container(
                            height: 0,
                          ),
                          items: controller.listRepeat
                              .map<DropdownMenuItem<String>>(
                                  (String? newValue) {
                            return DropdownMenuItem<String>(
                              value: newValue,
                              child: Text('${newValue!} '),
                            );
                          }).toList(),
                          onChanged: (String? newData) {
                            controller.selectRepeat.value = newData!;
                          }),
                    )),

                //select color & button add
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: pading24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Text & select color
                      _selectColorList(),

                      //button CreateTask
                      SizedBox(
                        width: w / 2.5,
                        height: h / 12,
                        child: Button(
                          label: "Create Task",
                          // onTap: (() => _checkInput()),
                          onTap: () {
                            _checkInput();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
        )
      ],
    ));
  }

//Get Style datepicker
  _getDateForm(context) async {
    DateTime? _cupertinoDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2130));
    if (_cupertinoDate != null) {
      controller.selectDateTime.value = _cupertinoDate;
    } else {}
  }

//Get style cupertinoDatepicker
  _getCupertino(context) async {
    double h = MediaQuery.of(context).size.height;
    DateTime? _cupertinoDatePicker = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            height: h / 3,
            color: ColorPalette.colorWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Done')),
                Expanded(
                    child: CupertinoDatePicker(
                  initialDateTime: controller.selectDateTime.value,
                  onDateTimeChanged: (DateTime date) {
                    controller.selectDateTime.value = date;
                  },
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.date,
                ))
              ],
            ),
          );
        });
    if (_cupertinoDatePicker != null) {
      controller.selectDateTime.value = _cupertinoDatePicker;
    } else {}
  }

//Get Time cupertino
  _getTime({
    required context,
    required bool isStartTime,
  }) async {
    var timeCupertino = await _showTimePicker(context);
    String _formatTime = timeCupertino.format(context);
    // String _formatTime = timeCupertino.toString(context);
    // String _formatTime = timeCupertino();
    if (timeCupertino == null) {
      print ( 'object');
    } else if (isStartTime == true) {
      controller.startTime.value = _formatTime;
    } else if (isStartTime == false) {
      controller.endTime.value = _formatTime;
    }
  } //end getTime

//Show time picker
  _showTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay(
        hour: int.parse(controller.startTime.value.split(':')[0]),
        minute:
            int.parse(controller.startTime.value.split(':')[1].split('')[0]),
      ),
      // time of day
      // TimeOfDay.now()
    );
  }

//select Color
  _selectColorList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text
        Container(
          padding: const EdgeInsets.symmetric(vertical: padingcategory),
          child: Text(
            'Color',
            style: TextStyles.defaultStyle.ggfontsubheader,
          ),
        ),
        //select color
        Obx(() => Wrap(
              children: List<Widget>.generate(3, (int index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectColor.value = index;
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: padingcategory),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? ColorPalette.blue1
                          : index == 1
                              ? ColorPalette.pinkColor
                              : ColorPalette.yellowColor,
                      child: controller.selectColor.value == index
                          ? const Icon(
                              Icons.done,
                              color: ColorPalette.colorWhite,
                              size: 16,
                            )
                          : Container(),
                    ),
                  ),
                );
              }),
            ))
      ],
    );
  }

//c1: check input
  _checkInput() {
    if (controller.tittleEdittingController.text.isNotEmpty &&
        controller.noteEdittingController.text.isNotEmpty) {
      //add datab
      controller.addSchedule();
      Get.back();
    } else if (controller.tittleEdittingController.text.isEmpty ||
        controller.noteEdittingController.text.isEmpty) {
      Get.snackbar('Required', 'All field are required !',
          backgroundColor: ColorPalette.colorWhite,
          icon: const Icon(Icons.warning_amber_rounded));
    }
  }
}
