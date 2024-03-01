import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/shared/cubit/weather_app_state.dart';
import 'package:weather_app/shared/network/remote.dart';
import '../../modules/2.home_screen.dart';
import '../../modules/3.location_screen.dart';
import '../../modules/5.profile_screen.dart';

class WeatherAppCubit extends Cubit<WeatherAppState> {
  WeatherAppCubit() : super(WeatherAppInitial());

  static WeatherAppCubit get(context) => BlocProvider.of(context);
  List screens = [HomeScreen(), LocationScreen(), ProfileScreen()];
  int currentIndex = 1;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(WeatherChangeBottomNavBar());
  }

//Map<String,dynamic> weatherList = {};
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
