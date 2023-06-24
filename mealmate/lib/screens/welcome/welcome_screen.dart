import 'package:flutter/material.dart';
import 'package:mealmate/constants.dart';
import 'package:mealmate/screens/onboarding/onboarding_screen.dart';


class WelcomeScreen extends StatefulWidget {
  static const routeName = "/welcome_screen";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
  
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/background.png"),
        //     fit: BoxFit.cover,
        //   )),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/chef_female.png"),
                width: 250,
                height: 200,
              ),
              const Text(
                "MealMate",
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 10),
              const Text(
                "Your AI friendly meal budget helper.",
                style: TextStyle(fontSize: 18),
              ),
              // how to add spacing
              const SizedBox(height: 30),
              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                
                      ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                  );
                },
                child: const Text("Get Started"),
                )
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}