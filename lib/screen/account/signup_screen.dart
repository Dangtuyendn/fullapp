// import 'package:flutter/rendering.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/data/account/account_db.dart';
import 'package:toast/toast.dart';
import 'package:get/get.dart';
import 'package:studentapp/controller/list_controller.dart';
import 'package:studentapp/core/color_paletter.dart';
import 'package:studentapp/core/dismension.dart';
import 'package:studentapp/screen/account/login_screen.dart';
import 'package:studentapp/widget/textformfield_widget.dart';

import 'package:flutter/material.dart';
import 'package:studentapp/core/textstyle.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  ListController controller = Get.find();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var isObsecure = true.obs;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: LayoutBuilder(builder: (ctx, cons) {
            return Form(
                key: _formKey,
                child: SingleChildScrollView(
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
                        _formSignUp(context, isObsecure)
                      ],
                    ),
                  ),
                ));
          })),
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
            "Sign Up",
            style: TextStyles.defaultStyle.textOrange30,
          )
        ],
      ),
    );
  }

//Form SignUp
  _formSignUp(context, isObsecure) {
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
          //name
          TextFormFieldWiget(
              textcontroller: controller.nameEdittingController,
              icon: const Icon(Icons.people),
              hintext: "Name"),
          const SizedBox(
            height: textField,
          ),

          //email
          TextFormFieldWiget(
              textcontroller: controller.emailEdittingController,
              icon: Icon(Icons.email),
              hintext: "Email"),
          const SizedBox(
            height: textField,
          ),

          //password
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
          const SizedBox(
            height: pading20,
          ),

          //for got password
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {}, child: const Text("For Got Password")),
          ),
          const SizedBox(
            height: pading20,
          ),

          //Button Sign up
          GestureDetector(
            onTap: () {
              _signUp(context);
            },
            child: Container(
              width: w,
              height: h / 10,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(4, 8), // changes position of shadow
                    ),
                  ],
                  color: ColorPalette.backgroundColorSecond,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  "Sign Up",
                  style: TextStyles.defaultStyle.textheader,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: pading20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "a member?",
                style: TextStyles.defaultStyle.textblur,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                  child: const Text("Login"))
            ],
          ),
        ],
      ),
    );
  }

  //
  _signUp(context) async {
    String uname = controller.nameEdittingController.text;
    String email = controller.emailEdittingController.text;
    String passwd = controller.passEdittingController.text;

    if (_formKey.currentState!.validate()) {
      if (uname.isEmpty || email.isEmpty || passwd.isEmpty) {
        _showToast(context, 'All Field Required');
      } else {
        _formKey.currentState!.save();
//c1
        controller.addAcountDB();
        controller.showDataAcount();

//c2
        // Account newAccount =
        //     Account(name: uname, email: email, password: passwd);
        // await AccountDBHelper.insert(newAccount).then((userData) {
        //   _showToast(context, "Successfully Saved");
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (_) => LoginScreen()));
        // }).catchError((error) {
        //   print(error);
        //   _showToast(context, "Error: Data Save Fail");
        // });
        // controller.showDataAcount();
        // controller.nameEdittingController.clear();
        // controller.emailEdittingController.clear();
        // controller.passEdittingController.clear();
      }
    }
  }

//
  _showToast(BuildContext context, String msg) {
    Toast.show(msg, duration: Toast.lengthLong, gravity: Toast.bottom);
  }
}
