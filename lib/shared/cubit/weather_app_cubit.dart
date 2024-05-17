import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/shared/cubit/weather_app_state.dart';
import 'package:weather_app/shared/network/remote.dart';
import '../../model/profile_model.dart';
import '../../modules/4.screens/2.home_screen.dart';
import '../../modules/4.screens/3.location_screen.dart';
import '../../modules/4.screens/5.profile_screen.dart';
import '../components/constants/constants.dart';
import '../network/end_points.dart';
import '../styles/color.dart';
import 'dart:io';

class WeatherAppCubit extends Cubit<WeatherAppState> {
  WeatherAppCubit() : super(WeatherAppInitial());

  static WeatherAppCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherGetModel;
  WeatherModel? weatherSearchModel;
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
  //todo/////////////////////////////////////getProfileData////////////////////////////////////////


  ProfileModel? profileModel;

  void getProfileData() {
    emit(WeatherLoadingProfileDataState());
    DioHelper2.getData(
      token: token,
      url: PROFILE,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      print(profileModel!.data!.name);
      print(profileModel!.data!.phone);
      emit(WeatherSuccessProfileDataState(profileModel: profileModel));
    }).catchError((error) {
      emit(WeatherErrorProfileDataState(error: error.toString()));
      print(error);
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
    int dayOfWeek = dateTime.weekday;
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

  //todo/////////////////////////////////////getWeatherImage//////////////////////////////////////
  String getWeatherImage({required double model}) {
    double temperature = model;

    if (temperature > 25.0) {
      return 'sun.png';
    } else if (temperature >= 20.0 && temperature <= 25.0) {
      return 'weather.png';
    } else if (temperature >= 15.0 && temperature < 20.0) {
      return 'normal.png';
    } else if (temperature >= 10.0 && temperature < 15.0) {
      return 'heavy-rain.png';
    } else if (temperature >= 3.0 && temperature < 10.0) {
      return 'cloudy.png';
    } else if (temperature >= 0.0 && temperature < 3.0) {
      return 'snow.png';
    } else {
      return 'wind.png';
    }
  }

  //todo/////////////////////////////////////searchWeatherData//////////////////////////////////////

  searchWeatherData({String? text}) {
    emit(SearchWeatherDataLoadingState());
    DioHelper1.getData(url: 'v1/forecast.json', query: {
      'key': 'ea36ba7cf6fc4eb482a154659242402',
      'q': '$text ',
      'days': 4,
    }).then((value) {
      weatherSearchModel = WeatherModel.fromJson(value.data);
      print(weatherSearchModel!.forecast!.forecastday![0].day!.mintempC);

      emit(SearchWeatherDataSuccessState());
    }).catchError((error) {
      emit(SearchWeatherDataErrorState(error: error.toString()));
      print(error);
    });
  }

//todo/////////////////////////////////////getWeatherData//////////////////////////////////////

  getWeatherData() {
    emit(GetWeatherDataLoadingState());
    DioHelper1.getData(url: 'v1/forecast.json', query: {
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
