import 'package:flutter/material.dart';
import 'package:flutter_apps/src/presentation/core/animations/tween_animations.dart';
import 'package:flutter_apps/src/presentation/core/routes/router.dart';
import 'package:flutter_apps/src/presentation/views/ecommerce/ecommerce_view.dart';

class CartPaymentSuccess extends StatelessWidget {
  const CartPaymentSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(40.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              delay: 1,
              child: Image.network(
                'https://ouch-cdn2.icons8.com/7fkWk5J2YcodnqGn62xOYYfkl6qhmsCfT2033W-FjaA/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMjU5/LzRkM2MyNzJlLWFh/MmQtNDA3Ni04YzU0/LTY0YjNiMzQ4NzQw/OS5zdmc.png',
                width: 250,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const FadeAnimation(
              delay: 1.2,
              child: Text(
                'Payment Success! 🥳',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FadeAnimation(
              delay: 1.3,
              child: Text(
                'Hooray! Your payment proccess has \n been completed successfully..',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Colors.grey.shade700),
              ),
            ),
            const SizedBox(
              height: 140.0,
            ),
            FadeAnimation(
              delay: 1.4,
              child: MaterialButton(
                onPressed: () {
                  AppRouter.of(context).push(const EcommerceView());
                },
                height: 50,
                elevation: 0,
                splashColor: Colors.yellow[700],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.yellow[800],
                child: const Center(
                  child: Text(
                    "Back to Home",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const FadeAnimation(
              delay: 1.4,
              child: Text(
                'Thank you for shopping with us.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
