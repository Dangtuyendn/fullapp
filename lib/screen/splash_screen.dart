import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/core/image_helper.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:studentapp/screen/account/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            //oval
            const Positioned(
                top: 30,
                right: 0,
                child: Image(
                  image: AssetImage(ImageHelper.ovalRight),
                )),
            //line
            const Positioned(
                top: 0,
                right: 0,
                child: Image(
                  image: AssetImage(ImageHelper.lineRight),
                )),
            //oval
            const Positioned(
                bottom: 30,
                left: 0,
                child: Image(
                  image: AssetImage(ImageHelper.ovalLeft),
                )),
            //line
            const Positioned(
                bottom: 0,
                left: 0,
                child: Image(
                  image: AssetImage(ImageHelper.lineLeft),
                )),
            const Positioned(
                top: 120,
                left: 50,
                child: Image(
                  image: AssetImage(ImageHelper.circle),
                )),
            //box
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(image: AssetImage(ImageHelper.splash)),
                    Text(
                      "Student App",
                      style: TextStyles.defaultStyle.textsplashscreen,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyles.defaultStyle.textsplashscreen,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
