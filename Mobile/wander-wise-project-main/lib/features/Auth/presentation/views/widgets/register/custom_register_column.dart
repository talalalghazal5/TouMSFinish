import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/styles.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/register/custom_register_listview.dart';

class CustomRegisterColumn extends StatelessWidget {
  const CustomRegisterColumn({
    super.key,
    required this.width,
    required this.height,
    required this.passwordController,
    required this.confirmPasswordController,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.phoneNumberController, required this.userNameController,
  }) : _formKey = formKey;

  final double width;
  final double height;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController userNameController;
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
          child: Text('Register', style: textStyleSize30),
        ),
        Expanded(
          child: CustomRegisterListview(
            height: height,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            formKey: _formKey,
            width: width,
            emailController: emailController,
            userNameController: userNameController,
          ),
        ),
      ],
    );
  }
}
