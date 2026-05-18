import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wander_wise_app/core/widgets/custom_buttom.dart';
import 'package:wander_wise_app/routes/app_router.dart';

class CustomThirdRow extends StatelessWidget {
  const CustomThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomBottom(
          title: 'Register',
          ontap: () {
            GoRouter.of(context).push(AppRouter.kRegisterView);
          },
        ),
        CustomBottom(
          title: 'Login',
          ontap: () {
            GoRouter.of(context).push(AppRouter.kLoginView);
          },
        ),
      ],
    );
  }
}
