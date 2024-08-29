import 'package:flutter/material.dart';

class CustomSearchTextFromField extends StatelessWidget {
  final double width;

  final String titleText;
  final IconData icon;
  final TextEditingController? controller;
  final bool? active;
  final VoidCallback onTap;
  const CustomSearchTextFromField({
    super.key,
    required this.width,
    required this.icon,
    this.controller,
    this.active,
    required this.titleText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            obscureText: active == false || active == null ? false : true,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              // labelText: title,

              prefixIcon: TextButton(
                  onPressed: () {},
                  child: Icon(
                    icon,
                    color: Colors.grey,
                  )),
              hintText: titleText,
              hintStyle: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w300),
              // suffix: Icon(
              //   icon,
              //   color: Colors.black,
              // ),
              labelStyle: const TextStyle(color: Colors.white, fontSize: 15),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
