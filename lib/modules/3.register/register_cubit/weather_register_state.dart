
import '../../../model/register_model.dart';

abstract class WeatherRegisterState {}

class WeatherRegisterInitial extends WeatherRegisterState {}

class WeatherRegisterVisibilityState extends WeatherRegisterState {}

class WeatherRegisterLoadingState extends WeatherRegisterState {}

class WeatherRegisterSuccessState extends WeatherRegisterState {
  final RegisterModel? registerModel;

  WeatherRegisterSuccessState({required this.registerModel});
}

class WeatherRegisterErrorState extends WeatherRegisterState {
  final String error;

  WeatherRegisterErrorState({required this.error});
}
