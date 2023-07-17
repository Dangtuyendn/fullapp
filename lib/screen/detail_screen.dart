import 'package:flutter/material.dart';
import 'package:studentapp/data/home/category.dart';
import 'package:studentapp/widget/appbar_container.dart';

class DetailScreen extends StatelessWidget {
  Category? category;
  DetailScreen({this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            AppBarContainer(
              text: category.toString(),
            ),
            // Body()
          ],
        ),
      ),
    );
  }
}
