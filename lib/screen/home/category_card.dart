import 'package:flutter/cupertino.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/data/home/category.dart';

class CategoryCard extends StatelessWidget {
  final int itemindex;
  final Category category;
  final VoidCallback? ontapN;
  CategoryCard(
      {super.key,
      required this.itemindex,
      required this.category,
      this.ontapN});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: category.ontap,
      // onTap: ontapN,
      child: Container(
        padding: const EdgeInsets.all(padingcategory),
        decoration: BoxDecoration(
          color: ColorPalette.colorWhite,
          borderRadius: BorderRadius.circular(pading20),
        ),
        child: Column(
          children: [
            //image
            SizedBox(
              width: w,
              height: h / 7,
              child: Image(
                image: AssetImage(category.thumbnail),
                fit: BoxFit.fitHeight,
              ),
            ),
            //text
            Text(category.name)
          ],
        ),
      ),
    );
  }
}
