import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/features/Splash/presentation/views/widgets/splash_view/sliding_text_animation.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingTextAnimation;

  @override
  void initState() {
    super.initState();
    initialAnimation();
    navigateToFirstView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void initialAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingTextAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 200, width: 200, child: Image.asset(ImagesPaths.logo)),
        SlidingTextAnimation(slidingTextAnimation: slidingTextAnimation),
      ],
    );
  }

  void navigateToFirstView() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      GoRouter.of(context).push(AppRouter.kWelcomePagerView);
    });
  }
}
