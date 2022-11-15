import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../Logic/Controllers/authcontroller.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/my_string.dart';
import '../../../Utils/theme.dart';
import '../../Widgets/Auth/authbutton.dart';
import '../../Widgets/Auth/authtextformfield.dart';
import '../../Widgets/Auth/checkedwidget.dart';
import '../../Widgets/Auth/containerunder.dart';
import '../../Widgets/text_util.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final formkey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: "LOG",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                underline: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: "IN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                underline: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
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
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: ((controller) {
                          return AuthTextFormField(
                            controller: passwordcontroller,
                            obscureText: controller.isvisibility ? false : true,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password should be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/lock.png')
                                : Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: pinkClr,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isvisibility
                                  ? Icon(Icons.visibility_off)
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                              color: Colors.black,
                            ),
                            hintText: "Password",
                          );
                        })),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ForgotPassword);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextUtils(
                                  text: "Forgot Password?",
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  underline: TextDecoration.none),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: ((controller) {
                          return AuthButton(
                              text: "LOG IN",
                              onPressed: (() {
                                if (formkey.currentState!.validate()) {
                                  String email = emailcontroller.text.trim();
                                  String password = passwordcontroller.text;
                                  controller.loginusingfirebase(
                                      email: email, password: password);
                                }
                              }));
                        })),
                        SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                            text: "OR",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            underline: TextDecoration.none),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (() {}),
                              child: Image.asset("assets/images/facebook.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GetBuilder<AuthController>(
                              builder: ((controller) {
                                return InkWell(
                                    onTap: (() {
                                      controller.googlesignup();
                                    }),
                                    child: Image.asset(
                                        "assets/images/google.png"));
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have an account? ",
                texttype: 'Sign up',
                onPressed: () {
                  Get.offNamed(Routes.SignupScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
