import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/2.login/cubit/weather_login_state.dart';
import '../../../model/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //todo///////////////////////////changePassword///////////////////////
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    emit(LoginChangePasswordState());
  }

//todo///////////////////////////loginPostData//////////////////////////////
  LoginModel ?loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper2.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel:loginModel! ));
    }).catchError((error) {
      emit(LoginErrorState(error: error.toString()));
      print(error);
    });
  }
}
