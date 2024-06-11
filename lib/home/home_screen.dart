import 'package:animations/explicitas/coffee_challenge.dart';
import 'package:animations/explicitas/ejercicies_screen.dart';
import 'package:animations/explicitas/explicitas_screen.dart';
import 'package:animations/explicitas/splash_coffee.dart';
import 'package:animations/explicitas/star_screen.dart';
import 'package:animations/implicitas/implicitas_screen.dart';
import 'package:animations/implicitas/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              context.pushNamed(ImplicitasScreen.name);
            },
            title: const Text("Implicitas"),
            subtitle: const Text(
                "Animated Container, AnimatedDefaultTextstyle, AnimatedSwitcher, transfomr, tweenAnimationbuilder"),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(SplashScreen.name);
            },
            title: const Text("SpashScreen"),
            subtitle: const Text("Transition"),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(ExplecitasScreen.name);
            },
            title: const Text("Explecitas"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const EjerciciesScreen();
                  },
                ),
              );
            },
            title: const Text("Ejercicies"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SplashCoffe();
                  },
                ),
              );
            },
            title: const Text("Coffe Challenge"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const StarScreen();
                  },
                ),
              );
            },
            title: const Text("Start"),
          ),
        ],
      ),
    );
  }
}
