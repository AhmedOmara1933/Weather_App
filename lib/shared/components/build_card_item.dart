import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/weather_model.dart';
import '../styles/clip.dart';
import '../styles/color.dart';

class BuildCardItem extends StatelessWidget {
  final WeatherModel? model;

  const BuildCardItem({Key? key, this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return Center(child: LinearProgressIndicator());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 180.0,
                  margin: const EdgeInsetsDirectional.only(top: 35.0),
                  decoration: BoxDecoration(
                    color: cardColor,
                    border: Border.all(color: cardColor, width: 0.0),
                    borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(30.0),
                      topEnd: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 4, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset:
                            const Offset(0, 8), // Offset in the x, y direction
                      ),
                    ],
                  ),
                  height: 100.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 15.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model!.current!.tempC}',
                          style: GoogleFonts.acme(
                              color: const Color(0xff276487),
                              fontSize: 65.0,
                              fontWeight: FontWeight.w600),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 7.0),
                          child: Text(
                            'o',
                            style: TextStyle(
                                color: Color(0xff276487),
                                fontSize: 45.0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ClipPath(
                  clipper: ClipClipper(),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: cardColor,
                    ),
                  ),
                ),
              ],
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 10.0, right: 15.0),
              child: Image(
                image: AssetImage('images/${isWeatherImage()}'),
                height: 120.0,
                width: 120.0,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            border: Border.all(color: cardColor, width: 0.0),
            borderRadius: const BorderRadiusDirectional.only(
              bottomStart: Radius.circular(30.0),
              bottomEnd: Radius.circular(30.0),
              topEnd: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                spreadRadius: 4, // Spread radius
                blurRadius: 7, // Blur radius
                offset: const Offset(0, 12), // Offset in the x, y direction1
              ),
            ],
          ),
          height: 150.0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              bottom: 20.0,
              right: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' ${model!.current!.condition!.text}\n'
                      ' ${model!.forecast!.forecastday![0].day!.condition!.text}>',
                      style: GoogleFonts.acme(
                          color: Color(0xff8eb1c4),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //${model!.forecast!.forecastday![0].day!.mintempC != null ?model!.forecast!.forecastday![0].day!.mintempC.toString() + '°C' : 'N/A'}
                              '${model!.forecast!.forecastday![0].day!.maxtempC}',
                              style: GoogleFonts.acme(
                                  color: const Color(0xff8eb1c4),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '°C',
                              style: TextStyle(
                                  color: Color(0xff8eb1c4),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            '~',
                            style: TextStyle(
                              color: Color(0xff8eb1c4),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // model!.forecast!.forecastday![0].day!.mintempC !=
                              //         null
                              //     ? '${model!.forecast!.forecastday![0].day!.mintempC}°C'
                              //     : 'N/A',
                              '${model!.current!.tempC ?? "N/A"}',
                              style: GoogleFonts.acme(
                                  color: const Color(0xff8eb1c4),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              '°C',
                              style: TextStyle(
                                  color: Color(0xff8eb1c4),
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${model!.location!.country}',
                          style: GoogleFonts.acme(
                              color: const Color(0xff276487),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${model!.location!.tzId}',
                          style: GoogleFonts.acme(
                              color: const Color(0xff276487),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

  String isWeatherImage() {
    double temperature = model!.current!.tempC;

    if (temperature > 25.0) {
      return 'sun.png';
    } else if (temperature >= 17.0 && temperature <= 24.0) {
      return 'weather.png';
    } else if (temperature >= 13.0 && temperature < 17.0) {
      return 'normal.png';
    } else if (temperature >= 8.0 && temperature < 13.0) {
      return 'heavy-rain.png';
    } else if (temperature >= 3.0 && temperature < 8.0) {
      return 'cloudy.png';
    } else if (temperature >= 0.0 && temperature < 3.0) {
      return 'snow.png';
    } else {
      return 'wind.png';
    }
  }
}
