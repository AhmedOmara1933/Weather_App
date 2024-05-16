import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_app/modules/screens/1.intro_page.dart';
import 'package:weather_app/shared/components/function.dart';

import '../../model/onboarding_model.dart';

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
        image: 'images/10105810-removebg-preview.png',
        text1: 'Explore the World\'s Weather with Ease',
        text2:'Experience accurate weather forecasts tailored to your location. Whether it\'s planning your day or embarking on an adventure, our app keeps you informed and prepared',),
    OnBoardingModel(
        image: 'images/view-3d-smiley-happy-sun-with-sky-background-removebg-preview.png',
        text1: 'Stay Ahead with Advanced Features',
        text2:
            'From hourly forecasts to severe weather alerts, our app provides comprehensive weather information at your fingertips. Customize your experience with features like radar maps and weather widgets'),
    OnBoardingModel(
        image: 'images/8501966-removebg-preview.png',
        text1: 'Savor Every Moment, Rain or Shine',
        text2:
            'Embrace every weather condition with confidence. Whether it\'s sunny skies or stormy clouds, our app ensures you\'re equipped with the knowledge to make the most of every day.'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white30
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/WhatsApp Image 2024-02-21 at 18.21.53_27a4c9e4.jpg'),
                fit: BoxFit.cover
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        navigateTo(context, IntroPage(), true);
                      },
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
                        fit: BoxFit.cover,
                        height: 400.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onBoardingModel[index].text1,
                              style: const TextStyle(
                                  fontSize: 40.0,
                                  height: 1.2,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              onBoardingModel[index].text2,
                              style: const TextStyle(
                                fontSize: 15.0,
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
                      isLast==true?ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: SizedBox(
                          child: MaterialButton(
                            color: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 100.0
                            ),
                            onPressed: () {
                             navigateTo(context, IntroPage(), true);
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
                      ):Row(
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
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //       const WeatherLoginScreen(),
                                    //     ));
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
          ),
        ));
  }
}
