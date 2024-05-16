import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/login/login_cubit/weather_login_state.dart';

import '../../../model/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote.dart';

class WeatherLoginCubit extends Cubit<WeatherLoginStates> {
  WeatherLoginCubit() : super(WeatherLoginInitial());

  WeatherLoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

//todo/////////////passwordVisibility////////////////////////////////////
  bool isPassword = true;

  void isVisibility() {
    isPassword = !isPassword;
    emit(WeatherLoginVisibilityState());
  }

//todo/////////////LoginPost/////////////////////////////////////////////

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(WeatherLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.data!.name);
      emit(WeatherLoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error);
      emit(WeatherLoginErrorState(error: error.toString()));
    });
  }
}
