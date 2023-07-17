// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/data/account/account_db.dart';
import 'package:studentapp/screen/mainapp.dart';
import 'package:studentapp/screen/account/signup_screen.dart';
import 'package:studentapp/widget/textformfield_widget.dart';

import 'package:flutter/material.dart';
import 'package:studentapp/core/textstyle.dart';
import 'package:toast/toast.dart';

// ignore_for_file: prefer_const_constructors
class LoginScreen extends StatelessWidget {
  final ListController controller = Get.find();
  final Account? account;
  LoginScreen({super.key, this.account});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    var isObsecure = true.obs;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: LayoutBuilder(builder: (ctx, cons) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: cons.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //text
                    _text(context),

                    //form sign in
                    _body(context, isObsecure),
                  ],
                ),
              ),
            );
          })

          // Container(
          //         padding:
          //             // EdgeInsets.only(top: MediaQuery.of(context).size.height / 14),
          //             EdgeInsets.only(top: h * 0.07, left: w / 12, right: w / 12),

          ),
    );
  }

//text
  _text(context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
        left: w / 12,
        top: h / 14,
      ),
      width: w,
      height: h / 4,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi!",
            style: TextStyles.defaultStyle.textsplashscreen,
          ),
          const SizedBox(
            height: textField,
          ),
          Text(
            "Sign In",
            style: TextStyles.defaultStyle.textOrange30,
          )
        ],
      ),
    );
  }

//body
  _body(context, isObsecure) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
          left: w / 12, right: w / 12, bottom: h / 14, top: h / 14),
      width: w,
      height: h,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: [
          //Field Email
          TextFormFieldWiget(
              textcontroller: controller.emailEdittingController,
              icon: const Icon(Icons.email),
              hintext: "Email"),

          //pace
          const SizedBox(
            height: 30,
          ),

          // Field pass
          Obx(
            () => TextFormField(
              controller: controller.passEdittingController,
              obscureText: isObsecure.value,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: Obx(() => GestureDetector(
                        onTap: () {
                          isObsecure.value = !isObsecure.value;
                        },
                        child: Icon(
                          isObsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      )),
                  hintText: "Password"),
            ),
          ),

          //pace
          const SizedBox(
            height: 30,
          ),

          //Forgot password
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {}, child: const Text("For Got Password")),
          ),

          //
          const SizedBox(
            height: 30,
          ),

          //Button Sign In
          GestureDetector(
            onTap: () {
              _validate(context);
            },
            child: Center(
              child: Container(
                width: w,
                height: h / 10,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(4, 8), // changes position of shadow
                      ),
                    ],
                    color: ColorPalette.backgroundColorSecond,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyles.defaultStyle.textheader,
                  ),
                ),
              ),
            ),
          ),

          //pace
          const SizedBox(
            height: 20,
          ),

          //footer notmember & register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "not member?",
                style: TextStyles.defaultStyle.textblur,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(SignUpScreen());
                  },
                  child: const Text("register now"))
            ],
          ),
        ],
      ),
    );
  }

// func validate
  _validate(context) async {
    if (controller.emailEdittingController.text.isNotEmpty &&
        controller.passEdittingController.text.isNotEmpty) {
      await AccountDBHelper.getLoginUser(
              controller.emailEdittingController.text,
              controller.passEdittingController.text)
          .then((value) {
        if (value != null) {
          controller.box.write('key', controller.emailEdittingController.text);
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (_) => MainApp()),
          //     (Route<dynamic> route) => false);

          // c1
          // ListView.builder (
          //     itemCount: controller.listAccount.length,
          //     itemBuilder: (context, index) {
          //       Account newData = controller.listAccount[index];
          //       var dt=  Get.to(()=>MainApp(), arguments: controller.listAccount[index].name);
          //       return dt;
          //     });
          // controller.emailEdittingController.clear();
          // controller.passEdittingController.clear();

          //c2
          // Get.to(() => MainApp(), arguments: controller.nameEdittingController.text);
          Get.to(() => MainApp(),
              // () => MyHomePageScreen(),
              // arguments: controller.emailEdittingController.text
              arguments: controller.box
                  .write('key', controller.emailEdittingController.text));
          controller.emailEdittingController.clear();
          controller.passEdittingController.clear();
        } else {
          _showToast(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        _showToast(context, "Error: Login Fail");
      });
    } else if (controller.emailEdittingController.text.isEmpty ||
        controller.passEdittingController.text.isEmpty) {
      return _showToast(context, 'All field are required !');
    }
  }

  //Show Notification
  _showToast(BuildContext context, String msg) {
    Toast.show(msg, duration: Toast.lengthLong, gravity: Toast.bottom);
  }
}
