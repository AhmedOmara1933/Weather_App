// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../shared/styles/color.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle(
//           systemNavigationBarColor: navBarColor,
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('images/Screenshot 2024-02-21 182537.png'),
//                 fit: BoxFit.cover)),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Profile Screen',
//                   style: TextStyle(
//                     fontSize: 25.0,
//                   ),
//                 )
//
//               ],
//             )
//           ],
//         ),
//       ),);
//   }
// }

import 'package:flutter/material.dart';

import '../shared/components/build_settings_card.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                            border: Border.all(color: Colors.blue, width: 3.0),
                            borderRadius:
                                BorderRadiusDirectional.circular(100)),
                        child: ClipRRect(
                          borderRadius: BorderRadiusDirectional.circular(100.0),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image(
                            image: NetworkImage('https://img.freepik.com/'
                                'free-photo/bohemian-man-with-his-arm'
                                's-crossed_1368-3542.jpg?t=st=1709267398~exp=17092709'
                                '98~hmac=adb9f29d5090c03cb4e4c8ed4cab2591a884bdc11cd6e3d16ebd358e'
                                '2d2e664f&w=740'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    Container(
                      height: 35.0,
                      width: 35.0,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.0),
                          color: Colors.blue,
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Ahmed Omara',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w900),
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
      ),
    );
  }
}
