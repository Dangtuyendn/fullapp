import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/screen/tabbarpage/transcript_screen.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:studentapp/widget/button.dart';
import 'package:studentapp/widget/dropdownbt.dart';
import 'package:studentapp/widget/textfield_widgetn.dart';

class AddTabbarScreen extends StatelessWidget {
  final ListController controller = Get.find();
  AddTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/gradienttabbar.jpg'),
          Column(
            children: [
              AppBarContainer(
                ontap: () {
                  Get.to(() => TranscriptScreen());
                },
                text: 'Add Transcript',
                icon: const Icon(Icons.assignment_sharp),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //name
                    Obx(() => TextFieldWidgetN(
                          hinText: controller.nameSubject.value,
                          textTitle: 'Select Subject',
                          widget: DropDownBT(
                            item: controller.listSubject
                                .map<DropdownMenuItem<String>>(
                                    (String? newValue) {
                              return DropdownMenuItem<String>(
                                  value: newValue,
                                  child: Text('${newValue!} '));
                            }).toList(),
                            onchange: (String? newValue) {
                              controller.nameSubject.value = newValue!;
                            },
                          ),
                        )),

                    //Midterm 1
                    Obx(() => TextFieldWidgetN(
                          textTitle: 'MidTerm One',
                          hinText: ' ${controller.testOne.value}',
                          widget: DropDownBT(
                            item: controller.listNumber
                                .map<DropdownMenuItem<String>>((int? newValue) {
                              return DropdownMenuItem<String>(
                                value: newValue.toString(),
                                child: Text('${newValue!.toString()} '),
                              );
                            }).toList(),
                            onchange: (String? newValue) {
                              controller.testOne.value = int.parse(newValue!);
                            },
                          ),
                        )),

                    //final 1
                    Obx(() => TextFieldWidgetN(
                          textTitle: 'Final One',
                          hinText: ' ${controller.testTwo.value}',
                          widget: DropDownBT(
                            item: controller.listNumber
                                .map<DropdownMenuItem<String>>((int? newValue) {
                              return DropdownMenuItem<String>(
                                value: newValue.toString(),
                                child: Text('${newValue!.toString()} '),
                              );
                            }).toList(),
                            onchange: (String? newValue) {
                              controller.testTwo.value = int.parse(newValue!);
                            },
                          ),
                        )),

                    // Midterm 2
                    Obx(() => TextFieldWidgetN(
                          textTitle: 'MidTerm Two',
                          hinText: ' ${controller.testThree.value}',
                          widget: DropDownBT(
                            item: controller.listNumber
                                .map<DropdownMenuItem<String>>((int? newValue) {
                              return DropdownMenuItem<String>(
                                value: newValue.toString(),
                                child: Text('${newValue!.toString()} '),
                              );
                            }).toList(),
                            onchange: (String? newValue) {
                              controller.testThree.value = int.parse(newValue!);
                            },
                          ),
                        )),

                    //Final 2
                    Obx(() => TextFieldWidgetN(
                          textTitle: 'Final Two',
                          hinText: ' ${controller.testFour.value}',
                          widget: DropDownBT(
                            item: controller.listNumber
                                .map<DropdownMenuItem<String>>((int? newValue) {
                              return DropdownMenuItem<String>(
                                value: newValue.toString(),
                                child: Text('${newValue!.toString()} '),
                              );
                            }).toList(),
                            onchange: (String? newValue) {
                              controller.testFour.value = int.parse(newValue!);
                            },
                          ),
                        )),

                    //Button Add
                    GestureDetector(
                      onTap: () {
                        controller.addTranscript();
                        controller.showDataTranscript();
                        Get.to(() => TranscriptScreen());
                      },
                      child: Container(
                        width: w,
                        height: h / 8,
                        padding: const EdgeInsets.only(
                            left: pading24, right: pading24, bottom: pading24),
                        child: Button(label: 'CREATE'),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
