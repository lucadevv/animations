import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const name = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _controllerRepet;
  late Animation<double> _animationScale;
  late Animation<double> _animationRotate;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controllerRepet = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationScale =
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
    _animationRotate = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);
    _animationController.forward();
    _controllerRepet.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controllerRepet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ScaleTransition(
              scale: _animationRotate,
              child: RotationTransition(
                turns: _controllerRepet,
                child: const FlutterLogo(
                  size: 150,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _animationController,
              child: ScaleTransition(
                scale: _animationScale,
                child: const FlutterLogo(
                  size: 150,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("+"),
            onPressed: () {
              _animationController.forward(from: 0.0);
            },
            child: const Text("+"),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            key: const Key("-"),
            onPressed: () {
              _animationController.reverse();
            },
            child: const Text("-"),
          ),
        ],
      ),
    );
  }
}
