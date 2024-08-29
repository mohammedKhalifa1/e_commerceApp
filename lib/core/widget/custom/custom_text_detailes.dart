import 'package:flutter/material.dart';

class TextFromFiledDetails extends StatelessWidget {
  final double width;
  final String title;
  final String titleText;
  final IconData icon;
  final TextEditingController? controller;
  final bool? active;
  const TextFromFiledDetails(
      {super.key,
      required this.width,
      required this.title,
      required this.titleText,
      required this.icon,
      this.controller,
      this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w200),
            ),
            TextFormField(
              controller: controller,
              obscureText: active == false || active == null ? false : true,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                // labelText: title,
                hintText: titleText,
                hintStyle: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w300),

                labelStyle: const TextStyle(color: Colors.white, fontSize: 15),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ));
  }
}
