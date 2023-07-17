import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';

class Profile extends StatelessWidget {
  final ListController controller = Get.find();
  final Account? account;
  Profile({
    super.key,
    this.account,
  });

  @override
  Widget build(BuildContext context) {
    String? textName = controller.box.read('key');
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/background7.jpg'),
          Column(
            children: [
              //appbar
              AppBarContainer(
                text: 'Profile',
                icon: const Icon(
                  Icons.person,
                  color: ColorPalette.colorWhite,
                ),
              ),

              //circle avatar & infomation
              _header(context, textName),

              //form
              _form(context)
            ],
          )
        ],
      ),
    );
  }

//circle avatar & infomation
  _header(context, textName) {
    return Container(
      padding: const EdgeInsets.only(top: pading10, bottom: pading20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: padingappbar50 - 5,
            backgroundColor: ColorPalette.colorWhite,
            child: ClipOval(
              child: Image(
                image: AssetImage('assets/images/vodien2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: pading10,
          ),
          Text(textName!, style: TextStyles.defaultStyle.ggfontsubheader),
          const SizedBox(
            height: pading10,
          ),
          textName == 'tuyen12' || textName == 'tuyen3'
              ? Text(
                  'Class : 10T1/CNTT',
                  style: TextStyles.defaultStyle.ggfont20,
                )
              : Text('Class:...',
                  style: TextStyles.defaultStyle.ggfont20) // Text(

          //   style: TextStyles.defaultStyle.ggfont20,
          // ),

          //form
        ],
      ),
    );
  }

//form
  _form(context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Container(
      padding: const EdgeInsets.only(
          left: pading24, right: pading24, top: pading24 + 3, bottom: pading10),
      width: w,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(padingappbar50),
              topRight: Radius.circular(padingappbar50)),
          color: ColorPalette.colorWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Office Lesson
          _getRow(
            ColorPalette.blue1,
            const Icon(
              Icons.assignment,
              color: ColorPalette.colorWhite,
            ),
            'Office Lesson',
          ),

          //Calendar
          _getRow(
              ColorPalette.pinkColor,
              const Icon(
                Icons.calendar_today_rounded,
                color: ColorPalette.colorWhite,
              ),
              'Calendar'),

          //Messenger
          _getRow(
              ColorPalette.blue,
              const Icon(
                Icons.message,
                color: ColorPalette.colorWhite,
              ),
              'Messenger'),

          //Security
          _getRow(
              ColorPalette.colorOrange,
              const Icon(
                Icons.security,
                color: ColorPalette.colorWhite,
              ),
              'Security'),

          //help
          _getRow(
              ColorPalette.greenColor,
              const Icon(
                Icons.help,
                color: ColorPalette.colorWhite,
              ),
              'Help'),
        ],
      ),
    ));
  }

  _getRow(Color? color, Icon? icon, String? text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: pading12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Icon
          SizedBox(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(pading10),
                      color: color),
                  child: icon,
                ),
                const SizedBox(
                  width: pading24,
                ),
                Text(
                  text!,
                  style: TextStyles.defaultStyle.ggfontblack20,
                ),
              ],
            ),
          ),
          const Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
