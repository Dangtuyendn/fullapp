import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/assignment/assignment.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/backgroundmain.jpg'),
          Column(
            children: [
              //appbar
              AppBarContainer(
                ontap: () {
                  Get.to(() => MainApp());
                },
                text: 'Assignment',
                icon: const Icon(
                  Icons.assignment,
                  color: ColorPalette.colorWhite,
                ),
              ),

              //body
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: pading24),
                decoration: const BoxDecoration(
                    color: ColorPalette.colorWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(pading24),
                      topRight: Radius.circular(pading24),
                    )),
                child: _body(context),
              ))
            ],
          )
        ],
      ),
    );
  }

  //body
  _body(context) {
    return ListView.builder(
        itemCount: assignmentList.length,
        itemBuilder: (context, index) {
          return _card(context, index);
        });
  }

  //
  _card(context, index) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h / 3,
      padding: const EdgeInsets.all(pading12),
      margin: const EdgeInsets.only(bottom: pading12),
      decoration: BoxDecoration(
        color: ColorPalette.azure3,
        borderRadius: BorderRadius.circular(pading20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // subject Name
          Container(
            padding: const EdgeInsets.all(pading12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(pading16),
                color: ColorPalette.greenColor),
            child: Text(
              assignmentList[index].subjectName!,
              style: TextStyles.defaultStyle.ggfont20,
            ),
          ),

          //title
          Text(
            assignmentList[index].title!,
            style: TextStyles.defaultStyle.ggfont20,
          ),

          //Start Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Start Date:', style: TextStyles.defaultStyle.ggfontgrey16),
              Text(
                assignmentList[index].startDate!,
                style: TextStyles.defaultStyle.ggfontblack16,
              )
            ],
          ),

          //End Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('End Date:', style: TextStyles.defaultStyle.ggfontgrey16),
              Text(
                assignmentList[index].endDate!,
                style: TextStyles.defaultStyle.ggfontblack16,
              )
            ],
          ),

          //status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Status:', style: TextStyles.defaultStyle.ggfontgrey16),
              Text(
                assignmentList[index].status!,
                style: TextStyles.defaultStyle.ggfontblack16,
              )
            ],
          ),

          //Button
          assignmentList[index].status == 'Submitted'
              ? Container()
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: pading12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(pading12),
                      color: ColorPalette.blue1),
                  alignment: Alignment.center,
                  child: Text(
                    assignmentList[index].status!,
                    style: TextStyles.defaultStyle.ggfont16,
                  ),
                )
        ],
      ),
    );
  }
}
