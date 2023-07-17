import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/screen/tabbarpage/add_tabbar.dart';
import 'package:studentapp/screen/tabbarpage/semester_one_tab.dart';
import 'package:studentapp/screen/tabbarpage/semester_two_tab.dart';
import 'package:studentapp/screen/tabbarpage/wholeyear_tab.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';

class TranscriptScreen extends StatelessWidget {
  final ListController controller = Get.find();
  TranscriptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.width;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/backgroundcolor1.jpg'),
          Column(
            children: [
              //appbar
              AppBarContainer(
                ontap: () {
                  Get.to(() => MainApp());
                },
                text: 'Transcript',
                icon: const Icon(
                  Icons.assignment,
                  color: ColorPalette.colorWhite,
                ),
              ),

              //tabbar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: pading24),
                padding: const EdgeInsets.all(padingcategory),
                height: h / 6,
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(pading12),
                    color: ColorPalette.textblur),
                child: TabBar(
                    controller: controller.tabController,
                    labelColor: ColorPalette.colorWhite,
                    indicatorColor: ColorPalette.colorWhite,
                    indicator: BoxDecoration(
                        color: ColorPalette.colorWhite,
                        borderRadius: BorderRadius.circular(padingcategory)),
                    tabs: [
                      Container(
                        width: w,
                        height: h / 8,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(padingcategory)),
                        child: Tab(
                            child: Text(
                          'Semester 1',
                          style: TextStyles.defaultStyle.ggfontblack16,
                        )),
                      ),
                      Container(
                        width: w,
                        height: h / 8,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(padingcategory)),
                        child: Tab(
                            child: Text(
                          'Semester 2',
                          style: TextStyles.defaultStyle.ggfontblack16,
                        )),
                      ),
                      Container(
                        width: w,
                        height: h / 8,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(padingcategory)),
                        child: Tab(
                          child: Text(
                            'Whole Year',
                            style: TextStyles.defaultStyle.ggfontblack16,
                          ),
                        ),
                      ),
                    ]),
              ),

              //tabbar View
              Container(
                width: w,
                height: h / 1.1,
                margin: const EdgeInsets.only(
                    left: pading24, right: pading24, top: pading24),
                child:
                    TabBarView(controller: controller.tabController, children: [
                  SemesterOne(),
                  SemesterTwo(),
                  WholeYear(),
                ]),
              ),
            ],
          ),

          //floating button add
          Positioned(
              right: pading24,
              bottom: pading24,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => AddTabbarScreen());
                },
                child: const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.add),
                ),
              ))
        ],
      ),
    );
  }
}
