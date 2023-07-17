import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/home/category.dart';
import 'package:studentapp/data/subject/subject.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/screen/subject/add_subject.dart';
import 'package:studentapp/screen/subject/edit_subject.dart';
import 'package:studentapp/screen/subject/subject_card.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:studentapp/widget/button.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SubjectScreen extends StatelessWidget {
  final ListController controller = Get.find();
  final Category? category;
  SubjectScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/background7.jpg'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Appbar
              AppBarContainer(
                ontap: () {
                  Get.to(() => MainApp());
                },
                text: 'Subject',
              ),
              //Row Text& Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: pading24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: pading24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //text
                          Text(
                            'Create Subject',
                            style: TextStyles.defaultStyle.ggfontsubheader,
                          ),
                          //button Create
                          SizedBox(
                            width: w / 3,
                            height: h / 12,
                            child: Button(
                              label: 'Create',
                              onTap: () {
                                Get.to(() => AddSubject());
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //List
              _showList(context)
            ],
          )
        ],
      ),
    );
  }

  //Show
  _showList(BuildContext context) {
    return Obx(() => Expanded(
        child: ListView.builder(
            itemCount: controller.listOfSubject.length,
            itemBuilder: (_, index) {
              Subject subject = controller.listOfSubject[index];
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, subject);
                          },
                          child: SubjectCard(subject: subject),
                        )
                      ],
                    ),
                  )));
            })));
  }

  //ShowBottomSheet
  _showBottomSheet(context, Subject? subject) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Get.bottomSheet(Container(
      height: h / 2.3,
      padding: const EdgeInsets.only(bottom: padingappbar50 - 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(pading24),
            topRight: Radius.circular(pading24),
          ),
          color: ColorPalette.colorWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //line
          Container(
            width: w / 2.7,
            height: padingcategory,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(pading12),
                color: ColorPalette.textblur),
          ),
          // button edit
          Container(
            height: h / 10,
            padding: const EdgeInsets.symmetric(horizontal: pading24 * 2),
            child: Button(
              onTap: () {
                // controller.nameEditingController
                //                                       .text =
                //                                   controller
                //                                       .newStudent[index].name;
                controller.selectSubject.value = subject!.nameSubject!;
                controller.selectTeacher.value = subject.teacher!;
                controller.selectRoom.value = subject.room!;
                controller.selectWeekDay.value = subject.day!;
                controller.selectPeriods.value = subject.period.toString();
                Get.to(() => EditSubject(
                      subject: subject,
                    ));
              },
              label: 'Edit',
              color: ColorPalette.blue1,
            ),
          ),
          Container(
            height: h / 10,
            padding: const EdgeInsets.symmetric(horizontal: pading24 * 2),
            child: Button(
                label: 'Delete',
                onTap: () {
                  controller.deleteSubject(subject!);
                  print('delete success');
                  Get.back();
                }),
          ),
          Container(
            height: h / 10,
            padding: const EdgeInsets.symmetric(horizontal: pading24 * 2),
            child: Button(
              onTap: () {
                Get.back();
              },
              label: 'Close',
            ),
          ),
        ],
      ),
    ));
  }
}
