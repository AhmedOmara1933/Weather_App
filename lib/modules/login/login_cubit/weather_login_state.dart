
import '../../../model/login_model.dart';

abstract class WeatherLoginStates {}

class WeatherLoginInitial extends WeatherLoginStates {}

class WeatherLoginVisibilityState extends WeatherLoginStates {}

class WeatherLoginLoadingState extends WeatherLoginStates {}

class WeatherLoginSuccessState extends WeatherLoginStates {
  final LoginModel ?loginModel;

  WeatherLoginSuccessState({required this.loginModel});
}

class WeatherLoginErrorState extends WeatherLoginStates {
  final String error;

  WeatherLoginErrorState({required this.error});
}
