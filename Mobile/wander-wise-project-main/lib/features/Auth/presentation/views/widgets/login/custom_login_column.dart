import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/login/custom_login_listview.dart';

class CustomLoginColumn extends StatelessWidget {
  const CustomLoginColumn({
    super.key,
    required this.width,
    required this.height,
    required this.passwordController,
    required this.emailController,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final double width;
  final double height;
  final TextEditingController passwordController;
    final TextEditingController emailController;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.2,
            vertical: height * 0.05,
          ),
          child: Text(
            'Login',
            style: textStyleSize30,
          ),
        ),
        SizedBox(height: height * 0.03),
        Expanded(
          child: CustomLoginListview(
            height: height,
            passwordController: passwordController,
            formKey: _formKey,
            width: width, emailController: emailController,
          ),
        ),
      ],
    );
  }
}
