import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_model.dart';
import '../styles/clip.dart';
import '../styles/color.dart';

class BuildCategoryItem2 extends StatelessWidget {
  final WeatherModel model;
  final Forecastday forecastday;
  final int index;


  BuildCategoryItem2({
    super.key,
    required this.model,
    required this.forecastday,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160.0,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 80.0,
                    height: 50.0,
                    margin: const EdgeInsetsDirectional.only(top: 25.0),
                    decoration: BoxDecoration(
                      color: cardColor,
                      border: Border.all(color: cardColor, width: 0.0),
                      borderRadius: const BorderRadiusDirectional.only(
                        topStart: Radius.circular(20.0),
                        topEnd: Radius.circular(20.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // Shadow color
                          spreadRadius: 4, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: const Offset(
                              0, 8), // Offset in the x, y direction
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${forecastday.hour![index].tempC}',
                        style: const TextStyle(
                            color: Color(0xff276487),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: ClipClipper(),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: cardColor,
                      ),
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('images/${isWeatherImage()}'),
                height: 60.0,
                width: 60.0,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            border: Border.all(color: cardColor, width: 0.0),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(20.0),
              bottomEnd: Radius.circular(20.0),
              topEnd: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                spreadRadius: 4, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 10), // Offset in the x, y direction1
              ),
            ],
          ),
          height: 65.0,
          width: 175.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' ${model.current!.condition!.text}\n'
                          ' ${model.forecast!.forecastday![index].day!.condition!.text}>',
                      style: const TextStyle(
                          color: Color(0xff276487),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900),
                    ),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${model.forecast!.forecastday![0].day!.maxtempC}',
                              style: GoogleFonts.acme(
                                  color: const Color(0xff8eb1c4),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '°C',
                              style: TextStyle(
                                  color: Color(0xff8eb1c4),
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Text(
                          '~',
                          style: TextStyle(
                            color: Color(0xff8eb1c4),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${model.current!.tempC ?? "N/A"}',
                              style: GoogleFonts.acme(
                                  color: const Color(0xff8eb1c4),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '°C',
                              style: TextStyle(
                                  color: Color(0xff8eb1c4),
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    '${forecastday.date}',
                    style: const TextStyle(
                        color: Color(0xff276487),
                        fontSize: 13.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String isWeatherImage() {
    double temperature = forecastday.hour![index].tempC;

    if (temperature > 29.0) {
      return 'sun.png';
    } else if (temperature >= 25.0 && temperature <= 29.0) {
      return 'weather.png';
    } else if (temperature >= 20.0 && temperature < 25.0) {
      return 'normal.png';
    } else if (temperature >= 15.0 && temperature < 20.0) {
      return 'heavy-rain.png';
    } else if (temperature >= 3.0 && temperature < 15.0) {
      return 'cloudy.png';
    } else if (temperature >= 0.0 && temperature < 3.0) {
      return 'snow.png';
    } else {
      return 'wind.png';
    }
  }
}
