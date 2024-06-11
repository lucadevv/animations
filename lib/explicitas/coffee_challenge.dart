import 'package:animations/explicitas/entites/coffe_entities.dart';
import 'package:flutter/material.dart';

double initialPage = 8.0;

class CoffeSceen extends StatefulWidget {
  const CoffeSceen({super.key});

  @override
  State<CoffeSceen> createState() => _CoffeSceenState();
}

class _CoffeSceenState extends State<CoffeSceen> {
  late PageController pageController;
  late PageController textPageController;

  double currentPage = initialPage;
  double textPage = initialPage;
  @override
  void initState() {
    pageController = PageController(
      viewportFraction: 0.35,
      initialPage: initialPage.toInt(),
    );
    textPageController = PageController(
      initialPage: initialPage.toInt(),
    );
    textPageController.addListener(_textScrollListener);
    pageController.addListener(_coffeeScrollListener);
    super.initState();
  }

  _textScrollListener() {
    textPage = currentPage;
  }

  _coffeeScrollListener() {
    setState(() {
      currentPage = pageController.page!;
    });
  }

  @override
  void dispose() {
    pageController.removeListener(_coffeeScrollListener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Align(
            alignment: AlignmentDirectional(0, 1),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.brown,
                      blurRadius: 90,
                      spreadRadius: 150,
                      offset: Offset.zero)
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (value) {
                if (value < coffeeList.length) {
                  textPageController.animateToPage(value,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut);
                }
              },
              itemCount: coffeeList.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }
                final item = coffeeList[index - 1];
                final result = currentPage - index + 1;
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);
                return Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(
                        0.0,
                        MediaQuery.of(context).size.height /
                            2.6 *
                            (1 - value).abs())
                    ..scale(value),
                  child: Opacity(
                    opacity: opacity,
                    child: SafeArea(
                      left: false,
                      top: false,
                      right: false,
                      bottom: true,
                      child: Hero(
                        tag: item.image,
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, kToolbarHeight, 0, 0),
            child: Align(
              alignment: const AlignmentDirectional(0, -1),
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: textPageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: coffeeList.length,
                        itemBuilder: (context, index) {
                          final item = coffeeList[index];
                          final opacity =
                              (1 - (index - textPage).abs()).clamp(0.0, 1.0);
                          return Opacity(
                            opacity: opacity,
                            child: Text(
                              textAlign: TextAlign.center,
                              item.name,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                            ),
                          );
                        },
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        "\$ ${coffeeList[currentPage.toInt()].price}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        key: Key(coffeeList[currentPage.toInt()].name),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
