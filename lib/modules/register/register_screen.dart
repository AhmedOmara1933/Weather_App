import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/register/register_cubit/Weather_register_state.dart';
import 'package:weather_app/modules/register/register_cubit/weather_register_cubit.dart';

import '../../shared/components/function.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/styles/color.dart';
import '../login/login_screen.dart';



// ignore: must_be_immutable
class WeatherRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherRegisterCubit(),
      child: BlocConsumer<WeatherRegisterCubit, WeatherRegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is WeatherRegisterSuccessState){
            if(state.registerModel!.status!){
              print(state.registerModel!.message);
              print(state.registerModel!.data!.token);
              navigateTo(context, WeatherLoginScreen(), true);
              flutterToast(msg: state.registerModel!.message!);
            }
            else{
              flutterToast(msg: state.registerModel!.message!);
            }
          }
        },
        builder: (context, state) {
          var cubit = WeatherRegisterCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  'images/Screenshot 2024-02-04 174847.png'),
                              height: 250.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'Register here to browse our hot offers',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        DefaultTextFormField(
                          margin: 10.0,
                          controller: nameController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' Name must be fill';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Name',
                          prefixIcon: Icons.person_outlined,
                        ),
                        DefaultTextFormField(
                          margin: 10.0,
                          controller: phoneController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' phone must be fill';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone',
                          prefixIcon: Icons.phone,
                        ),
                        DefaultTextFormField(
                          margin: 10.0,
                          controller: emailController,
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
                          margin: 10.0,
                          controller: passwordController,
                          obscureText: cubit.isPassword,
                          keyboardType: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be fill';
                            }
                            return null;
                          },
                          suffixIcon: cubit.isPassword == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixOnPressed: () {
                            cubit.isPasswordVisibility();
                          },
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                        ),
                        ConditionalBuilder(
                          condition: state is! WeatherRegisterLoadingState,
                          builder: (context) => MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                    name: emailController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Do you have an account ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, WeatherLoginScreen(), false);
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: baseColor),
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
          );
        },
      ),
    );
  }
}
