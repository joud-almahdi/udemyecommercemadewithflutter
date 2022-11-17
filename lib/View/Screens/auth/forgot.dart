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
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: Formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFormField(
                    controller: emailcontroller,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? const Icon(
                            Icons.email,
                            color: pinkClr,
                            size: 30,
                          )
                        : Image.asset('assets/images/email.png'),
                    suffixIcon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressed: () {
                        if (Formkey.currentState!.validate()) {
                          String email = emailcontroller.text.trim();
                          controller.resetpassword(email);
                        }
                      },
                      text: "SEND",
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
