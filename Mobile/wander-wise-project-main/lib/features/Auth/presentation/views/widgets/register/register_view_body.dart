import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/widgets/custom_background_image.dart';
import 'package:wander_wise_app/core/widgets/custom_container.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/register/custom_register_column.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.width,
    required this.height,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.emailController,
    required this.phoneNumberController,
    required this.userNameController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final double width;
  final double height;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController userNameController;

  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(photoPath: ImagesPaths.background3, width: width),
        Center(
          child: CustomContainer(
            child: Form(
              key: _formKey,
              child: CustomRegisterColumn(
                width: width,
                height: height,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                formKey: _formKey,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                userNameController: userNameController,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
