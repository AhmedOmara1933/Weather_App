abstract class WeatherAppState {}

class WeatherAppInitial extends WeatherAppState {}

class WeatherChangeBottomNavBar extends WeatherAppState {}

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
