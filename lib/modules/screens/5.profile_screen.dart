import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/cubit/weather_app_cubit.dart';
import 'package:weather_app/shared/cubit/weather_app_state.dart';
import '../../shared/components/build_settings_card.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit, WeatherAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/Screenshot 2024-02-21 182537.png'),
                  fit: BoxFit.cover)),
          child: ListView(
            padding: EdgeInsetsDirectional.only(top: 30.0),
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.blue, width: 3.0),
                              borderRadius:
                                  BorderRadiusDirectional.circular(100)),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadiusDirectional.circular(100.0),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: WeatherAppCubit.get(context).image == null
                                  ? Image(
                                      image: AssetImage('images/user.png'),
                                    )
                                  : Image.file(
                                      WeatherAppCubit.get(context).image!,
                                      fit: BoxFit.cover,
                                    ))),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.0),
                            color: Colors.blue,
                            shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {
                            showMenu(
                                elevation: 100.0,
                                shape: Border.all(
                                    color: Colors.black.withOpacity(0.2)),
                                context: context,
                                position:
                                    RelativeRect.fromLTRB(80, 200, 80, 200),
                                items: [
                                  // PopupMenuItem(
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     margin: EdgeInsetsDirectional.symmetric(
                                  //         horizontal: 10.0),
                                  //     child: MaterialButton(
                                  //       onPressed: () {
                                  //         WeatherAppCubit.get(context)
                                  //             .uploadGalleryImage;
                                  //       },
                                  //       child: Text(
                                  //         'Upload from gallery',
                                  //         style: TextStyle(color: Colors.white),
                                  //       ),
                                  //       color: Colors.blue,
                                  //     ),
                                  //   ),
                                  // ),
                                  PopupMenuItem(
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsetsDirectional.symmetric(
                                          horizontal: 10.0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          WeatherAppCubit.get(context)
                                              .uploadCameraImage();
                                        },
                                        child: Text(
                                          'Take from camera',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ]);
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Ahmed Omara',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'ahmedomara@gmail.com',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  BuildSettingsCard(
                    text: 'My Account',
                    prefixIcon: Icons.person_outlined,
                  ),
                  BuildSettingsCard(
                    text: 'Password',
                    prefixIcon: Icons.lock_open_outlined,
                  ),
                  BuildSettingsCard(
                    text: 'Privacy Policy',
                    prefixIcon: Icons.privacy_tip_outlined,
                  ),
                  BuildSettingsCard(
                    text: 'Privacy & Security',
                    prefixIcon: Icons.security,
                  ),
                  BuildSettingsCard(
                    text: 'Settings',
                    prefixIcon: Icons.settings,
                  ),
                  BuildSettingsCard(
                    text: 'Help Center',
                    prefixIcon: Icons.help_outline_outlined,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
