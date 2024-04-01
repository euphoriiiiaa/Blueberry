import 'package:flutter/material.dart';

class ButtonToCart extends StatelessWidget {
  const ButtonToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffC2EFEB),
        ),
        height: 50,
        width: 200,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'В КОРЗИНУ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            Icon(Icons.shopping_cart_checkout)
          ],
        ),
      ),
    );
  }
}
