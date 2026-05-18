import 'package:flutter/material.dart';
import 'package:wander_wise_app/features/Splash/presentation/views/widgets/splash_view/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff4588B3),
        body: SplachViewBody(),
      ),
    );
  }
}