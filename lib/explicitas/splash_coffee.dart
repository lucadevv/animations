import 'package:animations/explicitas/coffee_challenge.dart';
import 'package:animations/explicitas/entites/coffe_entities.dart';
import 'package:flutter/material.dart';

class SplashCoffe extends StatelessWidget {
  const SplashCoffe({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -10) {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const CoffeSceen(),
                  );
                },
              ),
            );
          }
        },
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.brown.withOpacity(0.4),
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              height: size.height * 0.36,
              top: size.height * 0.20,
              right: 0,
              left: 0,
              child: Hero(
                tag: coffeeList[10].name,
                child: Image.asset(coffeeList[10].image),
              ),
            ),
            Positioned(
              height: size.height * 0.55,
              top: size.height * 0.4,
              right: 0,
              left: 0,
              child: Hero(
                tag: coffeeList[7].name,
                child: Image.asset(
                  coffeeList[7].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: size.height * 0.18,
              left: 0,
              right: 0,
              top: size.height * 0.6,
              child: Image.asset(
                "assets/coffee/logo.png",
              ),
            ),
            Positioned(
              height: size.height * 0.7,
              right: 0,
              left: 0,
              bottom: -size.height * 0.5,
              child: Hero(
                tag: coffeeList[0].name,
                child: Image.asset(
                  coffeeList[0].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
