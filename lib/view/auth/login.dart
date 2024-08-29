import 'package:e_commerce/core/class/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth.dart';
import '../../core/class/route_name.dart';
import '../../core/widget/custom/custom_button.dart';
import '../../core/widget/custom/text_field.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    AuthControllerImp controller = Get.put(AuthControllerImp());

    return Scaffold(
      body: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: ListView(
          children: [
            Text(
              "Login to your account",
              style: FontApp.fontName
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "It’s great to see you again.",
              style: FontApp.fontName
                  .copyWith(color: Colors.grey)
                  .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            CustomTextFromField(
              controller: controller.emailLogin,
              width: 10,
              title: "email",
              icon: Icons.home,
              titleText: "Enter your email address",
            ),
            CustomTextFromField(
              controller: controller.passwordLogin,
              width: 10,
              title: "password",
              icon: Icons.home,
              titleText: "Enter your password",
            ),
            Text(
              "Forgot your password? Reset your password",
              style: FontApp.fontName
                  .copyWith(color: Colors.grey)
                  .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            CustomContainerButton(
                marginHorizontal: 10,
                marginVertical: 10,
                title: "LogIn",
                onTap: () {
                  controller.logIn();
                },
                color: Colors.grey,
                hight: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.grey,
                  height: 0.5,
                ),
                const Center(
                  child: Text("   Or   "),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  color: Colors.grey,
                  height: 0.5,
                ),
              ],
            ),
            CustomContainerButton(
                marginHorizontal: 10,
                marginVertical: 10,
                imageName: "asset/images/logo_google.png",
                title: "LogIn with ",
                onTap: () {},
                color: Colors.white,
                hight: 50),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Row(
                children: [
                  const Text("Don’t have an account?  "),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RouteName.signUp);
                    },
                    child: const Text(
                      "Join",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
