import 'package:e_commerce/controller/auth.dart';
import 'package:e_commerce/core/class/font.dart';
import 'package:e_commerce/core/class/route_name.dart';
import 'package:e_commerce/core/widget/custom/custom_button.dart';
import 'package:e_commerce/core/widget/custom/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthControllerImp());
    return Scaffold(
      body: GetBuilder<AuthControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Text(
                "Create an account",
                style: FontApp.fontName
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Let’s create your account.",
                style: FontApp.fontName.copyWith(fontSize: 12),
              ),
              CustomTextFromField(
                controller: controller.nameSignIn,
                width: 10,
                title: "full name",
                icon: Icons.home,
                titleText: "Enter your full name",
              ),
              CustomTextFromField(
                controller: controller.emailSignIn,
                width: 10,
                title: "email",
                icon: Icons.home,
                titleText: "Enter your email address",
              ),
              CustomTextFromField(
                controller: controller.passwordSignIn,
                width: 10,
                title: "password",
                icon: Icons.home,
                titleText: "Enter your password",
              ),
              const Text(
                  "By signing up you agree to our Terms, Privacy Policy, and Cookie Use"),
              CustomContainerButton(
                  marginHorizontal: 10,
                  marginVertical: 10,
                  title: "SignIn",
                  onTap: () {
                    controller.signUp();
                  },
                  color: Colors.grey,
                  hight: 50),
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
                  title: "sign up with ",
                  onTap: () {},
                  color: Colors.white,
                  hight: 50),
              Center(
                child: Row(
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        // Get.to(
                        //   const LogIn(),
                        //   transition: Transition.leftToRight,
                        //   duration: const Duration(
                        //     seconds: 1,
                        //   ),
                        // );
                        Get.toNamed(RouteName.login);
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  Get.toNamed(
//                           RouteName.login,
//                         );