import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/shared/cubit/weather_app_state.dart';
import 'package:weather_app/shared/network/remote.dart';
import '../../modules/2.home_screen.dart';
import '../../modules/3.location_screen.dart';
import '../../modules/5.profile_screen.dart';
import '../styles/color.dart';
import 'dart:io';

class WeatherAppCubit extends Cubit<WeatherAppState> {
  WeatherAppCubit() : super(WeatherAppInitial());

  static WeatherAppCubit get(context) => BlocProvider.of(context);
  List screens = [HomeScreen(), LocationScreen(), ProfileScreen()];
  List appBars = [
    AppBar(),
    AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: navBarColor,
      ),
    ),
    AppBar()
  ];
  int currentIndex = 1;
  File? image;
  final imagePicker = ImagePicker();

  //todo/////////////////////////////////////uploadCameraImage//////////////////////////////////////
  uploadCameraImage() async {
    await imagePicker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        image = File(value.path);
        emit(ImagePickerSuccessState(image: image!));
      } else {
        emit(ImagePickerCanceledState());
      }
    }).catchError((error) {
      emit(ImagePickerErrorState(error: error.toString()));
    });
  }

//todo/////////////////////////////////////changeBottomNavBar//////////////////////////////////////
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(WeatherChangeBottomNavBar());
  }

//todo/////////////////////////////////////getDayName//////////////////////////////////////

  String getDayName(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    // Use the 'weekday' property to get the day of the week (1 for Monday, 7 for Sunday)
    int dayOfWeek = dateTime.weekday;

    // Create a list of day names
    List<String> dayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    // Return the corresponding day name
    return dayNames[dayOfWeek - 1];
  }

  //todo/////////////////////////////////////searchWeatherData//////////////////////////////////////

  WeatherModel? weatherSearchModel;

  searchWeatherData({String? text}) {
    emit(SearchWeatherDataLoadingState());
    DioHelper.getData(url: 'v1/forecast.json', query: {
      'key': 'ea36ba7cf6fc4eb482a154659242402',
      'q': '$text ',
      'days': 1,
    }).then((value) {
      // weatherList = value.data;
      //  print(weatherList['forecast']['forecastday']);
      // for (var day in weatherList['forecast']['forecastday']) {
      //   print(day['astro']);
      // }
      weatherSearchModel = WeatherModel.fromJson(value.data);
      print(weatherSearchModel!.forecast!.forecastday![0].day!.mintempC);

      emit(SearchWeatherDataSuccessState());
    }).catchError((error) {
      emit(SearchWeatherDataErrorState(error: error.toString()));
      print(error);
    });
  }

//todo/////////////////////////////////////getWeatherData//////////////////////////////////////

  WeatherModel? weatherGetModel;

  getWeatherData() {
    emit(GetWeatherDataLoadingState());
    DioHelper.getData(url: 'v1/forecast.json', query: {
      'key': 'ea36ba7cf6fc4eb482a154659242402',
      'q': 'egypt',
      'days': 4,
    }).then((value) {
      weatherGetModel = WeatherModel.fromJson(value.data);
      emit(GetWeatherDataSuccessState());
    }).catchError((error) {
      emit(GetWeatherDataErrorState(error: error.toString()));
      print(error);
    });
  }
}
