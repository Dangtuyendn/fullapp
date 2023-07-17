import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/data/subject/subject.dart';
import 'package:studentapp/screen/subject/subject_screen.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:studentapp/widget/button.dart';
import 'package:studentapp/widget/dropdownbt.dart';
import 'package:studentapp/widget/textfield_widgetn.dart';

class AddSubject extends StatelessWidget {
  final ListController controller = Get.find();
  Subject? subject;
  AddSubject({super.key, this.subject});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/pencil2.jpg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //appbar
              AppBarContainer(
                  ontap: () {
                    Get.to(() => SubjectScreen());
                  },
                  text: 'Add Subject'),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //select subject
                  Obx(
                    () => TextFieldWidgetN(
                      textTitle: 'Select Subject',
                      hinText: controller.selectSubject.value,
                      widget: DropDownBT(
                        item: controller.listSubject
                            .map<DropdownMenuItem<String>>((String? newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Text('${newValue!} '),
                          );
                        }).toList(),
                        onchange: (String? newData) {
                          controller.selectSubject.value = newData!;
                        },
                      ),
                    ),
                  ),

                  //Select Teacher
                  Obx(
                    () => TextFieldWidgetN(
                      textTitle: 'Select Teacher',
                      hinText: controller.selectTeacher.value,
                      widget: DropDownBT(
                        item: controller.listTeacher
                            .map<DropdownMenuItem<String>>((String? newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Text('${newValue!} '),
                          );
                        }).toList(),
                        onchange: (String? newData) {
                          controller.selectTeacher.value = newData!;
                        },
                      ),
                    ),
                  ),

                  //Room
                  Obx(
                    () => TextFieldWidgetN(
                      textTitle: 'Select Room',
                      hinText: controller.selectRoom.value,
                      widget: DropDownBT(
                        item: controller.listRoom
                            .map<DropdownMenuItem<String>>((String? newValue) {
                          return DropdownMenuItem<String>(
                            value: newValue,
                            child: Text('${newValue!} '),
                          );
                        }).toList(),
                        onchange: (String? newData) {
                          controller.selectRoom.value = newData!;
                        },
                      ),
                    ),
                  ),

                  //WeekDay & Number
                  Row(
                    children: [
                      // WeekDay
                      Obx(() => Expanded(
                          flex: 3,
                          child: TextFieldWidgetN(
                            textTitle: 'Day',
                            hinText: controller.selectWeekDay.value,
                            widget: DropDownBT(
                              item: controller.listWeekDay
                                  .map<DropdownMenuItem<String>>(
                                      (String? newValue) {
                                return DropdownMenuItem<String>(
                                  value: newValue,
                                  child: Text('${newValue!} '),
                                );
                              }).toList(),
                              onchange: (String? newValue) {
                                controller.selectWeekDay.value = newValue!;
                              },
                            ),
                          ))),
                      //Number
                      Obx(() => Expanded(
                          flex: 2,
                          child: TextFieldWidgetN(
                            textTitle: 'Period',
                            hinText: '${controller.selectNumber.value}',
                            widget: DropDownBT(
                              item: controller.listNumber
                                  .map<DropdownMenuItem<String>>(
                                      (int? newValue) {
                                return DropdownMenuItem<String>(
                                  value: newValue.toString(),
                                  child: Text('${newValue!.toString()} '),
                                );
                              }).toList(),
                              onchange: (String? newValue) {
                                controller.selectNumber.value =
                                    int.parse(newValue!);
                              },
                            ),
                          ))),
                    ],
                  ),
                  //Button ADD
                  Container(
                    padding: const EdgeInsets.only(
                        left: pading24, right: pading24, bottom: pading24),
                    margin: const EdgeInsets.symmetric(vertical: pading24),
                    height: h / 7,
                    child: Button(
                        onTap: () {
                          controller.addSubject();
                          controller.showDataSubject();
                          Get.back();
                        },
                        label: 'ADD'),
                  )
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
