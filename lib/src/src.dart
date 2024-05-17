import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/1.onboarding/onboarding_screen.dart';
import '../shared/cubit/weather_app_cubit.dart';
import '../shared/styles/color.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WeatherAppCubit()
              ..searchWeatherData()
              ..getWeatherData()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              elevation: 0.0,
              toolbarHeight: 0.0,
              color: baseColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: baseColor,
                systemNavigationBarColor: navBarColor,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: OnBoardingScreen()),
    );
  }
}
