import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/cubit/weather_app_cubit.dart';
import 'package:weather_app/shared/cubit/weather_app_state.dart';
import '../shared/components/build_card_item.dart';
import '../shared/styles/color.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  // List weatherDetails = [
  //   ['38', 'Heavy Rain', 'Rome, Italy', '20', '29', 'images/heavy-rain.png'],
  //   ['42', 'Mostly Sunny', 'Milan, Italy', '25', '32', 'images/sun.png'],
  //   ['32', 'Very Cloudy', 'Paris, France', '19', '24', 'images/cloudy.png'],
  // ];

  LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit, WeatherAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = WeatherAppCubit.get(context);
        // var list =cubit.weatherList;
        return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: navBarColor,
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('images/Screenshot 2024-02-21 182537.png'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Around Your Country',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff266386)),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsetsDirectional.symmetric(vertical: 20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xffdeeff5),
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            // Shadow color
                            spreadRadius: 4,
                            // Spread radius
                            blurRadius: 7,
                            // Blur radius
                            offset: const Offset(
                                0, 8), // Offset in the x, y direction
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: Color(0xffcde3ec))),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xff487c9b),
                            ),
                            hintText: 'Search for a city',
                            hintStyle:
                                const TextStyle(color: Color(0xff487c9b))),
                        onChanged: (value) {
                          cubit.searchWeatherData(text: value);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              BuildCardItem(model: cubit.weatherSearchModel),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 22.0,
                              ),
                          //itemCount: cubit.weatherList.length
                          itemCount: 1),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
