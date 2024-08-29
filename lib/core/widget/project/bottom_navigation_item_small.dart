import 'package:flutter/material.dart';

class BottomNavigationItemSmall extends StatelessWidget {
  final VoidCallback onTap;
  const BottomNavigationItemSmall({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
            color: const Color(0xff191919),
            borderRadius: BorderRadius.circular(10)),
        child: const Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
              Text(
                "  Add to Cart",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
