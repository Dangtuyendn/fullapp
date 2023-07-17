import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/widget/appbar_widget.dart';
import 'package:studentapp/data/home/category.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:studentapp/screen/home/textrow.dart';
import 'package:studentapp/screen/home/category_card.dart';

class MyHomePageScreen extends StatelessWidget {
  final ListController controller = Get.find();
  MyHomePageScreen({super.key, this.category, this.account});
  final Category? category;
  final Account? account;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var dataName = Get.arguments;
    // return AppBarWidget(title: "Hello", titleName: "Main");
    return Scaffold(
      body: Stack(
        children: [
          BackGroundHome(image: 'assets/images/backgroundmain2.jpg'),
          Column(
            children: [
              AppBarWidget(
                title: "Welcome!",
                // titleName: controller.listAccount.toString(),
                titleName: controller.box.read('key'),
              ),

              //Text category
              const TextRow(),
              //pace
              const SizedBox(
                height: padingRow * 2,
              ),

              //body
              Expanded(
                  child: SizedBox(
                height: h,
                width: w,
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: padinglr, vertical: padingcategory),
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 24),
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        itemindex: index,
                        category: categoryList[index],
                        //  ontapN: () {},
                        // ontapN: () {
                        //   Get.to(() => DetailScreen(
                        //         category: categoryList[index],
                        //       ));
                        // },
                      );
                    }),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
