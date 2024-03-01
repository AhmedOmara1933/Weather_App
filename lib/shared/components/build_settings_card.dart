import 'package:flutter/material.dart';

import '../styles/color.dart';

class BuildSettingsCard extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final void Function()? iconPressed;

  const BuildSettingsCard(
      {super.key,
        required this.text,
        required this.prefixIcon,
        this.iconPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10.0),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15.0,vertical: 10.0),
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadiusDirectional.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                prefixIcon,
                size: 35.0,
                color: Color(0xff276487),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '${text}',
                style: TextStyle(fontSize: 20.0,color: Color(0xff276487),fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 25.0,
              color: Color(0xff276487),
            ),
            onPressed: iconPressed,
          ),
        ],
      ),
    );
  }
}
