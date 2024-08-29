import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  final double marginHorizontal;
  final double marginVertical;
  final String title;
  final VoidCallback onTap;
  final Color color;
  final double hight;
  final double? width;
  final String? imageName;
  const CustomContainerButton({
    super.key,
    required this.marginHorizontal,
    required this.marginVertical,
    required this.title,
    required this.onTap,
    required this.color,
    required this.hight,
    this.width,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal, vertical: marginVertical),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: imageName != null ? Border.all(color: Colors.grey) : null),
      height: hight,
      width: width,
      child: MaterialButton(
        onPressed: onTap,
        child: imageName == null
            ? Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w400),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Image.asset(imageName!)
                ],
              ),
      ),
    );
  }
}
