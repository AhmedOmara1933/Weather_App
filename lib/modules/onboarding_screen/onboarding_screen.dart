import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/onboarding_model.dart';
import '../login/login_screen.dart';


// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var controller = PageController();
  List<OnBoardingModel> onBoardingModel = [
    OnBoardingModel(
        image: 'images/Screenshot 2024-04-26 235848.png',
        text1: 'Instant\nHealth Solutions,\nNo Appointments',
        text2:
        'No Need for Appointments - Connect\nwith Top Doctors Instantly'),
    OnBoardingModel(
        image: 'images/Screenshot 2024-04-26 235903.png',
        text1: 'Discover Your\nIdeal Healthcare\nPartner',
        text2:
        'Choose from a Network of 3000+\nExperienced Doctors Ready to Assist You'),
    OnBoardingModel(
        image: 'images/Screenshot 2024-04-26 235911.png',
        text1: 'live Consultation\nwith Expert\nDoctors',
        text2:
        'Connect Live for Expert Medical Advice-\nYour Health,Your Time'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: const Text(
                      'SKIP',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(
                        onBoardingModel[index].image,
                      ),
                      fit: BoxFit.fill,
                      height: 400.0,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 30.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            onBoardingModel[index].text1,
                            style: const TextStyle(
                                fontSize: 40.0,
                                height: 1.2,
                                color: Color(0xffe09056),
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            onBoardingModel[index].text2,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1a2326),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onPageChanged: (index) {
                  if (index == onBoardingModel.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: onBoardingModel.length,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: controller, // PageController
                      count: onBoardingModel.length,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.blue,
                          dotWidth: 40.0,
                          spacing: 10,
                          dotHeight: 6.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            child: MaterialButton(
                              color: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 50.0
                              ),
                              onPressed: () {
                                controller.previousPage(
                                    duration:
                                    const Duration(milliseconds: 200),
                                    curve: Curves.bounceInOut);
                              },
                              child: isLast
                                  ? const Text(
                                'get started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              )
                                  : const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: SizedBox(
                            child: MaterialButton(
                              color: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 50.0
                              ),
                              onPressed: () {
                                if (isLast) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const WeatherLoginScreen(),
                                      ));
                                } else {
                                  controller.nextPage(
                                      duration:
                                      const Duration(milliseconds: 200),
                                      curve: Curves.bounceInOut);
                                }
                              },
                              child: isLast
                                  ? const Text(
                                'get started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              )
                                  : const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
