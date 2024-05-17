import 'dart:io';

import '../../model/profile_model.dart';

abstract class WeatherAppState {}

class WeatherAppInitial extends WeatherAppState {}

class WeatherChangeBottomNavBar extends WeatherAppState {}
class ImagePickerState extends WeatherAppState {}

class GetWeatherDataLoadingState extends WeatherAppState {}

class GetWeatherDataSuccessState extends WeatherAppState {}

class GetWeatherDataErrorState extends WeatherAppState {
  final String? error;

  GetWeatherDataErrorState({required this.error});
}

class SearchWeatherDataLoadingState extends WeatherAppState {}

class SearchWeatherDataSuccessState extends WeatherAppState {}

class SearchWeatherDataErrorState extends WeatherAppState {
  final String? error;

  SearchWeatherDataErrorState({required this.error});
}

class ImagePickerSuccessState extends WeatherAppState {
  final File image;

  ImagePickerSuccessState({required this.image});
}

class ImagePickerCanceledState extends WeatherAppState {}

class ImagePickerErrorState extends WeatherAppState {
  final String error;

  ImagePickerErrorState({required this.error});
}

class GetWeatherNameDataLoadingState extends WeatherAppState {}

class GetWeatherNameDataSuccessState extends WeatherAppState {}

class GetWeatherNameDataErrorState extends WeatherAppState {
  final String? error;

  GetWeatherNameDataErrorState({required this.error});
}

class WeatherLoadingProfileDataState extends WeatherAppState {}

class WeatherSuccessProfileDataState extends WeatherAppState {
  final ProfileModel? profileModel;

  WeatherSuccessProfileDataState({required this.profileModel});
}

class WeatherErrorProfileDataState extends WeatherAppState {
  final String error;

  WeatherErrorProfileDataState({required this.error});
}