import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget ?child;
  final void Function()? onPressed;
   CustomButton({super.key,  this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        child: MaterialButton(
          color: Colors.blue,
          padding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 50.0
          ),
          onPressed:onPressed,
          child:child
        ),
      ),
    );
  }
}
