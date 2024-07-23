import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/onboard_intropage.dart';
import 'package:fooddeliveryapp/pages/welcome_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller to keep track of which page we're on
  PageController _pageController = PageController();

  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage(
                color: Theme.of(context).colorScheme.primary,
                image: "assets/images/onboardburger.png",
                title: "Delicious Burgers",
                subTitle:
                    "Enjoy our wide range of mouth-watering burgers, made with the freshest ingredients. Order now and get it delivered to your doorstep.",
              ),
              IntroPage(
                color: Theme.of(context).colorScheme.secondary,
                image: "assets/images/onboardpizza.png",
                title: "Tasty Pizzas",
                subTitle:
                    "Indulge in our variety of pizzas, loaded with your favorite toppings. Perfect for any occasion, delivered hot and fresh.",
              ),
              IntroPage(
                color: Theme.of(context).colorScheme.tertiary,
                image: "assets/images/onboarddrinks.png",
                title: "Refreshing Drinks",
                subTitle:
                    "Quench your thirst with our selection of refreshing drinks. From sodas to smoothies, we have something for everyone.",
              ),
            ],
          ),
          // dot indicators
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                InkWell(
                    onTap: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text("skip")),

                // dot indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                ),

                // next or done
                onLastPage
                    ? InkWell(
                        // done: navigate to the welcome screen
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ));
                        },
                        child: Text("Done"),
                      )
                    : InkWell(
                        // next: go to the next page
                        onTap: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        child: Text("Next"),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
