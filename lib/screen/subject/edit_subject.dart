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

class EditSubject extends StatelessWidget {
  final ListController controller = Get.find();
  final int? index;
  final Subject? subject;
  EditSubject({super.key, this.index, this.subject});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/backgroundedit.jpg'),
          Column(
            children: [
              AppBarContainer(
                
                ontap: () {
                  Get.to(()=>SubjectScreen());
                },
                text: 'Edit Subject',
                icon: const Icon(Icons.edit),
              ),
              Column(
                children: [
                  //name
                  Obx(() => TextFieldWidgetN(
                        textTitle: 'Select Subject',
                        hinText: controller.selectSubject.value,
                        // hinText: '${controller.selectSubject.value}',
                        widget: DropDownBT(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          item: controller.listSubject
                              .map<DropdownMenuItem<String>>(
                                  (String? newValue) {
                            return DropdownMenuItem(
                              value: newValue,
                              child: Text('${newValue!} '),
                            );
                          }).toList(),
                          onchange: (String? newData) {
                            return controller.selectSubject.value = newData!;
                          },
                        ),
                      )),

                  //Select Teacher
                  Obx(() => TextFieldWidgetN(
                        textTitle: 'Select Teacher',
                        hinText: controller.selectTeacher.value,
                        widget: DropDownBT(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          item: controller.listTeacher
                              .map<DropdownMenuItem<String>>(
                                  (String? newValue) {
                            return DropdownMenuItem(
                              value: newValue,
                              child: Text('${newValue!} '),
                            );
                          }).toList(),
                          onchange: (String? newData) {
                            return controller.selectTeacher.value = newData!;
                          },
                        ),
                      )),

                  //Room
                  Obx(() => TextFieldWidgetN(
                        textTitle: 'Select Room',
                        hinText: controller.selectRoom.value,
                        widget: DropDownBT(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          item: controller.listRoom
                              .map<DropdownMenuItem<String>>(
                                  (String? newValue) {
                            return DropdownMenuItem(
                              value: newValue,
                              child: Text('${newValue!} '),
                            );
                          }).toList(),
                          onchange: (String? newData) {
                            return controller.selectRoom.value = newData!;
                          },
                        ),
                      )),

                  //Day & period
                  Row(
                    children: [
                      Obx(() => Expanded(
                          flex: 3,
                          child: TextFieldWidgetN(
                            textTitle: 'Day',
                            hinText: controller.selectWeekDay.value,
                            widget: DropDownBT(
                              icon: const Icon(Icons.keyboard_arrow_down),
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
                              icon: const Icon(Icons.keyboard_arrow_down),
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

                  //button Edit
                  Container(
                    height: h / 12,
                    padding: const EdgeInsets.symmetric(horizontal: pading24),
                    child: Button(
                        onTap: () {
                          controller.editSubject(subject);
                          Get.to(() => SubjectScreen());
                        },
                        label: 'Update'),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
