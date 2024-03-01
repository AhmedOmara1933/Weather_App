import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import '../styles/clip.dart';
import '../styles/color.dart';

class BuildCategoryItem extends StatelessWidget {
  final WeatherModel? model;
  final String weatherImage;
  final String weatherCondition;
  final String weatherInfo;
  final String weatherSign;

  const BuildCategoryItem(
      {Key? key,
      this.model,
      required this.weatherImage,
      required this.weatherCondition,
      required this.weatherInfo, required this.weatherSign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 130.0,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 65.0,
                    height: 40.0,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,
                          left: 10.0,right: 2.0),
                          child: Text(
                            '${weatherInfo}',
                            style: const TextStyle(
                                color: Color(0xff276487),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        Text(
                          '${weatherSign}',
                          style: const TextStyle(
                              color: Color(0xff276487),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  ClipPath(
                    clipper: ClipClipper(),
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        color: cardColor,
                      ),
                    ),
                  ),
                ],
              ),
              Image(
                image: AssetImage('$weatherImage'),
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
          height: 50.0,
          width: 130.0,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, top: 15.0),
            child: Text(
              '$weatherCondition',
              style: TextStyle(
                  color: Color(0xff276487),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
