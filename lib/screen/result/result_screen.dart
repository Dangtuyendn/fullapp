import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';

class ResultScreen extends StatelessWidget {
  final ListController controller = Get.find();

  final Account? account;
  ResultScreen({super.key, this.account});

  @override
  Widget build(BuildContext context) {
    String? textName = controller.box.read('key');
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/backgroundcolor.jpg'),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //appbar
              AppBarContainer(
                ontap: () {
                  Get.to(() => MainApp());
                },
                text: 'Result',
                icon: Icon(
                  Icons.archive,
                  color: ColorPalette.colorWhite,
                ),
              ),

              //Row avatar  & name
              Container(
                padding: EdgeInsets.symmetric(horizontal: pading24),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: padinglr + 10,
                      backgroundColor: ColorPalette.colorWhite,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('assets/images/vodien2.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //space
                    SizedBox(
                      width: pading12,
                    ),

                    //name
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name : ${textName!}',
                          style: TextStyles.defaultStyle.ggfontheaderblack23,
                        ),
                        SizedBox(
                          height: pading12,
                        ),
                        Text(
                          'Class:',
                          style: TextStyles.defaultStyle.ggfontblack20,
                        )
                      ],
                    )
                  ],
                ),
              ),

              //list
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: pading24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //ranked
                    _getTask(
                        context,
                        Icon(
                          Icons.menu_book_rounded,
                          color: ColorPalette.blue1,
                        ),
                        'Ranked',
                        'text'),

                    //conduct
                    _getTask(
                        context,
                        Icon(
                          Icons.star,
                          color: ColorPalette.yellowColor,
                        ),
                        'Conduct',
                        'Good'),

                    //handle
                    _getTask(
                        context,
                        Icon(
                          Icons.people,
                          color: ColorPalette.blue,
                        ),
                        'Handle',
                        'Excelent'),

                    //everage
                    _getTask(
                        context,
                        Icon(
                          Icons.subject,
                          color: ColorPalette.redColor,
                        ),
                        'Everage Subject',
                        ''),

                    //Rank
                    _getTask(
                        context,
                        Icon(
                          Icons.list,
                          color: ColorPalette.greenColor,
                        ),
                        'Ranking List',
                        '2'),

                    //day off
                    _getTask(
                        context,
                        Icon(
                          Icons.offline_pin_rounded,
                          color: ColorPalette.colorOrange,
                        ),
                        'Day off',
                        '3')
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }

  _getTask(context, Icon icon, String name, String text) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h / 12,
      margin:
          EdgeInsets.only(left: pading24, right: pading24, bottom: pading12),
      padding: EdgeInsets.symmetric(horizontal: pading12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(pading12),
          color: ColorPalette.colorWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //icon
              icon,

              //space
              SizedBox(
                width: pading12,
              ),
              //name
              Text(
                name,
                style: TextStyles.defaultStyle.ggfontgrey16,
              ),
            ],
          ),

          //text
          Text(
            text,
            style: TextStyles.defaultStyle.ggfontblack16,
          )
        ],
      ),
    );
  }
}
