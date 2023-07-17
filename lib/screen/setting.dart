import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/screen/account/login_screen.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        //BackGround
        BackGroundHome(
          // image: 'assets/images/PurpleGradient.jpg',
          image: 'assets/images/RoyalGradient.jpg',
        ),
        Column(
          children: [
            //appbar
            AppBarContainer(
              text: 'Setting',
              icon: const Icon(
                Icons.settings,
                color: ColorPalette.colorWhite,
              ),
            ),

            //body
            Container(
              margin: const EdgeInsets.only(
                  left: pading24,
                  right: padingappbar50 * 2,
                  top: pading16,
                  bottom: pading16),
              width: w,
              height: h / 1.5,
              child: Stack(
                children: [
                  //box
                  SizedBox(
                    width: w,
                    height: h,
                    child: const Image(
                      image: AssetImage(
                        'assets/images/BoxSetting.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),

                  //column
                  Column(
                    children: [
                      _getRow(
                          context,
                          const Icon(
                            Icons.person,
                            color: ColorPalette.colorWhite,
                          ),
                          'Account Setting',
                          () {}),
                      _getRow(
                          context,
                          const Icon(
                            Icons.notifications,
                            color: ColorPalette.colorWhite,
                          ),
                          'Notifications',
                          () {}),
                      _getRow(
                          context,
                          const Icon(
                            Icons.language,
                            color: ColorPalette.colorWhite,
                          ),
                          'Language',
                          () {}),
                      _getRow(
                          context,
                          const Icon(
                            Icons.privacy_tip_rounded,
                            color: ColorPalette.colorWhite,
                          ),
                          'Privacy Setting',
                          () {}),
                      _getRow(
                          context,
                          const Icon(
                            Icons.keyboard_return_rounded,
                            color: ColorPalette.colorWhite,
                          ),
                          'About',
                          () {}),
                      _getRow(
                          context,
                          const Icon(
                            Icons.logout,
                            color: ColorPalette.colorWhite,
                          ),
                          'Logout', () {
                        Get.to(() => LoginScreen());
                      }),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }

//getRow
  _getRow(
    context,
    Icon? icon,
    String? text,
    Function()? ontap,
  ) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: pading20, vertical: pading24),
      child: Row(
        children: [
          //icon
          SizedBox(
            child: icon,
          ),
          //space
          SizedBox(
            width: w / 7,
          ),
          //Text
          GestureDetector(
            onTap: ontap,
            child: Text(text!, style: TextStyles.defaultStyle.ggfont16),
          )
        ],
      ),
    );
  }
}
