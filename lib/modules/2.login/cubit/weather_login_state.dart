
import '../../../model/login_model.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginChangePasswordState extends LoginStates {}

//todo////////////////////loginPostData////////////////////////////////
class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}
