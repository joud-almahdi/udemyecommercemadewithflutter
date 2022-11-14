//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemyecommerce/Logic/Controllers/authcontroller.dart';
import 'package:udemyecommerce/Routes/routes.dart';
import 'package:udemyecommerce/Utils/my_string.dart';
import 'package:udemyecommerce/Utils/theme.dart';
import 'package:udemyecommerce/View/Widgets/text_util.dart';

import '../../Widgets/Auth/authbutton.dart';
import '../../Widgets/Auth/authtextformfield.dart';
import '../../Widgets/Auth/checkedwidget.dart';
import '../../Widgets/Auth/containerunder.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                                text: "SIGN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                underline: TextDecoration.none),
                            SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                                text: "UP",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                underline: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: namecontroller,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return "Enter valid name";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: const Text(""),
                          hintText: "User Name",
                        ),
                        SizedBox(
                          height: 20,
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
                        SizedBox(
                          height: 50,
                        ),
                        CheckedWidget(),
                        SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: ((acontroller) {
                          return AuthButton(
                              text: "SIGN UP",
                              onPressed: () {
                                if (controller.ischecked == false) {
                                  Get.snackbar('Checkbox',
                                      'Please accept terms & conditions',
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM);
                                } else if (formkey.currentState!.validate()) {
                                  String name = namecontroller.text.trim();
                                  String email = emailcontroller.text.trim();
                                  String password = passwordcontroller.text;
                                  controller.signupusingfirebase(
                                      email: email,
                                      password: password,
                                      name: name);
                                  controller.ischecked = true;
                                }
                              });
                        })),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an account? ',
                texttype: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.LoginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
