import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/authcontroller.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'package:udemyecommerce/View/Widgets/Auth/authbutton.dart';

import '../../../Utils/my_string.dart';
import '../../Widgets/Auth/authtextformfield.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final controller = Get.find<AuthController>();
  final Formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Forgot Password",
            style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          actions: [],
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Form(
            key: Formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close_rounded),
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "If you want to recover your account, please provide your email ID below...",
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/forgetpass copy.png",
                      height: 250,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                      controller: emailcontroller,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return "Enter valid email";
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: Get.isDarkMode
                          ? Image.asset('assets/images/email.png')
                          : Icon(
                              Icons.email,
                              color: pinkClr,
                              size: 30,
                            ),
                      suffixIcon: const Text(""),
                      hintText: "Email",
                    ),
                    SizedBox(height: 50),
                    GetBuilder<AuthController>(builder: ((controller) {
                      return AuthButton(
                          text: "SEND",
                          onPressed: (() {
                            if (Formkey.currentState!.validate()) {
                              String email = emailcontroller.text.trim();
                              controller.resetpassword(email);
                            }
                          }));
                    }))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
