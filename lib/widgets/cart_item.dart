import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final IconData cartIcon;
  final String cartText;

  const CartItem({Key? key, required this.cartIcon, required this.cartText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(
              cartIcon,
              color: Colors.blue,
              size: 40,
            ),
            Text(
              cartText,
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
