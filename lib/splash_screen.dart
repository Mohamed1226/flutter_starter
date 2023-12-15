import 'package:flutter/material.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Welcome to flutter starter app",
            style: Styles.font14PrimaryColorWeight500(color: Colors.black,fontSize: AppFontSize.fontSize_16),
          ),
        ],
    ),
      ),
    );
  }
}
