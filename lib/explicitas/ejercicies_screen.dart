import 'package:flutter/material.dart';

class EjerciciesScreen extends StatefulWidget {
  const EjerciciesScreen({super.key});

  @override
  State<EjerciciesScreen> createState() => _EjerciciesScreenState();
}

class _EjerciciesScreenState extends State<EjerciciesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double heighContainer = 150.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101012),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final value = _controller.value;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _controller,
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.amber,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                ),
              ),
              SafeArea(
                child: Center(
                  child: Text(
                    "${(value * 100).round()} %",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
