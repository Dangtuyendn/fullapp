import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/data/home/category.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/widget/backgroundhome.dart';

class FeeScreen extends StatelessWidget {
 final  Category? category;
 const FeeScreen({this.category, super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(
            image: 'assets/images/gradient.png',
          ),
          Column(
            children: [
              AppBarContainer(
                ontap: () {
                  Get.to(()=>MainApp());
                },
                text: 'Fee',
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: padinglr),
                child: Column(
                  children: [
                    // total payment
                    Container(
                      width: w / 1,
                      height: h / 2.3,
                      decoration: BoxDecoration(
                          color: ColorPalette.blue1,
                          borderRadius: BorderRadius.circular(pading12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyles.defaultStyle.ggfont20,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            ' 1500',
                            style: TextStyles.defaultStyle.ggfontheader,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: pading20,
                    ),

                    //detail payment
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: pading16),
                      height: h / 2,
                      decoration: BoxDecoration(
                        color: ColorPalette.colorWhite,
                        borderRadius: BorderRadius.circular(pading12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment detail',
                            style: TextStyles.defaultStyle.ggfontheaderblack23,
                          ),
                          SizedBox(
                            height: h / 20,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              _rowDetail('Mask', '500'),
                              _rowDetail('History', '300'),
                              _rowDetail('English', '700'),
                            ],
                          ))

                          // mask
                        ],
                      ),
                    ),

                    //
                    const SizedBox(
                      height: pading20,
                    ),

                    // buy now
                    GestureDetector(
                      child: Container(
                        height: h / 7,
                        decoration: BoxDecoration(
                            color: ColorPalette.blue1,
                            borderRadius: BorderRadius.circular(pading12)),
                        alignment: Alignment.center,
                        child: Text(
                          'Buy Now',
                          style: TextStyles.defaultStyle.ggfont20,
                        ),
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

  _rowDetail(String name, String total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Image(image: AssetImage('assets/icons/icon_dola.png')),
            Text(
              name,
              style: TextStyles.defaultStyle.titlenotification,
            )
          ],
        ),
        Text(
          total,
          style: TextStyles.defaultStyle.ggfontblue20,
        )
      ],
    );
  }
}
