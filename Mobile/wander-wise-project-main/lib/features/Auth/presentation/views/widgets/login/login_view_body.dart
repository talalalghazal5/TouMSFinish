import 'package:flutter/material.dart';
import 'package:wander_wise_app/core/utils/assets.dart';
import 'package:wander_wise_app/core/widgets/custom_background_image.dart';
import 'package:wander_wise_app/core/widgets/custom_container.dart';
import 'package:wander_wise_app/features/Auth/presentation/views/widgets/login/custom_login_column.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.width,
    required this.height,
    required this.passwordController,
    required this.emailController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final double width;
  final double height;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundImage(photoPath: ImagesPaths.background3 , width: width,),
        Center(
          child: CustomContainer(
            child: Form(
              key: _formKey,
              child: CustomLoginColumn(
                width: width,
                height: height,
                passwordController: passwordController,
                formKey: _formKey, emailController: emailController,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
