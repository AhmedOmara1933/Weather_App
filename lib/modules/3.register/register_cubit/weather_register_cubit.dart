import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/register_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote.dart';
import 'Weather_register_state.dart';

class WeatherRegisterCubit extends Cubit<WeatherRegisterState> {
  WeatherRegisterCubit() : super(WeatherRegisterInitial());

  static WeatherRegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

//todo/////////////passwordVisibility////////////////////////////////////

  void isPasswordVisibility() {
    isPassword = !isPassword;
    emit(WeatherRegisterVisibilityState());
  }

//todo/////////////RegisterPost/////////////////////////////////////////////

  RegisterModel? registerModel;

  userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    DioHelper2.postData(url: REGISTER, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      emit(WeatherRegisterSuccessState(registerModel: registerModel));
      print(value);
    }).catchError((error) {
      emit(WeatherRegisterErrorState(error: error.toString()));
    });
  }
}
