import 'package:flutter/material.dart';

class ImplicitasScreen extends StatefulWidget {
  static const name = "implicitas";
  const ImplicitasScreen({super.key});

  @override
  State<ImplicitasScreen> createState() => _ImplicitasScreenState();
}

class _ImplicitasScreenState extends State<ImplicitasScreen> {
  int value = 0;
  double _fontSize = 10;
  double _sizeContainer = 10;
  Color color = Colors.blue;
  bool isAnitatedSwitcher = false;

  void setAnimtedSwitcher() {
    setState(() {
      isAnitatedSwitcher = !isAnitatedSwitcher;
    });
  }

  void incrementSizeContainer() {
    setState(() {
      _sizeContainer += 20;
    });
  }

  void increment() {
    setState(() {
      value++;
      _fontSize += 5;
      if (value.isEven) {
        color = Colors.red;
      } else {
        color = Colors.blue;
      }
    });
  }

  void decrement() {
    if (value > 0) {
      setState(() {
        _fontSize -= 5;
        value--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Implicitas"),
        actions: [
          Switch(
            value: isAnitatedSwitcher,
            onChanged: (value) {
              setAnimtedSwitcher();
            },
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 700,
                width: double.infinity,
                color: Colors.primaries[3],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1, end: 0),
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.elasticInOut,
                      builder:
                          (BuildContext context, double value, Widget? child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.translate(
                              offset: Offset(-200 * value, 0),
                              child: Opacity(
                                opacity: (1 - value).clamp(0, 1),
                                child: Text(
                                  "Luis Carranza",
                                  style: textTheme.displaySmall,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(200 * value, 0),
                              child: const FlutterLogo(
                                size: 100,
                              ),
                            ),
                            Transform.rotate(
                              angle: value,
                              child: const FlutterLogo(
                                size: 100,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    TweenAnimationBuilder(
                      tween: IntTween(begin: 0, end: 500),
                      duration: const Duration(milliseconds: 1200),
                      builder: (BuildContext context, int value, _) {
                        return Text(
                          value.toString(),
                          style: textTheme.displayMedium,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.primaries[0],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: InkWell(
                        onTap: incrementSizeContainer,
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 450),
                          color: color,
                          height: _sizeContainer,
                          width: _sizeContainer,
                          child: const Text(
                            "Animated Controller",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.primaries[1],
                child: Column(
                  children: [
                    Text(
                      "Contador",
                      style: textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                    AnimatedDefaultTextStyle(
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: _fontSize,
                        color: color,
                      ),
                      duration: const Duration(seconds: 1),
                      child: Text(
                        value.toString(),
                        textAlign: TextAlign.center,
                        // style: textTheme.bodyLarge!.copyWith(fontSize: _fontSize),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                color: Colors.primaries[2],
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: isAnitatedSwitcher
                      ? ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const FlutterLogo(
                              size: 100,
                            );
                          },
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const FlutterLogo(
                              size: 100,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              increment();
            },
            child: const Text("+"),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: decrement,
            child: const Text("-"),
          ),
        ],
      ),
    );
  }
}
