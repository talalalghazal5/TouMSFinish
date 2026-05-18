import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class FirstAnimationView extends StatefulWidget {
  const FirstAnimationView({super.key});

  @override
  State<FirstAnimationView> createState() => _FirstAnimationView();
}

class _FirstAnimationView extends State<FirstAnimationView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        GoRouter.of(context).pop();
        GoRouter.of(context).push(AppRouter.kCategoryView);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor3,
      body: Center(
        child: Lottie.asset(
          AnimationsPaths.planeIntro,
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
            _controller.forward();
          },
        ),
      ),
    );
  }
}