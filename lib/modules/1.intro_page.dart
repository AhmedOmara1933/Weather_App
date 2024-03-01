import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/layout/weather_home_layout.dart';
import 'package:weather_app/modules/3.location_screen.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xfffcfdff),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'images/WhatsApp Image 2024-02-21 at 01.39.01_24dc32b9.jpg'),
                fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Prepare to ',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff266386)),
                    ),
                    Text(
                      'be amazed ',
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff266386)),
                    ),
                  ],
                ),
                Text(
                  'by our weather ',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff266386)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'app\'s',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff266386)),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text(
                      'precision.',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff266386)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Stay informed and prepared with accurate ',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff266386)),
                ),
                Text(
                  'forecasts at your fingertips.',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      textBaseline: TextBaseline.alphabetic,
                      color: Color(0xff266386)),
                ),
              ],
            ),
            const SizedBox(
              height: 35.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                      child: MaterialButton(
                        color: const Color(0xff276487),
                        padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherHomeLayout(),));
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffcadce4), width: 2.0),
                        borderRadius: BorderRadiusDirectional.circular(20.0)),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                      child: MaterialButton(
                        color: Colors.white,
                        padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherHomeLayout(),));
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: Color(0xff457a98),
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
