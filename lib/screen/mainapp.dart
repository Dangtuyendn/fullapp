import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/data/home/category.dart';
import 'package:studentapp/screen/home/myhomepage_screen.dart';
import 'package:studentapp/screen/profile.dart';
import 'package:studentapp/screen/setting.dart';

class MainApp extends StatelessWidget {
  final ListController controller = Get.find();
  final Category? category;
  final Account? acount;
  MainApp({super.key, this.acount, this.category});

  @override
  Widget build(BuildContext context) {
    // var dataName= Get.arguments;
    return Scaffold(
        body: Obx(() => IndexedStack(
              index: controller.index.value,
              children: [
                //home
                MyHomePageScreen(
                  category: category,
                  account: acount,
                ),

                //profile
                Profile(
                  account: acount,
                ),

                //Setting
                const Setting()
              ],
            )),
        bottomNavigationBar: Obx(
          () => SalomonBottomBar(
            currentIndex: controller.index.value,
            onTap: (newdata) {
              controller.onchangeBottomBar(newdata);
            },
            selectedItemColor: ColorPalette.blue1,
            unselectedItemColor: ColorPalette.blue,
            margin: const EdgeInsets.symmetric(
                horizontal: pading24, vertical: pading18),
            items: [
              //home
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.house,
                    size: pading18,
                  ),
                  title: const Text("Home")),

              //profile
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.solidUser,
                    size: pading18,
                  ),
                  title: const Text("Profile")),

              //settings
              SalomonBottomBarItem(
                  icon: const Icon(
                    FontAwesomeIcons.gear,
                    size: pading18,
                  ),
                  title: const Text("Setting")),
            ],
          ),
        ));
  }
}
