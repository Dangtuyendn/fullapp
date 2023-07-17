import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:studentapp/data/notification/notification.dart';

class NotificationScreen extends StatelessWidget {
  final ListController controller = Get.find();
  final Notifications? notifications;

  NotificationScreen({this.notifications, super.key});

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
                text: 'notification',
                ontap: () {
                  Get.to(() => MainApp());
                },
                icon: const Icon(
                  Icons.notifications,
                  color: ColorPalette.colorWhite,
                ),
              ),
              const SizedBox(
                height: pading24,
              ),

              //body
              //  c1    BodyNotification()
              _body(context)
            ],
          ),
        ],
      ),
    );
  }

  //----------------
  _body(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: pading10),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listNotification.length,
          itemBuilder: (context, index) {
            return _card(context, index);
          }),
    );
  }

  //
  _card(context, index) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: pading10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: pading16,
              bottom: pading16,
            ),
            width: w,
            height: 90,
            // height: h/5,
            decoration: const BoxDecoration(
                color: ColorPalette.colorWhite,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                //image
                SizedBox(
                    // child: Image(
                    //   image: AssetImage(notifications.image),
                    // ),
                    child: listNotification[index].image),

                //text
                Container(
                  padding: const EdgeInsets.only(
                      top: padingcategory,
                      bottom: padingcategory,
                      left: pading10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // '${notifications?.title}',
                        listNotification[index].title,
                        style: TextStyles.defaultStyle.titlenotification,
                      ),
                      Text(
                        listNotification[index].description,
                        style: TextStyles.defaultStyle.textblackcolor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //time
          Positioned(
            top: padingcategory,
            right: padingcategory,
            child: Text(listNotification[index].time),
          )
        ],
      ),
    );
  }
}
