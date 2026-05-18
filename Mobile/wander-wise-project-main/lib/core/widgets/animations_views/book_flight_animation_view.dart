import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class BookFlightAnimation extends StatefulWidget {
  const BookFlightAnimation({super.key});

  @override
  State<BookFlightAnimation> createState() => _BookFlightAnimationState();
}

class _BookFlightAnimationState extends State<BookFlightAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        GoRouter.of(context).pop();
        GoRouter.of(context).push(AppRouter.kFlightBookView);
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
          AnimationsPaths.passportTravel,
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
