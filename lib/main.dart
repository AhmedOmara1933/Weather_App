import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/cubit/bloc_observer.dart';
import 'package:weather_app/shared/cubit/weather_app_cubit.dart';
import 'package:weather_app/shared/network/remote.dart';
import 'package:weather_app/shared/styles/color.dart';
import 'layout/weather_home_layout.dart';
import 'modules/1.intro_page.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherAppCubit()
            ..searchWeatherData()
            ..getWeatherData(),
        ),
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
          home: IntroPage()),
    );
  }
}
