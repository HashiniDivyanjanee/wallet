import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet/constants/appColor.dart';
import 'package:wallet/data/onboarding_data.dart';
import 'package:wallet/screens/onboarding/movingScreen.dart';
import 'package:wallet/screens/onboarding/start_screen.dart';
import 'package:wallet/screens/user_data_screen.dart';
import 'package:wallet/widget/custom_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  bool showPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showPage = index == 3;
                    });
                  },
                  children: [
                    const StartScreen(),
                    Movingscreen(
                      title: OnboardingData.onboardingList[0].title,
                      imagePath: OnboardingData.onboardingList[0].imagePath,
                      description: OnboardingData.onboardingList[0].description,
                    ),
                    Movingscreen(
                      title: OnboardingData.onboardingList[1].title,
                      imagePath: OnboardingData.onboardingList[1].imagePath,
                      description: OnboardingData.onboardingList[1].description,
                    ),
                    Movingscreen(
                      title: OnboardingData.onboardingList[2].title,
                      imagePath: OnboardingData.onboardingList[2].imagePath,
                      description: OnboardingData.onboardingList[2].description,
                    ),
                  ],
                ),

                // Smooth Page Indicator
                Container(
                  alignment: Alignment(0, 0.70),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: AppMainColor,
                      dotColor: AppgrayColor,
                    ),
                  ),
                ),

                // Navigation Button
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: Duration(microseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustomButtonWidget(
                              btnName: showPage ? 'Get Start' : 'Next',
                              btnColor: AppMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDataScreen(),
                                ),
                              );
                            },
                            child: CustomButtonWidget(
                              btnName: showPage ? 'Get Started' : 'Next',
                              btnColor: AppMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
