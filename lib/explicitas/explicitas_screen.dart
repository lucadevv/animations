import 'dart:math';

import 'package:flutter/material.dart';

class ExplecitasScreen extends StatefulWidget {
  static const String name = "explicitas";
  const ExplecitasScreen({super.key});

  @override
  State<ExplecitasScreen> createState() => _ExplecitasScreenState();
}

class _ExplecitasScreenState extends State<ExplecitasScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double valueSlider = 0.0;
  setValue(double value) {
    valueSlider = value;
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = (_controller.value) * 1200;
                return Transform(
                  transform: Matrix4.identity()
                    ..scale(pi * valueSlider)
                    ..rotateX(pi * valueSlider),
                  child: Opacity(
                    opacity: _controller.value,
                    child: Text(
                      value.round().toString(),
                      style: textTheme.displaySmall,
                    ),
                  ),
                );
              },
            ),
            Slider(
              value: valueSlider,
              onChanged: (value) {
                setState(() {
                  setValue(value);
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              _controller.forward(from: 0.0);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _controller.reverse();
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              // _controller.reverse();
              Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const MenuPage();
                },
              )
                  // MaterialPageRoute(builder: (context) {
                  //   return const MenuPage();
                  // }),
                  );
            },
            icon: const Icon(Icons.tap_and_play),
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // lowerBound: 1.0,
      // upperBound: 0.0,
    );
    _controller.reverse(from: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward(from: 0.0);
        Navigator.pop(context);
      },
      child: Material(
        color: Colors.black.withOpacity(0.2),
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          bottom: true,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              final value = (_controller.value * 150);

              return Transform.translate(
                offset: Offset(value, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.primaries[0],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.primaries[1],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.primaries[2],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
