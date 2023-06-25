import 'package:flutter/material.dart';
import 'package:mealmate/constants.dart';
import 'package:mealmate/screens/home/home_screen.dart';
import 'package:mealmate/screens/onboarding/components/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboarding_screen";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  late PageController _controller;

  List<Map<String, String>> onbordingData = [
    {
      "text": "Enter your budget \nand we will personalise \nyour recipe",
      "image": "assets/images/budget.png"
    },
    {
      "text": "Enter your region \nand we will personalise \nyour recipe",
      "image": "assets/images/region.png"
    },
    {
      "text": "Enter your allegies \nand we will tailor \nyour recipe",
      "image": "assets/images/allegies.png"
    },
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width * 1,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onbordingData.length,
                  itemBuilder: (context, index) => OnbordingContent(
                    text: onbordingData[index]['text'].toString(),
                    image: onbordingData[index]['image'].toString(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onbordingData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                          ),
                          onPressed: () {
                            if (currentPage == onbordingData.length - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          child: Text(
                            currentPage == onbordingData.length - 1
                                ? "Continue"
                                : "Next",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 6 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
