import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/modules/3.register/register_screen.dart';
import 'package:weather_app/shared/components/custom_button.dart';
import 'package:weather_app/shared/components/function.dart';
import '../../layout/weather_home_layout.dart';
import '../../shared/components/text_form_field.dart';
import 'cubit/weather_login_cubit.dart';
import 'cubit/weather_login_state.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              // Fluttertoast.showToast(
              //     msg: state.loginModel.message!,
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.green,
              //     textColor: Colors.white,
              //     fontSize: 16.0);
              flutterToast(msg: state.loginModel.message!,backgroundColor: Colors.green);
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
              navigateTo(context, WeatherHomeLayout(), true);
            } else {
              // Fluttertoast.showToast(
              //     msg: state.loginModel.message!,
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.red,
              //     textColor: Colors.white,
              //     fontSize: 16.0);
              flutterToast(msg: state.loginModel.message!,backgroundColor: Colors.red);
              print(state.loginModel.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarColor: Colors.white30),
            ),
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'images/WhatsApp Image 2024-02-21 at 18.21.53_27a4c9e4.jpg'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'images/8950745-removebg-preview.png'),
                                height: 220.0,
                              ),
                            ],
                          ),
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Login here to browse our hot offers',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          DefaultTextFormField(
                            controller: cubit.emailController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Email Address must be fill';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'Email Address',
                            prefixIcon: Icons.email,
                          ),
                          DefaultTextFormField(
                            controller: cubit.passwordController,
                            keyboardType: TextInputType.phone,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Password must be fill';
                              }
                              return null;
                            },
                            obscureText: cubit.isPassword,
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            suffixIcon: cubit.isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffixOnPressed: () {
                              cubit.changePassword();
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  builder: (context) => CustomButton(
                                    onPressed: (){
                                      if (cubit.formKey.currentState!.validate()) {
                                        cubit.userLogin(
                                            email: cubit.emailController.text,
                                            password:
                                            cubit.passwordController.text);
                                      }
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context, WeatherRegisterScreen(), false);
                                },
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
