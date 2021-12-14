import 'package:assessment/widgets/cart_item.dart';
import 'package:assessment/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color.fromRGBO(51, 36, 99, 1),
        leading: Image.asset(
          'assets/images/logo_en.jpeg',
          fit: BoxFit.cover,
          height: 30,
        ),
        title: Text('profile'.tr),
        actions: [
          TextButton(
            onPressed: () async {
              await authService.signOut();
            },
            // ignore: prefer_const_constructors
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              color: const Color.fromRGBO(51, 36, 99, 1),
              // decoration: BoxDecoration(border: Border.all()),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      '0.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                    const Text(
                      ' LE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(border: Border.all()),
              child: GridView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const CartItem(
                    cartIcon: Icons.home_filled,
                    cartText: "Add a Branch",
                  ),
                  CartItem(
                    cartIcon: Icons.home_filled,
                    cartText: "Management Control",
                  ),
                  CartItem(
                    cartIcon: Icons.payment,
                    cartText: "Payment",
                  ),
                  CartItem(
                    cartIcon: Icons.notifications_on_rounded,
                    cartText: "Notification",
                  ),
                  CartItem(
                    cartIcon: Icons.settings,
                    cartText: "Settings",
                  ),
                  CartItem(
                    cartIcon: Icons.production_quantity_limits,
                    cartText: "Promotion",
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.3,
                ),
              ),
            )
          ],
        ),
      ),
    );

    // GridView.builder(gridDelegate: nul, itemBuilder: itemBuilder)
  }
}
