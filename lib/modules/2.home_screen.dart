import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_app/shared/cubit/weather_app_cubit.dart';
import 'package:weather_app/shared/cubit/weather_app_state.dart';
import '../shared/components/build_category_item_1.dart';
import '../shared/components/build_category_item_2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit, WeatherAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = WeatherAppCubit.get(context);
        List weatherDetails = [
          [
            '${cubit.weatherGetModel!.current!.uv}',
            ' UV Index',
            'images/sun.png',
            ''
          ],
          [
            '${cubit.weatherGetModel!.current!.humidity.round()}',
            'Humidity',
            'images/water.png',
            '%'
          ],
          [
            '${cubit.weatherGetModel!.current!.windKph.round()}',
            'Wind',
            'images/wind.png',
            'km/h'
          ],
        ];
        String isWeatherImage() {
          double temperature = cubit.weatherGetModel!.current!.tempC;

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

        return Scaffold(
          appBar: AppBar(),
          body: cubit.weatherGetModel == null
              ? Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'images/Screenshot 2024-02-21 182537.png'),
                        fit: BoxFit.cover),
                  ),
                  child: LiquidPullToRefresh(
                    color: Colors.transparent,
                    backgroundColor: Color(0xff276487),
                    height: 300.0,
                    animSpeedFactor: 2,
                    onRefresh: () async {
                      cubit.getWeatherData();
                      return await Future.delayed(Duration(seconds: 1));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'images/Screenshot 2024-02-21 182537.png'),
                              fit: BoxFit.cover)),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, left: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${cubit.weatherGetModel!.current!.tempC}',
                                          style: GoogleFonts.acme(
                                              color: const Color(0xff276487),
                                              fontSize: 75.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 2.0),
                                          child: Text(
                                            'o',
                                            style: TextStyle(
                                              color: Color(0xff276487),
                                              fontSize: 30.0,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 10.0),
                                          child: Text(
                                            'c',
                                            style: TextStyle(
                                              color: Color(0xff276487),
                                              fontSize: 40.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Color(0xff276487),
                                        ),
                                        Text(
                                          '${cubit.weatherGetModel == null ? "N/A" : cubit.weatherGetModel!.location!.tzId}',
                                          style: const TextStyle(
                                              color: Color(0xff276487),
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15.0,
                                    ),
                                    Text(
                                      '${cubit.weatherGetModel!.forecast!.forecastday![0].day!.maxtempC} / ${cubit.weatherGetModel!.forecast!.forecastday![0].day!.mintempC ?? "N/A"} Feels like ${cubit.weatherGetModel!.forecast!.forecastday![0].day!.avgtempC ?? "N/A"} ',
                                      style: TextStyle(
                                          color: Color(0xff276487),
                                          fontSize: 14.0,
                                          letterSpacing: 0.5),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        'lastUpdate: ${cubit.weatherGetModel!.location!.localtime}',
                                        style: TextStyle(
                                          color: Color(0xff276487),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Image(
                                      image: AssetImage(
                                          'images/${isWeatherImage()}'),
                                      height: 160.0,
                                      width: 160.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsetsDirectional.only(

                                top: 20.0, bottom: 30.0),
                            height: 130.0,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 20.0),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    BuildCategoryItem(
                                      model: cubit.weatherGetModel,
                                      weatherSign: weatherDetails[index][3],
                                      weatherImage: weatherDetails[index][2],
                                      weatherCondition: weatherDetails[index]
                                          [1],
                                      weatherInfo: weatherDetails[index][0],
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                itemCount: weatherDetails.length),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Today',
                              style: TextStyle(
                                  color: Color(0xff276487),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35.0),
                            ),
                          ),
                          Image(
                            image: AssetImage(
                                'images/Screenshot_2024-03-01_042742-removebg-preview.png'),
                            fit: BoxFit.fill,
                            height: 200.0,
                          ),
                          Container(
                            margin: const EdgeInsetsDirectional.only(top: 0.0),
                            height: 150.0,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 20.0),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    BuildCategoryItem2(
                                      index: index,
                                      model: cubit.weatherGetModel!,
                                      forecastday: cubit.weatherGetModel!
                                          .forecast!.forecastday![index],
                                    ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                itemCount: cubit.weatherGetModel!.forecast!
                                    .forecastday!.length),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
