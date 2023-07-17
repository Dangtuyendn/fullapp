import 'package:flutter/material.dart';
import 'package:studentapp/data/courses/courses.dart';
import 'package:studentapp/data/home/category.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/widget/appbar_container.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/widget/backgroundhome.dart';
import 'package:get/get.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({this.coursescategory, super.key});
  final Category? coursescategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackGroundHome(image: 'assets/images/background.jpg'),
        Column(
          children: [
            AppBarContainer(
              text: 'Category Courses',
              ontap: () {
                Get.to(() => MainApp());
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: pading24),
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: padinglr, vertical: padingcategory),
                  shrinkWrap: true,
                  itemCount: coursesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 24),
                  itemBuilder: (context, index) {
                    // return CoursesCard(courses: coursesList[index]);
                    return _card(context, index);
                  }),
            )
          ],
        ),
      ],
    ));
  }

  //card
  _card(context, index) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Column(
        children: [
          //thumbnail/ image
          SizedBox(
            width: w,
            height: h / 8,
            child: Image(image: AssetImage(coursesList[index].thumbnail)),
          ),
          Text(coursesList[index].name),
        ],
      ),
    );
  }
}
