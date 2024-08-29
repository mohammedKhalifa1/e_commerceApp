import 'package:e_commerce/controller/account_controller.dart';
import 'package:e_commerce/core/class/status_request_handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AccountControllerImp());

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<AccountControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    for (int i = 0; i < controller.accountModel.length; i++)
                      Column(
                        children: [
                          Text(controller.accountModel[i].usersName!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Roboto")),
                          Text(
                            controller.accountModel[i].usersEmail!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  itemCount: controller.wid.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xfff2f7fb),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: controller.wid[index]['onTap'],
                      child: Row(
                        children: [
                          Icon(controller.wid[index]['icon'],
                              color: const Color(0xff6b6d6e)),
                          Text(
                            "  ${controller.wid[index]["name"]}",
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Color(0xff6b6d6e),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
